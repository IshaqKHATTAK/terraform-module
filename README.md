# Steps

### 1. Set the platform keys and plugins using set command on termnal (access key and access key id).
### 2. Set the terraform.tfvars file with all the envs inside prod and dev.
### 3. then run the commands
    terraform init (to initlize)
    terraform plan (to see the changes or resouce that will be created)
    terraform apply (to apply the changes to the platform)
    terraform destroy (to destroy or remove allt he provisioned resouces by the statefile of this project)