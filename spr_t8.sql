DELIMITER $$

-- Procedure to create an invoice record
CREATE PROCEDURE spr_create_invoice(
    IN p_date DATE,
    IN p_discount_value DOUBLE,
    IN p_gross_value DOUBLE,
    IN p_net_value DOUBLE,
    IN p_paym_method_id BIGINT,
    IN p_client_id BIGINT,
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO invoice (date, discount_value, gross_value, net_value, paym_method_id, client_id, created_at, created_by, state, updated_at, updated_by)
    VALUES (p_date, p_discount_value, p_gross_value, p_net_value, p_paym_method_id, p_client_id, NOW(6), p_created_by, 1, NOW(6), p_created_by);
END $$

-- Procedure to update an invoice record
CREATE PROCEDURE spr_update_invoice(
    IN p_id BIGINT,
    IN p_date DATE,
    IN p_discount_value DOUBLE,
    IN p_gross_value DOUBLE,
    IN p_net_value DOUBLE,
    IN p_paym_method_id BIGINT,
    IN p_client_id BIGINT,
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE invoice
    SET date = p_date,
        discount_value = p_discount_value,
        gross_value = p_gross_value,
        net_value = p_net_value,
        paym_method_id = p_paym_method_id,
        client_id = p_client_id,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

-- Procedure to delete an invoice record (soft delete)
CREATE PROCEDURE spr_delete_invoice(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE invoice
    SET deleted_at = NOW(6),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END $$

-- Procedure to find all active invoices
CREATE PROCEDURE spr_find_all_invoice()
BEGIN
    SELECT id, date, discount_value, gross_value, net_value, paym_method_id, client_id, created_at, created_by, state, updated_at, updated_by
    FROM invoice
    WHERE state = 1;
END $$

-- Procedure to find an invoice record by id
CREATE PROCEDURE spr_find_invoice_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT id, date, discount_value, gross_value, net_value, paym_method_id, client_id, created_at, created_by, state, updated_at, updated_by
    FROM invoice
    WHERE id = p_id;
END $$

-- Procedure to update the state of an invoice record (activate/deactivate)
CREATE PROCEDURE spr_state_invoice(
    IN p_id BIGINT,
    IN p_state BIT(1),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE invoice
    SET state = p_state,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

DELIMITER ;
