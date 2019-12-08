# Terraform Apply for Azure Action

This Action allows you to apply Terraform manifests to Azure

## Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `arm_client_id` | `string` | | Azure Service Principal client_id |
| `arm_client_secret` | `string` | | Azure Service Principal client_secret |
| `arm_subscription_id` | `string` | | Azure subscription |
| `arm_tenant_id` | `string` | | Azure Tenant id |
| `variables` | `string` | `""` | Comma-separated string of Terraform variables |
| `path` | `string` | `.` | Path to Terraform directory, defaults to the working directory |

## Usage

```yaml
jobs:
  provisioning:
    runs-on: ubuntu-latest
    steps:
    - uses: ams0/terraform-apply-for-azure-action@v3
      with:
        arm_client_id: ${{ secrets.ARM_CLIENT_ID }}
        arm_client_secret: ${{ secrets.ARM_CLIENT_SECRET }}
        arm_subscription_id: ${{ secrets.ARM_SUBSCRIPTION_ID }}
        arm_tenant_id: ${{ secrets.ARM_TENANT_ID }}
        variables: var=${{ github.sha }}
        path: terraform/dev
```

## License

The MIT License (MIT)
