# CMG-proj

# Terraform AKS Cluster

This project sets up an Azure Kubernetes Service (AKS) cluster using Terraform.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine
- An Azure subscription
- Azure CLI installed on your machine
- A Service Principal with Contributor permissions to your subscription

## Usage

1. Clone this repository
2. Change into the `root` directory
3. Set the following environment variables:
   - `ARM_SUBSCRIPTION_ID` - The Azure subscription ID you want to use
   - `ARM_CLIENT_ID` - The client ID of your Service Principal
   - `ARM_CLIENT_SECRET` - The client secret of your Service Principal
   - `ARM_TENANT_ID` - The tenant ID of your Service Principal
4. Run `terraform init` to initialize the working directory
5. Run `terraform plan` to see the changes Terraform will make
6. Run `terraform apply` to create the AKS cluster
7. Run `terraform destroy` to destroy the AKS cluster when you're done

## Directory Structure

- `root`: The root directory contains the main Terraform files for setting up the AKS cluster and other resources.
- `modules`: This directory contains submodules for creating specific resources like the AKS cluster, virtual network, and more.
- `app`: This directory contains the Kubernetes manifests for deploying your application to the AKS cluster.
- `network`: This directory contains the Terraform files for setting up the virtual network and subnet.
- `rg`: This directory contains the Terraform files for creating the resource group.

## Authors

- [Ahmed Ayachi](https://github.com/ahmeds02)

## License

This project is licensed under https://github.com/ahmeds02.
