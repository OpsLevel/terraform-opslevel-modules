#! /bin/bash

deploy() {
  curl -s -X POST $1 \
    -H 'content-type: application/json' \
    -d '{
      "service": "'"$2"'",
      "deployer": {
        "email": "'"$5"'"
      },
      "deployed_at": "'"$(date -u $3 '+%FT%TZ')"'",
      "description": "CI Pipeline: #'"$4"'",
      "commit": {
        "sha": "'"$(openssl rand -hex 24)"'"
      }
    }'
}

deploys() {
  deploy "$1" "$2" "-v -1H" "258" "adam@example.com"
  deploy "$1" "$2" "-v -6H" "257" "adam@example.com"
  deploy "$1" "$2" "-v -12H" "256" "adam@example.com"
  deploy "$1" "$2" "-v -1d" "255" "adam@example.com"
  deploy "$1" "$2" "-v -1d -v -12H" "254" "adam@example.com"
  deploy "$1" "$2" "-v -1d -v -15H" "253" "adam@example.com"
  deploy "$1" "$2" "-v -1d -v -16H" "252" "adam@example.com"
  deploy "$1" "$2" "-v -2d -v -1H" "251" "adam@example.com"
  deploy "$1" "$2" "-v -2d -v -5H" "250" "adam@example.com"
  deploy "$1" "$2" "-v -2d -v -7H" "249" "adam@example.com"
  deploy "$1" "$2" "-v -3d -v -1H" "248" "adam@example.com"
  deploy "$1" "$2" "-v -4d -v -1H" "247" "adam@example.com"
  deploy "$1" "$2" "-v -8d -v -1H" "246" "adam@example.com"
  deploy "$1" "$2" "-v -9d -v -1H" "245" "adam@example.com"
  deploy "$1" "$2" "-v -9d -v -2H" "243" "adam@example.com"
  deploy "$1" "$2" "-v -9d -v -3H" "242" "adam@example.com"
  deploy "$1" "$2" "-v -9d -v -4H" "241" "adam@example.com"
  deploy "$1" "$2" "-v -10d -v -1H" "240" "adam@example.com"
  deploy "$1" "$2" "-v -12d -v -1H" "239" "adam@example.com"
  deploy "$1" "$2" "-v -12d -v -2H" "238" "adam@example.com"
  deploy "$1" "$2" "-v -12d -v -3H" "237" "adam@example.com"
  deploy "$1" "$2" "-v -14d -v -1H" "236" "adam@example.com"
  deploy "$1" "$2" "-v -14d -v -2H" "235" "adam@example.com"
  deploy "$1" "$2" "-v -14d -v -3H" "243" "adam@example.com"
}

terraform() {
    deploy "$1" "$2" "-v -1d" "11" "adam@example.com"
    deploy "$1" "$2" "-v -3d -v -1H" "10" "adam@example.com"
    deploy "$1" "$2" "-v -9d -v -1H" "9" "adam@example.com"
    deploy "$1" "$2" "-v -9d -v -3H" "8" "adam@example.com"
    deploy "$1" "$2" "-v -9d -v -4H" "7" "adam@example.com"
    deploy "$1" "$2" "-v -12d -v -2H" "6" "adam@example.com"
    deploy "$1" "$2" "-v -14d -v -2H" "5" "adam@example.com"
}

rollbacks() {
  deploy "$1" "$2" "-v -4d -v -8H" "4" "adam@example.com"
  deploy "$1" "$2" "-v -11d -v -8H" "3" "adam@example.com"
}

if [ "$1" = "deploys" ]; then
  deploys "$2" "$3"
fi

if [ "$1" = "terraform" ]; then
  terraform "$2" "$3"
fi

if [ "$1" = "rollbacks" ]; then
  rollbacks "$2" "$3"
fi