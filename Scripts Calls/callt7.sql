-- Llamar a spr_create_inventory
CALL spr_create_inventory(
    '2024-11-18',      -- p_date
    500.50,            -- p_purchase_value
    750.75,            -- p_sale_value
    100,               -- p_stock
    1,                 -- p_branch_id
    2,                 -- p_product_id
    3                  -- p_created_by
);

-- Llamar a spr_update_inventory
CALL spr_update_inventory(
    1,                 -- p_id
    '2024-11-19',      -- p_date
    600.00,            -- p_purchase_value
    800.00,            -- p_sale_value
    150,               -- p_stock
    1,                 -- p_branch_id
    3,                 -- p_product_id
    4                  -- p_updated_by
);

-- Llamar a spr_delete_inventory
CALL spr_delete_inventory(
    1,                 -- p_id
    3                  -- p_deleted_by
);

-- Llamar a spr_find_all_inventory
CALL spr_find_all_inventory();

-- Llamar a spr_find_inventory_by_id
CALL spr_find_inventory_by_id(
    1                  -- p_id
);

-- Llamar a spr_state_inventory
CALL spr_state_inventory(
    1,                 -- p_id
    0,                 -- p_state (0 = inactivo, 1 = activo)
    3                  -- p_updated_by
);
