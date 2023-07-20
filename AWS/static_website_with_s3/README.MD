# Terraform Template For Static Website Using Cloudfront

This repository contains a Terraform template for provisioning infrastructure resources on a cloud provider. It provides a declarative approach to infrastructure as code, allowing you to define and manage your infrastructure in a version-controlled manner.

## Getting Started

To use this Terraform template, follow the steps below:

1. Initialize Terraform:

In the root directory of the Terraform template, run the following command to initialize Terraform:
```
terraform init
```

This command downloads the required provider plugins and sets up the backend, if specified in the template.

2. Configure variables:

Review the available variables in the template, located in the `variables.tf` file. Modify the default values or provide new values in a `terraform.tfvars` file. Alternatively, you can set environment variables for the variables you want to override.

3. Plan and apply changes:

Run the following command to create an execution plan:
```
terraform plan
```

This command shows a summary of the resources that Terraform will create, update, or destroy.

To apply the changes and provision the infrastructure, run:

```
terraform apply
```

Confirm the changes by typing `yes` when prompted.

4. Destroy infrastructure:

If you want to tear down the provisioned infrastructure, run:

```
terraform destroy
```


This command will remove all the resources created by Terraform.

## Repository Structure

The repository structure is organized as follows:

- `main.tf`: This file contains the main configuration for the infrastructure resources, including resource definitions, dependencies, and variables.
- `variables.tf`: Here, you define the variables used in the `main.tf` file. Each variable has a type, default value, and optional description.
- `terraform.tfvars`: You can provide variable values in this file. Alternatively, set environment variables with the same name as the variables defined in `variables.tf`.
- `outputs.tf`: This file defines the outputs that you want to display after applying the Terraform template. Outputs can include information such as IP addresses, resource IDs, or any other relevant information.
- `README.md`: This file provides an overview of the Terraform template and instructions for getting started.

## Contributing

Contributions to this Terraform template are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

When contributing, please adhere to the following guidelines:
- Describe your changes in detail and provide the necessary documentation updates.
- Ensure that your code follows the existing coding style and conventions.
- Test your changes thoroughly before submitting a pull request.

## License

This Terraform template is licensed under the [MIT License](LICENSE). Feel free to modify and distribute it as needed.