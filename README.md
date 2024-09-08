# VERIFY terraform module

Use this module to verify values from resources during plan. This module has no outputs
and does not create any resources. It uses terraform interpolation to check values
and bash script to exit with error when they do not pass the verification.

If you need to verify just module variables - use terraform built-in [validation rules](https://www.terraform.io/docs/configuration/variables.html#custom-validation-rules)

## Usage example

For more real life examples check [./examples directory](./examples)

```terraform
module "check" {
  source  = "gordonbondon/verify/common"
  version = "~> 1.0"

  match = contains(tolist(["a", "b", "c"]), "a")
  error = "Value must be one of a,b,c"
}
```

## System Requirements

* `bash` shell interpreter

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_external"></a> [external](#requirement\_external) | >= 1.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_external"></a> [external](#provider\_external) | 2.3.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [external_external.validate](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_error"></a> [error](#input\_error) | error message to display | `string` | n/a | yes |
| <a name="input_match"></a> [match](#input\_match) | pass in expression that will evaluate to `true` or `false` | `bool` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
