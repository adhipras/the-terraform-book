# The Terraform Book - Chapter 3

These are the Terraform configuration files for Chapter 3.

## Usage

1. Clone the Git repository.
```sh
$ git clone git@github.com:adhipras/the-terraform-book.git
```

2. Go to the `web` directory.
```sh
$ cd web
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

5. Execute the Terraform `plan` and `apply` commands.
```sh
$ terraform plan
$ terraform apply
```
