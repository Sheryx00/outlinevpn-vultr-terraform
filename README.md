# Outlinevpn-vultr-terraform

##### Fork of jadolg/outlinevpn-vultr-terraform repository

I just added the api & keys ports as variables, and configured iptables for open it. 
It takes less steps to set up now.

## Requirements
1. Download the [Outline Manager and client](https://getoutline.org/es/get-started/)
2. Set your IAM user and policies.
3. login with  `aws auth login` or whenever you want. 
3. Download your ssh [keypair](https://lightsail.aws.amazon.com/ls/webapp/account/keys)

## RUN
1. Run `terraform init && terraform apply`
2. Open your Outline Manager and paste the output `apiUrl` to your Outline Manager
3. Open your Outline Client and paste the `ss://` link.
4. Connect :)