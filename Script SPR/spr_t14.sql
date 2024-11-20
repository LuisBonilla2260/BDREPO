DELIMITER $$

-- Procedure to create a module record
CREATE PROCEDURE spr_create_module(
    IN p_code VARCHAR(20),
    IN p_description VARCHAR(255),
    IN p_name VARCHAR(100),
    IN p_path VARCHAR(255),
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO module (code, description, name, path, created_at, created_by, state, updated_at, updated_by)
    VALUES (p_code, p_description, p_name, p_path, NOW(6), p_created_by, 1, NOW(6), p_created_by);
END $$

-- Procedure to update a module record
CREATE PROCEDURE spr_update_module(
    IN p_id BIGINT,
    IN p_code VARCHAR(20),
    IN p_description VARCHAR(255),
    IN p_name VARCHAR(100),
    IN p_path VARCHAR(255),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE module
    SET code = p_code,
        description = p_description,
        name = p_name,
        path = p_path,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

-- Procedure to delete a module record (soft delete)
CREATE PROCEDURE spr_delete_module(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE module
    SET deleted_at = NOW(6),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END $$

-- Procedure to find all active module records
CREATE PROCEDURE spr_find_all_module()
BEGIN
    SELECT id, code, description, name, path, created_at, created_by, state, updated_at, updated_by
    FROM module
    WHERE state = 1;
END $$

-- Procedure to find a module by id
CREATE PROCEDURE spr_find_module_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT id, code, description, name, path, created_at, created_by, state, updated_at, updated_by
    FROM module
    WHERE id = p_id;
END $$

-- Procedure to update the state of a module (activate/deactivate)
CREATE PROCEDURE spr_state_module(
    IN p_id BIGINT,
    IN p_state BIT(1),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE module
    SET state = p_state,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

DELIMITER ;
