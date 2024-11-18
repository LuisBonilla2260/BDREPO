	DELIMITER $$

-- Procedure to create a role record
CREATE PROCEDURE spr_create_role(
    IN p_code VARCHAR(20),
    IN p_name VARCHAR(100),
    IN p_description VARCHAR(255),
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO role (code, name, description, created_at, created_by, state, updated_at, updated_by)
    VALUES (p_code, p_name, p_description, NOW(6), p_created_by, 1, NOW(6), p_created_by);
END $$

-- Procedure to update a role record
CREATE PROCEDURE spr_update_role(
    IN p_id BIGINT,
    IN p_code VARCHAR(20),
    IN p_name VARCHAR(100),
    IN p_description VARCHAR(255),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE role
    SET code = p_code,
        name = p_name,
        description = p_description,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

-- Procedure to delete a role record (soft delete)
CREATE PROCEDURE spr_delete_role(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE role
    SET deleted_at = NOW(6),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END $$

-- Procedure to find all active roles
CREATE PROCEDURE spr_find_all_role()
BEGIN
    SELECT id, code, name, description, created_at, created_by, state, updated_at, updated_by
    FROM role
    WHERE state = 1;
END $$

-- Procedure to find a role by id
CREATE PROCEDURE spr_find_role_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT id, code, name, description, created_at, created_by, state, updated_at, updated_by
    FROM role
    WHERE id = p_id;
END $$

-- Procedure to update the state of a role (activate/deactivate)
CREATE PROCEDURE spr_state_role(
    IN p_id BIGINT,
    IN p_state BIT(1),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE role
    SET state = p_state,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

DELIMITER ;
