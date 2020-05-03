module "verify_list" {
  source = "../../../"

  match = contains(list("a", "b", "c"), "a")
  error = "Value must be in a,b,c"
}
