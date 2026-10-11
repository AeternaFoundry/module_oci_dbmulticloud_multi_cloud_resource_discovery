resource "oci_dbmulticloud_multi_cloud_resource_discovery" "dbmulticloud_multi_cloud_resource_discoveries" {
  for_each = var.dbmulticloud_multi_cloud_resource_discoveries

  compartment_id         = each.value.compartment_id
  display_name           = each.value.display_name
  oracle_db_connector_id = each.value.oracle_db_connector_id
  resource_type          = each.value.resource_type
  defined_tags           = each.value.defined_tags
  freeform_tags          = each.value.freeform_tags
  resources_filter       = each.value.resources_filter

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

