# AWS DocumentDB cluster
AWS Module to create a DocumentDB cluster

## DocumentDB credentials
DocumentDB credentials can be set in two different ways:
* By using Hashicorp Vault
* By passing variables to the module directly

Those behaviors are driven by the flag `use_vault`. If `use_vault` is true, then you must set `vault_generic_secret_documentdb_credentials_path` to the path in Vault where credentials can be found. If `use_vault` is false, then you must set `master_username` and `master_password` directly (you can set them with environment variables `TF_VAR_master_username` and `TF_VAR_master_password`.