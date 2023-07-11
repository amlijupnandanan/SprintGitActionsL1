# Use variables to customize the deployment
#Level0
variable "root_parent_id" {
  type        = string
  description = "Sets the value used for generating unique resource naming within the module."
  default     = "landingzone"
}

variable "root_parent_name" {
  type        = string
  description = "Sets the value used for the \"intermediate root\" management group display name."
  default     = "Landing zone"
}
#Level1
variable "root_id" {
  type        = string
  description = "Sets the value used for generating unique resource naming within the module."
  default     = "mg-zee5"
}

variable "root_name" {
  type        = string
  description = "Sets the value used for the \"intermediate root\" management group display name."
  default     = "Zee5"
}

variable "primary_location" {
  type        = string
  description = "Sets the location for \"primary\" resources to be created in."
  default     = "centralindia"
}

variable "secondary_location" {
  type        = string
  description = "Sets the location for \"secondary\" resources to be created in."
  default     = "southindia"
}
