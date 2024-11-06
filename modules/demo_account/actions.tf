resource "opslevel_webhook_action" "security_scan" {
  name        = "Security Scan"
  description = "Runs a security scan for the service"
  url         = "https://app.opslevel.com/upload/documents/sbom/{{service.id}}"
  method      = "POST"
  headers = {
    content-type  = "application/json"
    authorization = "Bearer ${var.account_token}"
  }
  payload = "${local.sbom_bad}"
}

resource "opslevel_trigger_definition" "example" {
  name                     = "Security Scan"
  description              = "Runs a security scan for the service"
  owner                    = module.internal-tools-team.this.id
  action                   = opslevel_webhook_action.security_scan.id
  access_control           = "everyone"
  response_template        = <<EOT
{% if response.status >= 200 and response.status < 300 %}
## Congratulations!
Your request for {{ service.name }} has succeeded. See the incident here: {{response.body.incident.html_url}}
{% else %}
## Oops something went wrong!
Please contact [{{ action_owner.name }}]({{ action_owner.href }}) for more help.
{% endif %}
  EOT
  published                = true
}