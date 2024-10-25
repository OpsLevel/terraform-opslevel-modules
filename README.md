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

For a preview of planned changes,run `task plan`. No changes will be made with this command.

To apply changes, run `task apply`. This will refresh Terraform's state then prompt you for approval to apply changes.
