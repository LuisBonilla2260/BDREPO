-- Call to create a module_view record
CALL spr_create_module_view(1, 2, 1);  -- Module ID: 1, View ID: 2, Created By: 1

-- Call to update a module_view record
CALL spr_update_module_view(1, 1, 3, 2);  -- ID: 1, Module ID: 1, View ID: 3, Updated By: 2

-- Call to delete a module_view record (soft delete)
CALL spr_delete_module_view(1, 3);  -- ID: 1, Deleted By: 3

-- Call to find all active module_view records
CALL spr_find_all_module_view();

-- Call to find a module_view by id
CALL spr_find_module_view_by_id(1);

-- Call to update the state of a module_view (activate/deactivate)
CALL spr_state_module_view(1, 0, 4);  -- ID: 1, State: 0 (deactivate), Updated By: 4
