-- Call to create a role record
CALL spr_create_role('ADMIN', 'Administrator', 'Has full access to the system', 1001);

-- Call to update a role record
CALL spr_update_role(1, 'MODERATOR', 'Moderator', 'Can manage content and users', 1002);

-- Call to delete a role record (soft delete)
CALL spr_delete_role(1, 1003);

-- Call to find all active roles
CALL spr_find_all_role();

-- Call to find a role by id
CALL spr_find_role_by_id(1);

-- Call to update the state of a role (activate/deactivate)
CALL spr_state_role(1, 0, 1004);  -- 0 for deactivation
