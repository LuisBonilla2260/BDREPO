-- Call to create a role_module record
CALL spr_create_role_module(1, 2, 1);  -- Role ID: 1, Module ID: 2, Created By: 1

-- Call to update a role_module record
CALL spr_update_role_module(1, 1, 3, 2);  -- ID: 1, Role ID: 1, Module ID: 3, Updated By: 2

-- Call to delete a role_module record (soft delete)
CALL spr_delete_role_module(1, 3);  -- ID: 1, Deleted By: 3

-- Call to find all active role_module records
CALL spr_find_all_role_module();

-- Call to find a role_module by id
CALL spr_find_role_module_by_id(1);

-- Call to update the state of a role_module (activate/deactivate)
CALL spr_state_role_module(1, 0, 4);  -- ID: 1, State: 0 (deactivate), Updated By: 4
