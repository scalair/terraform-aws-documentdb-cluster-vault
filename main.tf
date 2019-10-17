provider "vault" {}

data "vault_generic_secret" "documentdb_credentials" {
  path = "${var.vault_generic_secret_documentdb_credentials_path}"
}

module "documentdb_cluster" {
  source = "git::https://github.com/cloudposse/terraform-aws-documentdb-cluster.git?ref=0.2.0"

  # Custom configuration
  allowed_security_groups = ["${data.terraform_remote_state.elastic_beanstalk_environment.elastic_beanstalk_environment_security_group_id}"]

  master_username = "${data.vault_generic_secret.documentdb_credentials.data["master_username"]}"
  master_password = "${data.vault_generic_secret.documentdb_credentials.data["master_password"]}"


  # All variables available in the module
  allowed_cidr_blocks             = "${var.allowed_cidr_blocks}"
  apply_immediately               = "${var.apply_immediately}"
  attributes                      = "${var.attributes}"
  cluster_dns_name                = "${var.cluster_dns_name}"
  cluster_family                  = "${var.cluster_family}"
  cluster_parameters              = "${var.cluster_parameters}"
  cluster_size                    = "${var.cluster_size}"
  db_port                         = "${var.db_port}"
  delimiter                       = "${var.delimiter}"
  enabled_cloudwatch_logs_exports = "${var.enabled_cloudwatch_logs_exports}"
  engine                          = "${var.engine}"
  engine_version                  = "${var.engine_version}"
  instance_class                  = "${var.instance_class}"
  kms_key_id                      = "${var.kms_key_id}"
  name                            = "${var.name}"
  namespace                       = "${var.namespace}"
  preferred_backup_window         = "${var.preferred_backup_window}"
  reader_dns_name                 = "${var.reader_dns_name}"
  retention_period                = "${var.retention_period}"
  skip_final_snapshot             = "${var.skip_final_snapshot}"
  snapshot_identifier             = "${var.snapshot_identifier}"
  stage                           = "${var.stage}"
  storage_encrypted               = "${var.storage_encrypted}"
  subnet_ids                      = "${var.subnet_ids}"
  tags                            = "${var.tags}"
  vpc_id                          = "${var.vpc_id}"
  zone_id                         = "${var.zone_id}"
}
