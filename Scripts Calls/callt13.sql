-- Call to create a view record
CALL spr_create_view('V001', 'Vista de usuario', 'Vista Principal', '/views/main', 1);

-- Call to update a view record
CALL spr_update_view(1, 'V001', 'Vista de administrador', 'Vista de Administración', '/views/admin', 2);

-- Call to delete a view record (soft delete)
CALL spr_delete_view(1, 3);

-- Call to find all active view records
CALL spr_find_all_view();

-- Call to find a view by id
CALL spr_find_view_by_id(1);

-- Call to update the state of a view (activate/deactivate)
CALL spr_state_view(1, 0, 4);  -- 0 for deactivation
