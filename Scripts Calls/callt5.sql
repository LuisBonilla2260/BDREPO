-- Llamar a spr_create_branch
CALL spr_create_branch(
    '456 Elm St',          -- p_address
    'branch@example.com',  -- p_email
    'Branch A',            -- p_name
    '555-1234',            -- p_phone
    1,                     -- p_company_id
    2,                     -- p_responsible_id
    3                      -- p_created_by
);

-- Llamar a spr_update_branch
CALL spr_update_branch(
    1,                     -- p_id
    '789 Oak St',          -- p_address
    'updated_branch@example.com', -- p_email
    'Branch A Updated',    -- p_name
    '555-5678',            -- p_phone
    1,                     -- p_company_id
    4,                     -- p_responsible_id
    3                      -- p_updated_by
);

-- Llamar a spr_delete_branch
CALL spr_delete_branch(
    1,                     -- p_id
    3                      -- p_deleted_by
);

-- Llamar a spr_find_all_branch
CALL spr_find_all_branch();

-- Llamar a spr_find_branch_by_id
CALL spr_find_branch_by_id(
    1                      -- p_id
);

-- Llamar a spr_state_branch
CALL spr_state_branch(
    1,                     -- p_id
    0,                     -- p_state (0 = inactivo, 1 = activo)
    3                      -- p_updated_by
);
