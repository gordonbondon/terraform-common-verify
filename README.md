# VERIFY terraform module

Use to verify variables. This module has no outputs and does not create any resources.
It uses terraform interpolation to check variables and bash script to exit with error when
variables do not pass the verification.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| error | error message to display | string | - | yes |
| match | pass in expression that will evaluate to `true` or `false` | string | - | yes |

## Example

```terraform
module "check" {
  source  = "gordonbondon/verify/common"

  match = "${contains(list("a", "b", "c"), "a")}"
  error = "Value must be one of a,b,c"
}
```

## Requirements

* `bash` shell
* [`jq`](https://github.com/stedolan/jq) package
