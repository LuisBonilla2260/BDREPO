DELIMITER $$

-- Procedure to create an inventory record
CREATE PROCEDURE spr_create_inventory(
    IN p_date DATE,
    IN p_purchase_value DOUBLE,
    IN p_sale_value DOUBLE,
    IN p_stock INT,
    IN p_branch_id BIGINT,
    IN p_product_id BIGINT,
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO inventory (date, purchase_value, sale_value, stock, branch_id, product_id, created_at, created_by, state, updated_at, updated_by)
    VALUES (p_date, p_purchase_value, p_sale_value, p_stock, p_branch_id, p_product_id, NOW(6), p_created_by, 1, NOW(6), p_created_by);
END $$

-- Procedure to update an inventory record
CREATE PROCEDURE spr_update_inventory(
    IN p_id BIGINT,
    IN p_date DATE,
    IN p_purchase_value DOUBLE,
    IN p_sale_value DOUBLE,
    IN p_stock INT,
    IN p_branch_id BIGINT,
    IN p_product_id BIGINT,
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE inventory
    SET date = p_date,
        purchase_value = p_purchase_value,
        sale_value = p_sale_value,
        stock = p_stock,
        branch_id = p_branch_id,
        product_id = p_product_id,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

-- Procedure to delete an inventory record (soft delete)
CREATE PROCEDURE spr_delete_inventory(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE inventory
    SET deleted_at = NOW(6),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END $$

-- Procedure to find all active inventory records
CREATE PROCEDURE spr_find_all_inventory()
BEGIN
    SELECT id, date, purchase_value, sale_value, stock, branch_id, product_id, created_at, created_by, state, updated_at, updated_by
    FROM inventory
    WHERE state = 1;
END $$

-- Procedure to find an inventory record by id
CREATE PROCEDURE spr_find_inventory_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT id, date, purchase_value, sale_value, stock, branch_id, product_id, created_at, created_by, state, updated_at, updated_by
    FROM inventory
    WHERE id = p_id;
END $$

-- Procedure to update the state of an inventory record (activate/deactivate)
CREATE PROCEDURE spr_state_inventory(
    IN p_id BIGINT,
    IN p_state BIT(1),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE inventory
    SET state = p_state,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

DELIMITER ;
