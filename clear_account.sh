#!/usr/bin/env bash

echo "[opslevel] Deleting Services..."
services=$(opslevel list services -o json)
echo "$services" | jq -r '.[] | .id' | while read -r id; do
  opslevel delete service "$id"
done

echo "[opslevel] Deleting Systems..."
systems=$(opslevel list systems -o json)
echo "$systems" | jq -r '.[] | .Id' | while read -r id; do
  opslevel delete system "$id"
done

echo "[opslevel] Deleting Domains..."
domains=$(opslevel list domains -o json)
echo "$domains" | jq -r '.[] | .Id' | while read -r id; do
  opslevel delete domain "$id"
done

echo "[opslevel] Deleting Infra..."
infra=$(opslevel list infra -o json)
echo "$infra" | jq -r '.[] | .id' | while read -r id; do
  opslevel delete infra "$id"
done

echo "[opslevel] Deleting Teams (errors may occur that is ok)..."
while true; do
  teams=$(opslevel list teams -o json)
  count=$(echo "$teams" | jq '. | length')
  if [ "$count" -eq 0 ]; then
    echo "[opslevel] All teams deleted."
    break
  fi
  echo "$teams" | jq -r '.[] | .Id' | while read -r id; do
    opslevel delete team "$id"
  done

  sleep 2
done

echo "[opslevel] Deleting Users..."
users=$(opslevel list users -o json)
echo "$users" | jq -r '.[] | select(.Email | test("@example.com$")) | .Email' | while read -r id; do
  opslevel delete user "$id"
done

echo "[opslevel] Deleting Checks..."
checks=$(opslevel list checks -o json)
echo "$checks" | jq -r '.[] | .Id' | while read -r id; do
  opslevel delete check "$id"
done

echo "[opslevel] Deleting Rubric..."
categories=$(opslevel list category -o json)
echo "$categories" | jq -r '.[] | .id' | while read -r id; do
  opslevel delete category "$id"
done
levels=$(opslevel list level -o json)
echo "$levels" | jq -r '.[] | select(.Index != 0) | .id' | while read -r id; do
  opslevel delete level "$id"
done

echo "[opslevel] Deleting Integrations..."
integrations=$(opslevel list integrations -o json)
echo "$integrations" | jq -r '.[] | .id' | while read -r id; do
  opslevel delete integration "$id"
done

echo "[opslevel] Clear Account Complete."