-- Llamar a spr_create_payment_method
CALL spr_create_payment_method(
    'PM001',                -- p_code
    'Credit Card',          -- p_name
    1                       -- p_created_by
);

-- Llamar a spr_update_payment_method
CALL spr_update_payment_method(
    1,                      -- p_id
    'PM002',                -- p_code
    'Debit Card',           -- p_name
    2                       -- p_updated_by
);

-- Llamar a spr_delete_payment_method
CALL spr_delete_payment_method(
    1,                      -- p_id
    3                       -- p_deleted_by
);

-- Llamar a spr_find_all_payment_method
CALL spr_find_all_payment_method();

-- Llamar a spr_find_payment_method_by_id
CALL spr_find_payment_method_by_id(
    1                       -- p_id
);

-- Llamar a spr_state_payment_method
CALL spr_state_payment_method(
    1,                      -- p_id
    0,                      -- p_state (0 = inactivo, 1 = activo)
    4                       -- p_updated_by
);
