-- Llamar a spr_create_invoice
CALL spr_create_invoice(
    '2024-11-18',      -- p_date
    50.00,             -- p_discount_value
    500.00,            -- p_gross_value
    450.00,            -- p_net_value
    2,                 -- p_paym_method_id
    5,                 -- p_client_id
    1                  -- p_created_by
);

-- Llamar a spr_update_invoice
CALL spr_update_invoice(
    1,                 -- p_id
    '2024-11-19',      -- p_date
    60.00,             -- p_discount_value
    600.00,            -- p_gross_value
    540.00,            -- p_net_value
    3,                 -- p_paym_method_id
    6,                 -- p_client_id
    2                  -- p_updated_by
);

-- Llamar a spr_delete_invoice
CALL spr_delete_invoice(
    1,                 -- p_id
    3                  -- p_deleted_by
);

-- Llamar a spr_find_all_invoice
CALL spr_find_all_invoice();

-- Llamar a spr_find_invoice_by_id
CALL spr_find_invoice_by_id(
    1                  -- p_id
);

-- Llamar a spr_state_invoice
CALL spr_state_invoice(
    1,                 -- p_id
    0,                 -- p_state (0 = inactivo, 1 = activo)
    3                  -- p_updated_by
);
