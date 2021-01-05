# The Terraform Book

The [Amazon Web Service](https://aws.amazon.com/) infrastructure as code I wrote while learning from [The Terraform Book](https://terraformbook.com/).

## Prerequisites

1. [Terraform](https://www.terraform.io/)
2. [Amazon Web Service account](https://aws.amazon.com/free/)
3. [Amazon Web Service Command Line Interface](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)

## Usage

1. Clone the Git repository.
```sh
$ git clone git@github.com:adhipras/the-terraform-book.git
```

2. Go to the `base` or `web` directory.
```sh
$ cd base
```
or
```sh
$ cd web
```

3. Create a `terraform.tfvars` file.
```sh
$ vi terraform.tfvars
```

4. Write down your Amazon Web Service access and secret keys.
```
access_key = "XXX"
secret_key = "XXX"
```

5. Execute Terraform commands by including the `secrets.tfvars` file as additional variables.
```sh
$ terraform plan
$ terraform apply
```

## License

[MIT](https://opensource.org/licenses/MIT).