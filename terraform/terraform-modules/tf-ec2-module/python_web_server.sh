#!/bin/bash
# Install necessary packages
sudo apt-get update
sudo apt-get install -y python3 python3-flask unzip
cd /home/ubuntu
wget https://github.com/corydolphin/flask-cors/archive/refs/heads/main.zip
unzip main.zip
cd flask-cors-main/
sudo python3 setup.py install
mkdir -p /var/www/html
chown -R ubuntu:ubuntu /var/www/html
echo 'import http.server' > /var/www/html/http_server.py
echo 'import socketserver' >> /var/www/html/http_server.py
echo 'PORT = 8000' >> /var/www/html/http_server.py
echo 'DIRECTORY' >> /var/www/html
echo 'Handler = http.server.SimpleHTTPRequestHandler' >> /var/www/html/http_server.py
echo 'with socketserver.TCPServer(("", PORT), Handler) as httpd:' >> /var/www/html/http_server.py
echo '    print("Serving at port", PORT)' >> /var/www/html/http_server.py
echo '    httpd.serve_forever()' >> /var/www/html/http_server.py

# Create app.py
cat <<EOL > /var/www/html/app.py
from flask import Flask, request, jsonify
from flask_cors import CORS
import requests

app = Flask(__name__)
CORS(app)

BING_API_KEY = 'BING API KEY'  # Replace with your Bing API key

def get_image_url(city):
    headers = {"Ocp-Apim-Subscription-Key": BING_API_KEY}
    params = {"q": city, "count": 1}
    response = requests.get("https://api.bing.microsoft.com/v7.0/images/search", headers=headers, params=params)
    response.raise_for_status()
    search_results = response.json()
    return search_results["value"][0]["contentUrl"]

@app.route('/weather', methods=['GET'])
def get_weather():
    city = request.args.get('city')
    if not city:
        return jsonify({'error': 'City name is required'}), 400

    api_key = 'OpenWeatherMap API KEY'  # Replace with your OpenWeatherMap API key
    url = f'http://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}&units=metric'

    response = requests.get(url)
    if response.status_code != 200:
        return jsonify({'error': 'Failed to fetch weather data'}), response.status_code

    weather_data = response.json()
    image_url = get_image_url(city)
    weather_data["image_url"] = image_url
    return jsonify(weather_data)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
EOL

# Create index.html
cat <<'EOL' > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather App</title>
    <style>
        body {
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white;
            text-shadow: 2px 2px 4px #000000;
        }
        #weatherResult {
            background-color: rgba(0, 0, 0, 0.5);
            padding: 20px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <h1>Weather App</h1>
    <form id="weatherForm">
        <label for="city">Enter City Name:</label>
        <input type="text" id="city" name="city" required>
        <button type="submit">Get Weather</button>
    </form>
    <div id="weatherResult"></div>

    <script>
        document.getElementById('weatherForm').addEventListener('submit', function(event) {
            event.preventDefault();
            const city = document.getElementById('city').value;
            fetch(`http://${window.location.hostname}:5000/weather?city=${city}`)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    const weatherResult = document.getElementById('weatherResult');
                    if (data.error) {
                        weatherResult.innerHTML = `<p>${data.error}</p>`;
                    } else {
                        document.body.style.backgroundImage = `url(${data.image_url})`;
                        weatherResult.innerHTML = `
                            <h2>Weather in ${data.name}</h2>
                            <p>Temperature: ${data.main.temp}°C</p>
                            <p>Weather: ${data.weather[0].description}</p>
                            <p>Humidity: ${data.main.humidity}%</p>
                            <p>Pressure: ${data.main.pressure} hPa</p>
                            <p>Wind Speed: ${data.wind.speed} m/s</p>
                            <p>Wind Direction: ${data.wind.deg}°</p>
                            <p>Cloudiness: ${data.clouds.all}%</p>
                            <p>Sunrise: ${new Date(data.sys.sunrise * 1000).toLocaleTimeString()}</p>
                            <p>Sunset: ${new Date(data.sys.sunset * 1000).toLocaleTimeString()}</p>
                        `;
                    }
                })
                .catch(error => {
                    const weatherResult = document.getElementById('weatherResult');
                    weatherResult.innerHTML = `<p>Error: ${error.message}</p>`;
                });
        });
    </script>
</body>
</html>

EOL
chown -R ubuntu:ubuntu /var/www/html
# Start the Flask app
cd /var/www/html
nohup python3 app.py &
# Start the web server
nohup python3 -m http_server.py 8000 &
