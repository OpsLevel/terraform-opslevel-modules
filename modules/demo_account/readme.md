# Outstanding things to implement
- Generate Deploy events for services
- Infra resources for AWS, GCP and Azure
- Setup Actions that can be triggered (that set data in opslevel that change levels)
- Generate Security Data (grype) for security checks (to show off tables in notes)
- Generate more users and fill up the teams
- Property Definitions for build speed - custom action should set these values
- Tags on users - on-call:ready
- Tags on Team to feed custom widgets
- Team Contacts
- Team Responsiblities

# Things to demo

### Show how to onboard a new service

The purpose of this demo flow is to show how when you have a maturity program it guides the end user on what to do next.

- Navigate to the "Services" page
- Click "New Service" and then "Register Service"
- Create the Service
- Navigate to the "Maturity" report tab
- Follow the rubric checks and levarage the "fix this" button.
- Once you fix all checks up to Silver navigate to the "Operations" tab and show the tool links
- Refresh the page and show the service is now at Silver

### Show how to trigger an Action on a Service
- Navigate to the ??? Service
- Click "Actions" and then "Evaluate Build Speed"
- After the action runs refresh the page and show the new custom properties
- Show the maturity report and how the service passes to "Gold" now
- Magic

### Show how checks can have notes telling end user what to fix
- Navigate to the ??? Service
- Open the maturity report
- Expand the check "No Critical Vulnerabilities"
- Exapnd the table of the current vulnerabilities
- Magic

### Show Product Engineering Team Page
- Navigate to the Product Engineering Team
- Show the Custom Widgets
- Show the Maturity Report
- Toggle "include subteams"
- Magic

### Show how checks evaluate
- Product Image Service "fix this" on "CI is fast" check to get to Gold
- Product Image Service "fix this" on "Pagerduty Integration" check to get to Gold
- Order Workflow Service trigger deploy events to get to get to Gold
- Shopping Chart Service "Update" on "Have you done your homework?" check to get to Platinum