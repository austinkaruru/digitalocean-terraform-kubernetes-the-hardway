# DigitalOcean Terraform for Kubernetes The Hard Way

This project contains Terraform configurations to provision the necessary infrastructure on DigitalOcean to follow the [Kubernetes The Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way) tutorial by Kelsey Hightower.

It creates the following resources:
*   1 Jumpbox Droplet (`jumpbox`)
*   1 Control Plane Droplet (`server`)
*   2 Worker Node Droplets (`node-0`, `node-1`)
*   An SSH key added to your DigitalOcean account for accessing the Droplets.

## Prerequisites

Before you begin, ensure you have the following:

*   Terraform installed on your local machine.
*   A DigitalOcean account.
*   A [DigitalOcean Personal Access Token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) with read and write permissions.
*   An SSH key pair generated on your local machine (e.g., in `~/.ssh/id_rsa.pub`).

## Getting Started

1.  **Clone this repository.**

2.  **Configure Variables**

    The project requires your DigitalOcean token and the path to your public SSH key. The recommended way to provide these is by creating a `terraform.tfvars` file in the root of the project.

    Create a file named `terraform.tfvars`:
    ```terraform
    # terraform.tfvars
    do_token     = "your_digitalocean_personal_access_token"
    public_key   = "/path/to/your/public/key.pub" // e.g., "~/.ssh/id_rsa.pub"
    ```

    > **Security Note:** Be sure to add `terraform.tfvars` to your `.gitignore` file to prevent committing secrets to your repository.

    Alternatively, you can export them as environment variables:
    ```sh
    export TF_VAR_do_token="your_digitalocean_personal_access_token"
    export TF_VAR_public_key="~/.ssh/id_rsa.pub"
    ```

3.  **Initialize Terraform**

    Run `terraform init` to download the DigitalOcean provider and initialize the backend.
    ```sh
    terraform init
    ```

4.  **Plan and Apply**

    Run `terraform plan` to review the infrastructure changes that will be made.
    ```sh
    terraform plan
    ```

    If the plan is acceptable, apply the changes to create the resources on DigitalOcean.
    ```sh
    terraform apply
    ```

## Customization

You can customize the Droplet sizes, region, and image by modifying the default values in `variables.tf` or by overriding them in your `terraform.tfvars` file.

*   `region`: The DigitalOcean region for your resources (default: `nyc3`).
*   `image`: The OS image for the Droplets (default: `ubuntu-25-10-x64`).
*   `droplet_sizes`: A map defining the size for each type of Droplet.

## Cleanup

When you are finished with the infrastructure, you can destroy all the created resources by running:
```sh
terraform destroy
```