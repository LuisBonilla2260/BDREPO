-- Call to create a user record
CALL spr_create_user('password123', 'jdoe', 1, 1001);

-- Call to update a user record
CALL spr_update_user(1, 'newpassword456', 'johndoe', 1, 1002);

-- Call to delete a user record (soft delete)
CALL spr_delete_user(1, 1003);

-- Call to find all active users
CALL spr_find_all_user();

-- Call to find a user by id
CALL spr_find_user_by_id(1);

-- Call to update the state of a user (activate/deactivate)
CALL spr_state_user(1, 0, 1004);  -- 0 for deactivation
