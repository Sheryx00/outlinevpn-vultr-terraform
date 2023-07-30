# Fork of jadolg/outlinevpn-vultr-terraform:master

I just added the api port as variable and configured iptables to open it, so it
takes less steps to connect set up.

## RUN
1. Download the [Outline's Manager and client](https://getoutline.org/es/)
2. Set your `VULTR_API_KEY`: `export VULTR_API_KEY=<VULTR_API_KEY>`
3. Run `terraform init && terraform apply`
4. Copy the output `apiUrl` to your Outline Manager
5. Copy the key key (share button) and copy the ss:// link in your Outline Client