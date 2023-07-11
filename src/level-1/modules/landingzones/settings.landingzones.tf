locals {
custom_landing_zones_org1 = {
     "mg-sandbox" = {
      display_name               = "Sandbox"
      parent_management_group_id = "myexamp"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }

}

    custom_landing_zones_org1_lz = {

      "mg-zee5" = {
      display_name               = "Zee5"
      parent_management_group_id = "landingzone"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "zee-five" #2 assignments
        parameters     = {}
        access_control = {}
      }
    }
        
        "mg-zeeenter" = {
      display_name               = "Zee Enter"
      parent_management_group_id = "landingzone"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "extend_es_landing_zones"
        parameters     = {}
        access_control = {}
      }
        }

        "mg-zee5-p" = {
      display_name               = "Zee5 Prod"
      parent_management_group_id = "mg-zee5"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "prod"
        parameters     = {}
        access_control = {}
      }
        }
        
        "mg-zee5-np" = {
      display_name               = "Zee5 Nonprod"
      parent_management_group_id = "mg-zee5"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "non_prod"
        parameters     = {}
        access_control = {}
      }
        }
        
        "mg-zeeenter-p" = {
      display_name               = "ZEE Ent Prod"
      parent_management_group_id = "mg-zeeenter"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
        }
        
        "mg-zeeenter-np" = {
      display_name               = "ZEE Ent Nonprod"
      parent_management_group_id = "mg-zeeenter"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
        }
    }

    custom_landing_zones_org1_lz_nested_mg_lz1 = {

          "mg-pf-shared" = {
      display_name               = "Shared"
      parent_management_group_id = "mg-pf"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
        }

        
        "mg-pf-sec" = {
      display_name               = "Security"
      parent_management_group_id = "mg-pf"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
     }

        "mg-pf-data" = {
      display_name               = "Data"
      parent_management_group_id = "mg-pf"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
     }

    }
}