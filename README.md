# Fork of jadolg/outlinevpn-vultr-terraform

I just added the api & keys ports as variables, and configured iptables for open it. 
It takes less steps to set up now.

## Requirements
1. Download the [Outline's Manager and client](https://getoutline.org/es/get-started/)
2. Create a account at [Vultr](https://vultr.com)
3. Add some payment method to your Vultr's account
4. Set your `VULTR_API_KEY`: `export VULTR_API_KEY=<VULTR_API_KEY>`

## RUN
1. Run `terraform init && terraform apply`
2. Open your Outline Manager and copy the output `apiUrl` to your Outline Manager
3. Open your Outline Client and copy the `ss://` link.
4. Connect :)