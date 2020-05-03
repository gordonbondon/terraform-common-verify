module "verify_list" {
  source = "../../../"

  match = "wrong"
  error = "Value must be in a,b,c"
}
