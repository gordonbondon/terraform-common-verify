data "external" "validate" {
  program = ["bash", "${path.module}/scripts/verify.sh"]
  query = {
    match = "${var.match}"
    error = "${var.error}"
  }
}
