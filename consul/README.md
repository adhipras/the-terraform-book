# The Terraform Book - Chapter 5

These are the Terraform configuration files for Chapter 5.

## Usage

1. Clone the Git repository.
```sh
$ git clone git@github.com:adhipras/the-terraform-book.git
```

2. Go to the `consul` directory.
```sh
$ cd consul
```

3. Generate an UUID as Consul token.
```sh
$ uuid
```

4. Generate an encryption key for Consul.
```sh
$ openssl rand -base64 16
```

5. Create a `terraform.tfvars` file.
```sh
$ vi terraform.tfvars
```

6. Write down your Amazon Web Service access and secret keys, Consul token, Consul encryption key, then save it.
```
access_key     = "XXX"
secret_key     = "XXX"
token          = "XXX"
encryption_key = "XXX"
```

7. Execute the Terraform commands.
```sh
$ terraform init
$ terraform plan
$ terraform apply
```