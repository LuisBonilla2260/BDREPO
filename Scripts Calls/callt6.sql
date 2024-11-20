-- Llamar a spr_create_product
CALL spr_create_product(
    'PRD001',            -- p_code
    'Producto de prueba',-- p_description
    'Producto A',        -- p_name
    1,                   -- p_category_id
    3                    -- p_created_by
);

-- Llamar a spr_update_product
CALL spr_update_product(
    1,                   -- p_id
    'PRD002',            -- p_code
    'Producto actualizado', -- p_description
    'Producto A+ Actualizado', -- p_name
    2,                   -- p_category_id
    3                    -- p_updated_by
);

-- Llamar a spr_delete_product
CALL spr_delete_product(
    1,                   -- p_id
    3                    -- p_deleted_by
);

-- Llamar a spr_find_all_product
CALL spr_find_all_product();

-- Llamar a spr_find_product_by_id
CALL spr_find_product_by_id(
    1                    -- p_id
);

-- Llamar a spr_state_product
CALL spr_state_product(
    1,                   -- p_id
    0,                   -- p_state (0 = inactivo, 1 = activo)
    3                    -- p_updated_by
);
