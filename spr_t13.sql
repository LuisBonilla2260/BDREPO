DELIMITER $$

-- Procedure to create a view record
CREATE PROCEDURE spr_create_view(
    IN p_code VARCHAR(20),
    IN p_description VARCHAR(255),
    IN p_name VARCHAR(100),
    IN p_path VARCHAR(255),
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO view (code, description, name, path, created_at, created_by, state, updated_at, updated_by)
    VALUES (p_code, p_description, p_name, p_path, NOW(6), p_created_by, 1, NOW(6), p_created_by);
END $$

-- Procedure to update a view record
CREATE PROCEDURE spr_update_view(
    IN p_id BIGINT,
    IN p_code VARCHAR(20),
    IN p_description VARCHAR(255),
    IN p_name VARCHAR(100),
    IN p_path VARCHAR(255),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE view
    SET code = p_code,
        description = p_description,
        name = p_name,
        path = p_path,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

-- Procedure to delete a view record (soft delete)
CREATE PROCEDURE spr_delete_view(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE view
    SET deleted_at = NOW(6),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END $$

-- Procedure to find all active view records
CREATE PROCEDURE spr_find_all_view()
BEGIN
    SELECT id, code, description, name, path, created_at, created_by, state, updated_at, updated_by
    FROM view
    WHERE state = 1;
END $$

-- Procedure to find a view by id
CREATE PROCEDURE spr_find_view_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT id, code, description, name, path, created_at, created_by, state, updated_at, updated_by
    FROM view
    WHERE id = p_id;
END $$

-- Procedure to update the state of a view (activate/deactivate)
CREATE PROCEDURE spr_state_view(
    IN p_id BIGINT,
    IN p_state BIT(1),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE view
    SET state = p_state,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

DELIMITER ;
