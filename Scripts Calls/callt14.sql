-- Call to create a module record
CALL spr_create_module('MOD001', 'Modulo de administración', 'Modulo Principal', '/modules/admin', 1);

-- Call to update a module record
CALL spr_update_module(1, 'MOD001', 'Modulo de gestión de usuarios', 'Gestión Usuarios', '/modules/user-management', 2);

-- Call to delete a module record (soft delete)
CALL spr_delete_module(1, 3);

-- Call to find all active module records
CALL spr_find_all_module();

-- Call to find a module by id
CALL spr_find_module_by_id(1);

-- Call to update the state of a module (activate/deactivate)
CALL spr_state_module(1, 0, 4);  -- 0 for deactivation
