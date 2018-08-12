#!/bin/bash
set -euxo pipefail

readonly env="$1"
readonly service_account_key="$2"

case "$env" in
    staging ) values_yaml="staging.yaml"; namespace="sqlproxy" ;;
    * ) echo "provide env in staging" ; exit 1 ;;
esac

readonly parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
helm upgrade --install pg-sqlproxy -f $parent_path/$values_yaml stable/gcloud-sqlproxy --set serviceAccountKey=${service_account_key} --namespace $namespace
