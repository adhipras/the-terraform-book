# The Terraform Book - Chapter 2

These are the Terraform configuration files for Chapter 2.

## Usage

1. Clone the Git repository.
```sh
$ git clone git@github.com:adhipras/the-terraform-book.git
```

2. Go to the `base` directory.
```sh
$ cd base
```

3. Create a `terraform.tfvars` file.
```sh
$ vi terraform.tfvars
```

4. Write down your Amazon Web Service access and secret keys, then save it.
```
access_key = "XXX"
secret_key = "XXX"
```

5. Execute the Terraform commands.
```sh
$ terraform init
$ terraform plan
$ terraform apply
```