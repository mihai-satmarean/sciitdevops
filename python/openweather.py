### Example Code: Fetch Weather Data for a City

import requests

# Your OpenWeatherMap API key (replace with your actual key)
API_KEY = '0c624616aac8eb7faa80df140cb139d7'
BASE_URL = 'http://api.openweathermap.org/data/2.5/weather'

# Prompt the user for a city name
city = input("Enter city name: ")

# Construct the request URL
params = {
    'q': city,
    'appid': API_KEY,
    'units': 'metric'  # Get temperature in Celsius
}

# Fetch data from the API
response = requests.get(BASE_URL, params=params)

if response.status_code == 200:
    data = response.json()
    # Extract and display relevant information
    print(f"City: {data['name']}")
    print(f"Temperature: {data['main']['temp']}°C")
    print(f"Temperature between {data['main']['temp_min']}°C and {data['main']['temp_max']}°C")
    print(f"Weather: {data['weather'][0]['description']}")
    print(f"The sun will rise at {data['sys'][strftime('%Y-%m-%d %H:%M:%S')]['sunrise']} and will set at {data['sys']['sunset']}")
else:
    print("Error fetching data. Please check the city name or API key.")


