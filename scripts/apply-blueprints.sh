tofu output -json blueprint_ids \
| jq -r '.[]' \
| while read -r uuid; do
    curl -X POST \
      -H "Authorization: Bearer $AUTHENTIK_TOKEN" \
      "$AUTHENTIK_URL/api/v3/managed/blueprints/$uuid/apply/"
  done