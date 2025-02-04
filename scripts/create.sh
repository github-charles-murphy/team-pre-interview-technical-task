#!/bin/bash

# Check if directory argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <path-to-terraform-directory>"
  exit 1
fi

# Source the environment variables
source ./ .env

# Navigate to the provided directory
cd "$1" || exit

# Initialize Terraform with the backend config
terraform init \
  -backend-config="bucket=noths-lab-recruitment-terraform" \
  -backend-config="key=states/${TF_VAR_username}/terraform.state" \
  -backend-config="region=${TF_VAR_region}"

# Apply Terraform configuration
terraform apply -auto-approve
