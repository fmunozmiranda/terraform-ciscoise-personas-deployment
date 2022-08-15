# ISE Personas Deployment Terraform module

Once all ISE nodes have been deployed to AWS/Azure, we can use Ansible to build a multi-node ISE cluster with distinct ISE personas, such as Policy Administration nodes (PAN), Monitoring and Troubleshooting nodes (MNT), and Policy Services nodes (PSN).


## Usage

```hcl



<!-- module "ise-deployment" {
  source  = "fmunozmiranda/ise-deployment/aws"
  version = "1.0.8"
  # insert the 17 required variables here
} -->



```

## Examples

<!-- - [SQS queues with server-side encryption (SSE) using KMS and without SSE](https://github.com/terraform-aws-modules/terraform-aws-sqs/tree/master/examples/complete) -->

<!-- - [ISE Deployment with Network ISE creation](https://github.com/fmunozmiranda/terraform-aws-ise-deployment/tree/main/examples/ise-deployment-with-network-ise-creation)
- [ISE Deployment without Network ISE creation](https://github.com/fmunozmiranda/terraform-aws-ise-deployment/tree/main/examples/ise-deployment-with-no-network-creation) -->

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| [azure] | >= 0.6.5-beta |
|  [azure] | >= 0.7.2 |

## Providers

| Name | Version |
|------|---------|
| [azure] | >= 0.6.5-beta |
|  [azure] | >= 0.7.2 |

## Modules

| Name | Type |
|------|------|
| [large_deployment](https://github.com/fmunozmiranda/terraform-azure-ise-deployment/tree/main/modules/large_deployment) | internal |
| [medium_deployment](https://github.com/fmunozmiranda/terraform-azure-ise-deployment/tree/main/modules/medium_deployment) | internal |
| [small_deployment](https://github.com/fmunozmiranda/terraform-azure-ise-deployment/tree/main/modules/small_deployment) | internal |

## Resources

| Name | Type |
|------|------|
| [ciscoise_personas_check_standalone] | resource |
| [ciscoise_personas_export_certs] | resource |
| [ciscoise_personas_promote_primary] | resource |
| [time_sleep] | resource |
| [ciscoise_personas_register_node] | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|ise_base_hostname| ISE Base Hostname | `string` | - | yes |
|ise_password| Determines to create or not a new Resource Group. | `boolean` | `true` | yes |
|ise_deployment| Determines to create or not a new Virtual Network. | `string` | `true` | yes |
|ise_username| Determines to create or not a new Security Group. | `string` | `true` | yes |
|ise_domain| Determines to create or not a new Subnet. | `string` | `true` | yes | 
|pan1_ip| Details PAN 1 IP | `string` | - | yes |
|pan2_ip| Details PAN 2 IP | `string` | - | yes |

## Outputs

None


## Authors



## License

Apache 2 Licensed. See [LICENSE]() for full details.
