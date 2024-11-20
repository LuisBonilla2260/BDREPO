DELIMITER $$

-- Procedure to create a payment_method
CREATE PROCEDURE spr_create_payment_method(
    IN p_code VARCHAR(20),
    IN p_name VARCHAR(100),
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO payment_method (code, name, created_at, created_by, state, updated_at, updated_by)
    VALUES (p_code, p_name, NOW(6), p_created_by, 1, NOW(6), p_created_by);
END $$

-- Procedure to update a payment_method
CREATE PROCEDURE spr_update_payment_method(
    IN p_id BIGINT,
    IN p_code VARCHAR(20),
    IN p_name VARCHAR(100),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE payment_method
    SET code = p_code,
        name = p_name,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

-- Procedure to delete a payment_method (soft delete)
CREATE PROCEDURE spr_delete_payment_method(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE payment_method
    SET deleted_at = NOW(6),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END $$

-- Procedure to find all active payment_methods
CREATE PROCEDURE spr_find_all_payment_method()
BEGIN
    SELECT id, code, name, created_at, created_by, state, updated_at, updated_by
    FROM payment_method
    WHERE state = 1;
END $$

-- Procedure to find a payment_method by id
CREATE PROCEDURE spr_find_payment_method_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT id, code, name, created_at, created_by, state, updated_at, updated_by
    FROM payment_method
    WHERE id = p_id;
END $$

-- Procedure to update the state of a payment_method (activate/deactivate)
CREATE PROCEDURE spr_state_payment_method(
    IN p_id BIGINT,
    IN p_state BIT(1),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE payment_method
    SET state = p_state,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

DELIMITER ;
