DELIMITER $$

-- Procedure to create a product
CREATE PROCEDURE spr_create_product(
    IN p_code VARCHAR(20),
    IN p_description VARCHAR(255),
    IN p_name VARCHAR(100),
    IN p_category_id BIGINT,
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO product (code, description, name, category_id, created_at, created_by, state, updated_at, updated_by)
    VALUES (p_code, p_description, p_name, p_category_id, NOW(6), p_created_by, 1, NOW(6), p_created_by);
END $$

-- Procedure to update a product
CREATE PROCEDURE spr_update_product(
    IN p_id BIGINT,
    IN p_code VARCHAR(20),
    IN p_description VARCHAR(255),
    IN p_name VARCHAR(100),
    IN p_category_id BIGINT,
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE product
    SET code = p_code,
        description = p_description,
        name = p_name,
        category_id = p_category_id,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

-- Procedure to delete a product (soft delete)
CREATE PROCEDURE spr_delete_product(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE product
    SET deleted_at = NOW(6),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END $$

-- Procedure to find all active products
CREATE PROCEDURE spr_find_all_product()
BEGIN
    SELECT id, code, description, name, category_id, created_at, created_by, state, updated_at, updated_by
    FROM product
    WHERE state = 1;
END $$

-- Procedure to find a product by id
CREATE PROCEDURE spr_find_product_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT id, code, description, name, category_id, created_at, created_by, state, updated_at, updated_by
    FROM product
    WHERE id = p_id;
END $$

-- Procedure to update the state of a product (activate/deactivate)
CREATE PROCEDURE spr_state_product(
    IN p_id BIGINT,
    IN p_state BIT(1),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE product
    SET state = p_state,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

DELIMITER ;
