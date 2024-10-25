# OpsLevel Terraform Modules

Customizable blueprint for creating and managing an [OpsLevel](https://opslevel.com) account and its resources using Terraform.

## Getting Started

Open a terminal and run the following:

```bash
brew install go-task
```

Once `task` is installed run `task --list` to see the available tasks.

### Layout

The `./modules` directory contains Terraform config files that make up the blueprint used to populate the OpsLevel account with data.

The `./workspace` directory contains the `main.tf` file that actually uses the contents in `./modules`. This is where inputs should
be defined to uniquely customize each account.


## Updating An OpsLevel Account

First, **ensure OPSLEVEL_API_TOKEN is set** via `export OPSLEVEL_API_TOKEN=<YOUR_API_TOKEN>` - this is how Terraform knows which account to update!

For a preview of planned changes,run `task plan`. No changes will be made with this command.

To apply changes, run `task apply`. This will refresh Terraform's state then prompt you for approval to apply changes.

> IMPORTANT: Managed resources/data are stored in Terraform's state, which is this local file `workspace/terraform.tfstate`. If this is lost, Terraform will not be able to properly apply changes.

### OpsLevel account Clean up

To remove all Terraform managed data, run `task destroy`. Terraform will prompt you for approval before deleting all managed resources.
