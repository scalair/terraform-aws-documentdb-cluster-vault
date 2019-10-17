data "terraform_remote_state" "elastic_beanstalk_environment" {
  backend = "s3"

  config {
    region = "${var.elastic_beanstalk_environment_state_region}"
    bucket = "${var.elastic_beanstalk_environment_bucket}"
    key    = "${var.elastic_beanstalk_environment_state_key}"
  }
}
