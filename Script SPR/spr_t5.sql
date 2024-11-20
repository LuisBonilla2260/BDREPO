DELIMITER $$

-- Procedure to create a branch
CREATE PROCEDURE spr_create_branch(
    IN p_address VARCHAR(255),
    IN p_email VARCHAR(100),
    IN p_name VARCHAR(100),
    IN p_phone VARCHAR(15),
    IN p_company_id BIGINT,
    IN p_responsible_id BIGINT,
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO branch (address, email, name, phone, company_id, responsible_id, created_at, created_by, state, updated_at, updated_by)
    VALUES (p_address, p_email, p_name, p_phone, p_company_id, p_responsible_id, NOW(6), p_created_by, 1, NOW(6), p_created_by);
END $$

-- Procedure to update a branch
CREATE PROCEDURE spr_update_branch(
    IN p_id BIGINT,
    IN p_address VARCHAR(255),
    IN p_email VARCHAR(100),
    IN p_name VARCHAR(100),
    IN p_phone VARCHAR(15),
    IN p_company_id BIGINT,
    IN p_responsible_id BIGINT,
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE branch
    SET address = p_address,
        email = p_email,
        name = p_name,
        phone = p_phone,
        company_id = p_company_id,
        responsible_id = p_responsible_id,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

-- Procedure to delete a branch (soft delete)
CREATE PROCEDURE spr_delete_branch(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE branch
    SET deleted_at = NOW(6),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END $$

-- Procedure to find all active branches
CREATE PROCEDURE spr_find_all_branch()
BEGIN
    SELECT id, address, email, name, phone, company_id, responsible_id, created_at, created_by, state, updated_at, updated_by
    FROM branch
    WHERE state = 1;
END $$

-- Procedure to find a branch by id
CREATE PROCEDURE spr_find_branch_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT id, address, email, name, phone, company_id, responsible_id, created_at, created_by, state, updated_at, updated_by
    FROM branch
    WHERE id = p_id;
END $$

-- Procedure to update the state of a branch (activate/deactivate)
CREATE PROCEDURE spr_state_branch(
    IN p_id BIGINT,
    IN p_state BIT(1),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE branch
    SET state = p_state,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

DELIMITER ;
