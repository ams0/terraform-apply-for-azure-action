#!/bin/sh

set -e

export ARM_CLIENT_ID=$INPUT_ARM_CLIENT_ID
export ARM_CLIENT_SECRET=$INPUT_ARM_CLIENT_SECRET
export ARM_SUBSCRIPTION_ID=$INPUT_ARM_SUBSCRIPTION_ID
export ARM_TENANT_ID=$INPUT_ARM_TENANT_ID
export ARM_ACCESS_KEY=$INPUT_ARM_ACCESS_KEY
export VARIABLES=$INPUT_VARIABLES
export INPUT_PATH=$INPUT_PATH

cd /github/workspace/$INPUT_PATH

echo "terraform init -input=false"
terraform init -input=false -backend-config="key=`basename $PWD`"

var_args=""
VARIABLES=$(echo "$VARIABLES" | tr "," "\n")
for var in $VARIABLES; do
  var_args="$var_args -var $var"
done

echo "terraform apply -no-color -input=false -auto-approve $var_args"
terraform apply -no-color -input=false -auto-approve $var_args
