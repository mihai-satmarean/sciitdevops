TERRAFORM AWS S3 BUCKETS MODULE

To keep our work well structured, ww will use separate folders for each type of resource. In our case, for modules we will use "terraform-modules".

The structure of this project is:
Main folder - terraform
	Subfolder - terraform-modules
		Subfolder - tf-s3-module

In the "terraform" folder we have 2 files:
1. readme.md - this is the file that contains valuable information about the project
2. s3.tf - this is the file that we will use to create our AWS S3 buckets. In this file we need to change the "name" and "owner" vars to our desire. 
Also, we can specify more variables (ex. acl, force_destroy, etc) or use the default ones in the module folder.

In the "terraform-modules" folder we will create separate folders for each module. The first one is the AWS S3 Module, "tf-s3-module", that contains 
the code for a module that we will use to manage the AWS S3 buckets in an easy and organized way, using variables. The folder contains 4 files:
1. inputs.tf - this file contains the variables we can use with our module
2. outputs.tf - this file contains the output variables we need from the job execution output
3. versions.tf - this file contains the module version as well as the minimum required version (using an older version may lead to errors as variables may not be implemented, etc.)
4. main.tf - this is the main module file

