variable "account_token" {
  description = "The token for the account."
  type        = string
  sensitive   = true
}

variable "account_name" {
  description = "The name of the account, used to create unique identifiers where needed."
  type        = string
}

variable "account_users" {
  description = "The email addresses of the users to invite to this demo account."
  type        = set(string)
  default     = []
}

resource "random_id" "account" {
  keepers = {
    # Generate a new id each time we switch
    account_name = var.account_name
  }

  byte_length = 8
}

locals {
  unique_id = lower(random_id.account.id)
}

variable "git_repo" {
  description = "If the account has a git forge already integrated this is the repo that will be attached to all services."
  type        = string
  default     = ""
}

locals {
  repository = var.git_repo == "" ? [] : [
    {
      name  = "Codebase"
      alias = var.git_repo
    },
  ]
  repositories = var.git_repo == "" ? [] : [
    {
      name           = "Monolith"
      base_directory = "src/monolith"
      alias          = var.git_repo
    },
    {
      name           = "Service"
      base_directory = "src/service"
      alias          = var.git_repo
    }
  ]
  tools = {
    "Datadog" = {
      name        = "Datadog",
      category    = "metrics",
      environment = "Production",
      url         = "https://datadog.com/example"
    },
    "Datadog-Stg" = {
      name        = "Datadog Staging",
      category    = "metrics",
      environment = "Staging",
      url         = "https://datadog.com/example"
    },
    "Sentry" = {
      name        = "Sentry",
      category    = "errors",
      environment = "Production",
      url         = "https://sentry.io/issues/?project=example"
    },
    "Sentry-Stg" = {
      name        = "Sentry Staging",
      category    = "errors",
      environment = "Staging",
      url         = "https://sentry.io/issues/?project=example"
    },
    "PagerDuty" = {
      name        = "PagerDuty",
      category    = "incidents",
      environment = "Production",
      url         = "https://pagerduty.com/services/example"
    },
    "Gremlin" = {
      name        = "Gremlin",
      category    = "other",
      environment = "Production",
      url         = "https://gremlin.com/example"
    },
    "Gremlin-Stg" = {
      name        = "Gremlin Staging",
      category    = "other",
      environment = "Staging",
      url         = "https://gremlin.com/example"
    },
    "Kubernetes" = {
      name        = "Kubernetes",
      category    = "orchestrator",
      environment = "Production",
      url         = "https://eks.aws.com/example"
    },
    "Kubernetes-Stg" = {
      name        = "Kubernetes Staging",
      category    = "orchestrator",
      environment = "Staging",
      url         = "https://eks.aws.com/example"
    },
    "Splunk" = {
      name        = "Splunk",
      category    = "logs",
      environment = "Production",
      url         = "https://splunk.com/example"
    },
    "Splunk-Stg" = {
      name        = "Splunk",
      category    = "logs",
      environment = "Staging",
      url         = "https://splunk.com/example"
    },
    "Runbooks" = {
      name     = "Runbooks",
      category = "runbooks",
      url      = "https://confluence.com/example"
    },
    "Admin" = {
      name        = "Admin",
      category    = "admin",
      environment = "Development",
      url         = "https://bigriverbooks.com/admin"
    },
    "Twistlock" = {
      name        = "Twistlock",
      category    = "security",
      environment = "Production",
      url         = "https://twistlock.com/example"
    },
    "Jira" = {
      name        = "Jira",
      category    = "backlog",
      environment = "Production",
      url         = "https://jira.com/example"
    },
    "GitlabIssues" = {
      name        = "Gitlab",
      category    = "issues",
      environment = "Development",
      url         = "https://gitlab.com/example"
    },
    "Wiki" = {
      name        = "Wiki",
      category    = "wiki",
      environment = "Production",
      url         = "https://wiki.com/example"
    },
  }
  properties = {}
}
