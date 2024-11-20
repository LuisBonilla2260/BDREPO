-- Call to create a user_role record
CALL spr_create_user_role(1, 1001, 1);

-- Call to update a user_role record
CALL spr_update_user_role(1, 2, 1002, 1);

-- Call to delete a user_role record (soft delete)
CALL spr_delete_user_role(1, 1003);

-- Call to find all active user_role records
CALL spr_find_all_user_role();

-- Call to find a user_role by id
CALL spr_find_user_role_by_id(1);

-- Call to update the state of a user_role (activate/deactivate)
CALL spr_state_user_role(1, 0, 1004);  -- 0 for deactivation
