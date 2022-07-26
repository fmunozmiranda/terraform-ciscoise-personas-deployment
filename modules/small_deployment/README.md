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
| <a name="requirement_ciscoise"></a> [azure](#requirement\_azure) | >= 0.6.4-beta |
| <a name="requirement_time"></a> [azure](#requirement\_azure) | >= 0.7.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="requirement_ciscoise"></a> [azure](#requirement\_azure) | >= 0.6.4-beta |
| <a name="requirement_time"></a> [azure](#requirement\_azure) | >= 0.7.2 |

## Modules

| Name | Type |
|------|------|
| [large_deployment](https://github.com/fmunozmiranda/terraform-azure-ise-deployment/tree/main/modules/large_deployment) | internal |
| [medium_deployment](https://github.com/fmunozmiranda/terraform-azure-ise-deployment/tree/main/modules/medium_deployment) | internal |
| [small_deployment](https://github.com/fmunozmiranda/terraform-azure-ise-deployment/tree/main/modules/small_deployment) | internal |
| [single_node](https://github.com/fmunozmiranda/terraform-azure-ise-deployment/tree/main/modules/single_node) | internal |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | data source |
| [azurerm_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_network_security_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/network_security_group) | data source |
| [azurerm_network_security_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [tls_private_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [local_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|resource_group_name| Resource Group Name | `string` | - | yes|
|resource_group_location| Resource Group Location | `string` | - | yes |
|virtual_network_name| Virtual Network Name For ISE | `string` | - | yes |
|virtual_network_address_space| Virtual Network Address Space For ISE| `string` | - | yes |
|virtual_network_dns_servers| Virtual Network DNS Servers | `string` | - | yes |
|subnet_name| Virtual Subnet Name For ISE | `string` | - | yes |
|subnet_address_prefixes| Subnet Address Prefixes For ISE | `string` | - | yes |
|network_security_group_name| Network Security Group Name For ISE | `string` | - | yes |
|ise_username| ISE Username | `string` | - | yes |
|ise_password| ISE Password | `string` | - | yes |
|ise_deployment| ISE Deployment | `string` | - | yes |
|ise_psn_instances| ISE PSN Instances | `number` | `0` | no |
|ise_base_hostname| ISE Base Hostname | `string` | - | yes |
|create_resource_group| Determines to create or not a new Resource Group. | `boolean` | `true` | no |
|create_virtual_network| Determines to create or not a new Virtual Network. | `string` | `true` | no |
|create_security_group| Determines to create or not a new Security Group. | `string` | `true` | no |
|create_subnet| Determines to create or not a new Subnet. | `string` | `true` | no |

## Outputs

None


## Authors



## License

Apache 2 Licensed. See [LICENSE]() for full details.
