DELIMITER $$

-- Procedure to create a company
CREATE PROCEDURE spr_create_company(
    IN p_address VARCHAR(255),
    IN p_email VARCHAR(100),
    IN p_name VARCHAR(100),
    IN p_phone VARCHAR(15),
    IN p_manager_id BIGINT,
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO company (address, email, name, phone, manager_id, created_at, created_by, state, updated_at, updated_by)
    VALUES (p_address, p_email, p_name, p_phone, p_manager_id, NOW(6), p_created_by, 1, NOW(6), p_created_by);
END $$

-- Procedure to update a company
CREATE PROCEDURE spr_update_company(
    IN p_id BIGINT,
    IN p_address VARCHAR(255),
    IN p_email VARCHAR(100),
    IN p_name VARCHAR(100),
    IN p_phone VARCHAR(15),
    IN p_manager_id BIGINT,
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE company
    SET address = p_address,
        email = p_email,
        name = p_name,
        phone = p_phone,
        manager_id = p_manager_id,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

-- Procedure to delete a company (soft delete)
CREATE PROCEDURE spr_delete_company(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE company
    SET deleted_at = NOW(6),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END $$

-- Procedure to find all active companies
CREATE PROCEDURE spr_find_all_company()
BEGIN
    SELECT id, address, email, name, phone, manager_id, created_at, created_by, state, updated_at, updated_by
    FROM company
    WHERE state = 1;
END $$

-- Procedure to find a company by id
CREATE PROCEDURE spr_find_company_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT id, address, email, name, phone, manager_id, created_at, created_by, state, updated_at, updated_by
    FROM company
    WHERE id = p_id;
END $$

-- Procedure to update the state of a company (activate/deactivate)
CREATE PROCEDURE spr_state_company(
    IN p_id BIGINT,
    IN p_state BIT(1),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE company
    SET state = p_state,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

DELIMITER ;
