variable "elastic_beanstalk_environment_bucket" {
  description = "Name of the bucket where elastic_beanstalk_environment state is stored"
}

variable "elastic_beanstalk_environment_state_key" {
  description = "Key where the state file of the elastic_beanstalk_environment is stored"
}

variable "elastic_beanstalk_environment_state_region" {
  description = "Region where the state file of the elastic_beanstalk_environment is stored"
}

variable "vault_generic_secret_documentdb_credentials_path" {
  description = "Path where is store documentdb credentials. That path must contain a 'master_username' and a æmaster_password' entry"
  default     = "/"
}

##############
# DocumentDB #
##############
variable "namespace" {
  type        = "string"
  description = "Namespace (e.g. `eg` or `cp`)"
}

variable "stage" {
  type        = "string"
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "name" {
  type        = "string"
  description = "Name of the application"
}

variable "delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter to be used between `name`, `namespace`, `stage` and `attributes`"
}

variable "attributes" {
  type        = "list"
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "zone_id" {
  type        = "string"
  default     = ""
  description = "Route53 parent zone ID. If provided (not empty), the module will create sub-domain DNS records for the DocumentDB master and replicas"
}

variable "allowed_cidr_blocks" {
  type        = "list"
  default     = []
  description = "List of CIDR blocks to be allowed to connect to the DocumentDB cluster"
}

variable "vpc_id" {
  type        = "string"
  description = "VPC ID to create the cluster in (e.g. `vpc-a22222ee`)"
}

variable "subnet_ids" {
  type        = "list"
  description = "List of VPC subnet IDs to place DocumentDB instances"
}

variable "instance_class" {
  type        = "string"
  default     = "db.r4.large"
  description = "The instance class to use. For more details, see https://docs.aws.amazon.com/documentdb/latest/developerguide/db-instance-classes.html#db-instance-class-specs"
}

variable "cluster_size" {
  type        = "string"
  default     = "3"
  description = "Number of DB instances to create in the cluster"
}

variable "snapshot_identifier" {
  type        = "string"
  default     = ""
  description = "Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot"
}

variable "db_port" {
  type        = "string"
  default     = "27017"
  description = "DocumentDB port"
}

variable "retention_period" {
  type        = "string"
  default     = "5"
  description = "Number of days to retain backups for"
}

variable "preferred_backup_window" {
  type        = "string"
  default     = "07:00-09:00"
  description = "Daily time range during which the backups happen"
}

variable "cluster_parameters" {
  type        = "list"
  default     = []
  description = "List of DB parameters to apply"
}

variable "cluster_family" {
  type        = "string"
  default     = "docdb3.6"
  description = "The family of the DocumentDB cluster parameter group. For more details, see https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-parameter-group-create.html"
}

variable "engine" {
  type        = "string"
  default     = "docdb"
  description = "The name of the database engine to be used for this DB cluster. Defaults to `docdb`. Valid values: `docdb`"
}

variable "engine_version" {
  type        = "string"
  default     = ""
  description = "The version number of the database engine to use"
}

variable "storage_encrypted" {
  type        = "string"
  description = "Specifies whether the DB cluster is encrypted"
  default     = "true"
}

variable "kms_key_id" {
  type        = "string"
  description = "The ARN for the KMS encryption key. When specifying `kms_key_id`, `storage_encrypted` needs to be set to `true`"
  default     = ""
}

variable "skip_final_snapshot" {
  type        = "string"
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted"
  default     = "true"
}

variable "apply_immediately" {
  type        = "string"
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window"
  default     = "true"
}

variable "enabled_cloudwatch_logs_exports" {
  type        = "list"
  description = "List of log types to export to cloudwatch. The following log types are supported: audit, error, general, slowquery."
  default     = []
}

variable "cluster_dns_name" {
  type        = "string"
  description = "Name of the cluster CNAME record to create in the parent DNS zone specified by `zone_id`. If left empty, the name will be auto-asigned using the format `master.var.name`"
  default     = ""
}

variable "reader_dns_name" {
  type        = "string"
  description = "Name of the reader endpoint CNAME record to create in the parent DNS zone specified by `zone_id`. If left empty, the name will be auto-asigned using the format `replicas.var.name`"
  default     = ""
}

variable "use_vault" {
  default     = true
  description = "Get master_username and master_password from Vault"
}

variable "master_username" {
  type        = "string"
  default     = ""
  description = "(Required only if use_vault is false) Username for the master DB user"
}

variable "master_password" {
  type        = "string"
  default     = ""
  description = "(Required only if use_vault is false) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Please refer to the DocumentDB Naming Constraints"
}
