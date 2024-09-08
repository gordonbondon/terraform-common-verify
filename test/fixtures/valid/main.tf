module "verify_list" {
  source = "../../../"

  match = contains(tolist(["a", "b", "c"]), "a")
  error = "Value must be in a,b,c"
}
