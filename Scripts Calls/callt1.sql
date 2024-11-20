-- Llamar a spr_create_category
CALL spr_create_category(
    'CAT001',              -- p_code
    'Electronics',         -- p_name
    'Category for electronic products', -- p_description
    1                      -- p_created_by
);

-- Llamar a spr_update_category
CALL spr_update_category(
    1,                     -- p_id
    'CAT002',              -- p_code
    'Updated Electronics', -- p_name
    'Updated description for electronic products', -- p_description
    2                      -- p_updated_by
);

-- Llamar a spr_delete_category
CALL spr_delete_category(
    1,                     -- p_id
    3                      -- p_deleted_by
);

-- Llamar a spr_find_all_category
CALL spr_find_all_category();

-- Llamar a spr_find_category_by_id
CALL spr_find_category_by_id(
    1                      -- p_id
);

-- Llamar a spr_state_category
CALL spr_state_category(
    1,                     -- p_id
    1,                     -- p_state (1 = activo, 0 = inactivo)
    4                      -- p_updated_by
);
