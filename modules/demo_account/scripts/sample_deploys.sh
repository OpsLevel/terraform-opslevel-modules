#! /bin/bash

deploy() {
  # Detect if we are on macOS or Linux
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS date command
    formatted_date=$(date -u $3 '+%FT%TZ')
  else
    # Linux date command
    # Replace `-v` flag and format the input for Linux `date`
    adjusted=$(echo $3 | sed 's/-v //g' | sed 's/H/hour/g; s/d/day/g')
    formatted_date=$(date -u -d "$adjusted" '+%FT%TZ')
  fi

  curl -s -X POST "$1" \
    -H 'content-type: application/json' \
    -d '{
      "service": "'"$2"'",
      "deployer": {
        "email": "'"$5"'"
      },
      "deployed_at": "'"$formatted_date"'",
      "description": "CI Pipeline: #'"$4"'",
      "commit": {
        "sha": "'"$(openssl rand -hex 24)"'"
      }
    }'
}

deploys() {
  deploy "$1" "$2" "-v -1H" "258" "adam+$3@example.com"
  deploy "$1" "$2" "-v -6H" "257" "emily+$3@example.com"
  deploy "$1" "$2" "-v -12H" "256" "kyle+$3@example.com"
  deploy "$1" "$2" "-v -1d" "255" "david+$3@example.com"
  deploy "$1" "$2" "-v -1d -v -12H" "254" "muriel+$3@example.com"
  deploy "$1" "$2" "-v -1d -v -15H" "253" "ty+$3@example.com"
  deploy "$1" "$2" "-v -1d -v -16H" "252" "adam+$3@example.com"
  deploy "$1" "$2" "-v -2d -v -1H" "251" "adam+$3@example.com"
  deploy "$1" "$2" "-v -2d -v -5H" "250" "adam+$3@example.com"
  deploy "$1" "$2" "-v -2d -v -7H" "249" "adam+$3@example.com"
  deploy "$1" "$2" "-v -3d -v -1H" "248" "david+$3@example.com"
  deploy "$1" "$2" "-v -4d -v -1H" "247" "adam+$3@example.com"
  deploy "$1" "$2" "-v -8d -v -1H" "246" "adam+$3@example.com"
  deploy "$1" "$2" "-v -9d -v -1H" "245" "adam+$3@example.com"
  deploy "$1" "$2" "-v -9d -v -2H" "243" "adam+$3@example.com"
  deploy "$1" "$2" "-v -9d -v -3H" "242" "adam+$3@example.com"
  deploy "$1" "$2" "-v -9d -v -4H" "241" "adam+$3@example.com"
  deploy "$1" "$2" "-v -10d -v -1H" "240" "david+$3@example.com"
  deploy "$1" "$2" "-v -12d -v -1H" "239" "adam+$3@example.com"
  deploy "$1" "$2" "-v -12d -v -2H" "238" "adam+$3@example.com"
  deploy "$1" "$2" "-v -12d -v -3H" "237" "adam+$3@example.com"
  deploy "$1" "$2" "-v -14d -v -1H" "236" "adam+$3@example.com"
  deploy "$1" "$2" "-v -14d -v -2H" "235" "adam+$3@example.com"
  deploy "$1" "$2" "-v -14d -v -3H" "243" "adam+$3@example.com"
}

terraform() {
    deploy "$1" "$2" "-v -1d" "11" "ken+$3@example.com"
    deploy "$1" "$2" "-v -3d -v -1H" "10" "toms+$3@example.com"
    deploy "$1" "$2" "-v -9d -v -1H" "9" "david+$3@example.com"
    deploy "$1" "$2" "-v -9d -v -3H" "8" "adam+$3@example.com"
    deploy "$1" "$2" "-v -9d -v -4H" "7" "adam+$3@example.com"
    deploy "$1" "$2" "-v -12d -v -2H" "6" "adam+$3@example.com"
    deploy "$1" "$2" "-v -14d -v -2H" "5" "adam+$3@example.com"
}

rollbacks() {
  deploy "$1" "$2" "-v -4d -v -8H" "4" "david+$3@example.com"
  deploy "$1" "$2" "-v -11d -v -8H" "3" "adam+$3@example.com"
}

if [ "$1" = "deploys" ]; then
  deploys "$2" "$3" "$4"
fi

if [ "$1" = "terraform" ]; then
  terraform "$2" "$3" "$4"
fi

if [ "$1" = "rollbacks" ]; then
  rollbacks "$2" "$3" "$4"
fi