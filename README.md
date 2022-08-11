# ISE Personas Deployment Terraform module

Once all ISE nodes have been deployed to AWS/Azure, we can use Ansible to build a multi-node ISE cluster with distinct ISE personas, such as Policy Administration nodes (PAN), Monitoring and Troubleshooting nodes (MNT), and Policy Services nodes (PSN).
The Personas Deployment Terraform module acomplishes the following tasks:

1. Checks whether or not all the nodes are in standalone mode. If not, the playbook exits with an error message.
2. Exports into the primary node the certificates of all the other nodes
3. Assigns the Primary PAN persona to one of the nodes
4. Assigns the corresponding personas to the rest of the nodes


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
|  [terraform] | >= 0.13.1 |
|  [ciscoise] | >= 0.6.5-beta |
|  [time] | >= 0.7.2 |

## Providers

| Name | Version |
|------|---------|
|  [ciscoise] | >= 0.6.5-beta |
|  [time] | >= 0.7.2 |

## Modules

| Name | Type |
|------|------|
| [large_deployment](https://github.com/fmunozmiranda/terraform-ciscoise-personas-deployment/tree/main/modules/large_deployment) | internal |
| [medium_deployment](https://github.com/fmunozmiranda/terraform-ciscoise-personas-deployment/tree/main/modules/medium_deployment) | internal |
| [small_deployment](https://github.com/fmunozmiranda/terraform-ciscoise-personas-deployment/tree/main/modules/small_deployment) | internal |

## Resources

None.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|ise_base_hostname| ISE Base Hostname | `string` | - | yes |
|ise_password| Determines to create or not a new Resource Group. | `boolean` | `true` | no |
|ise_deployment| Determines to create or not a new Virtual Network. | `string` | `true` | no |
|ise_username| Determines to create or not a new Security Group. | `string` | `true` | no |
|ise_domain| Determines to create or not a new Subnet. | `string` | `true` | no | 
|items| Details nodes deployed | `object` | no | true |
|itemsToRegister| Details nodes to be register, only necesary on large deployment | `object` | yes | false |


## Assumptions
- This role assumes the nodes have already been deployed to the AWS platform using the AWS Deployment role included in this collection. However, the role can be easily modified to suit any other needs, such as an on-prem deployment. 

## Outputs

None


## Authors



## License

Apache 2 Licensed. See [LICENSE]() for full details.
