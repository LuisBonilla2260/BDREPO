-- Llamar a spr_create_company
CALL spr_create_company(
    '123 Main St',          -- p_address
    'info@company.com',     -- p_email
    'Tech Corp',            -- p_name
    '555-1234',             -- p_phone
    1,                      -- p_manager_id
    2                       -- p_created_by
);

-- Llamar a spr_update_company
CALL spr_update_company(
    1,                      -- p_id
    '456 Elm St',           -- p_address
    'contact@company.com',  -- p_email
    'Tech Corp International', -- p_name
    '555-5678',             -- p_phone
    3,                      -- p_manager_id
    2                       -- p_updated_by
);

-- Llamar a spr_delete_company
CALL spr_delete_company(
    1,                      -- p_id
    2                       -- p_deleted_by
);

-- Llamar a spr_find_all_company
CALL spr_find_all_company();

-- Llamar a spr_find_company_by_id
CALL spr_find_company_by_id(
    1                       -- p_id
);

-- Llamar a spr_state_company
CALL spr_state_company(
    1,                      -- p_id
    0,                      -- p_state (0 = inactivo, 1 = activo)
    2                       -- p_updated_by
);
