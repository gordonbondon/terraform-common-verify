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
  version = "~> 2.0"

  match = contains(list("a", "b", "c"), "a")
  error = "Value must be one of a,b,c"
}
```

## System Requirements

* `bash` shell interpreter

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| external | >= 1.1.0 |

## Providers

| Name | Version |
|------|---------|
| external | >= 1.1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| error | error message to display | `string` | n/a | yes |
| match | pass in expression that will evaluate to `true` or `false` | `any` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
