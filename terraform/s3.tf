module "s3_bucket" {
  source = "git::https://github.com/mihai-satmarean/sciitdevops/blob/main/terraform/terraform-modules/tf-s3-modules/"     # se va modifica in functie de locatia modulului in GitHub

  name  = "nume"                  # numele tag-ului ce il atribuim resursei
  owner = "owner"                 # numele owner-ului resursei

  s3_bucket_names = ["mariusb_devops_bucket1"]
  acl             = "private"
  force_destroy   = false

}
