locals {
  levels = [
    {Name: "bronze", Title: "🥉 Bronze", Index: 1, Description: "Services in this level satisfy critical checks. This is the minimum standard to ship to production."},
    {Name: "silver", Title: "🥈 Silver", Index: 2, Description: "Services in this level satisfy important and critical checks. This is considered healthy but there is room for improvement."},
    {Name: "gold", Title: "🥇 Gold", Index: 3, Description: "Services in this level have reached the ideal standard for our company. This is the level all services should aspire to be in."},
    {Name: "platinum", Title: "💎 Platinum", Index: 4, Description: "Services in this level are going above and beyond. This is the equivalent of getting an A+ and doing all your extra credit assignments."},
  ]

  categories = [
    {Name: "security", Title: "🔐 Security"},
    {Name: "quality", Title: "📈 Quality"},
    {Name: "observability", Title: "🔍 Observability"},
    {Name: "performance", Title: "🚀 Performance"},
    {Name: "reliability", Title: "🟢 Reliability"},
    {Name: "misc", Title: "🛠 Miscellaneous"},
  ]
}

resource "opslevel_rubric_level" "all" {
    for_each = { for level in local.levels : level.Name => level }

    name        = each.value.Title
    description = each.value.Description
    index       = each.value.Index
}

resource "opslevel_rubric_category" "all" {
    for_each = { for category in local.categories : category.Name => category }

    name  = each.value.Title
}