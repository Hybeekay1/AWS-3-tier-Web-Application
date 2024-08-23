aws_region = "us-west-1"
vpc_name   = "my-webapp-vpc"
vpc_cidr   = "10.0.0.0/16"

public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones = ["us-west-1a", "us-west-1b"]

db_identifier  = "my-webapp-db"
db_username    = "malik" # Replace with your desired RDS username
s3_bucket_name = "my-webapp-bucket-malik"

