DELIMITER $$

-- Procedure to create an invoice detail record
CREATE PROCEDURE spr_create_invoice_detail(
    IN p_discount_percentage DOUBLE,
    IN p_gross_value DOUBLE,
    IN p_net_value DOUBLE,
    IN p_quantity INT,
    IN p_product_id BIGINT,
    IN p_invoice_id BIGINT,
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO invoice_detail (discount_percentage, gross_value, net_value, quantity, product_id, invoice_id, created_at, created_by, state, updated_at, updated_by)
    VALUES (p_discount_percentage, p_gross_value, p_net_value, p_quantity, p_product_id, p_invoice_id, NOW(6), p_created_by, 1, NOW(6), p_created_by);
END $$

-- Procedure to update an invoice detail record
CREATE PROCEDURE spr_update_invoice_detail(
    IN p_id BIGINT,
    IN p_discount_percentage DOUBLE,
    IN p_gross_value DOUBLE,
    IN p_net_value DOUBLE,
    IN p_quantity INT,
    IN p_product_id BIGINT,
    IN p_invoice_id BIGINT,
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE invoice_detail
    SET discount_percentage = p_discount_percentage,
        gross_value = p_gross_value,
        net_value = p_net_value,
        quantity = p_quantity,
        product_id = p_product_id,
        invoice_id = p_invoice_id,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

-- Procedure to delete an invoice detail record (soft delete)
CREATE PROCEDURE spr_delete_invoice_detail(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE invoice_detail
    SET deleted_at = NOW(6),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END $$

-- Procedure to find all active invoice details for a specific invoice
CREATE PROCEDURE spr_find_all_invoice_detail(
    IN p_invoice_id BIGINT
)
BEGIN
    SELECT id, discount_percentage, gross_value, net_value, quantity, product_id, invoice_id, created_at, created_by, state, updated_at, updated_by
    FROM invoice_detail
    WHERE invoice_id = p_invoice_id AND state = 1;
END $$

-- Procedure to find an invoice detail record by id
CREATE PROCEDURE spr_find_invoice_detail_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT id, discount_percentage, gross_value, net_value, quantity, product_id, invoice_id, created_at, created_by, state, updated_at, updated_by
    FROM invoice_detail
    WHERE id = p_id;
END $$

-- Procedure to update the state of an invoice detail record (activate/deactivate)
CREATE PROCEDURE spr_state_invoice_detail(
    IN p_id BIGINT,
    IN p_state BIT(1),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE invoice_detail
    SET state = p_state,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

DELIMITER ;
