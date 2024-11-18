DELIMITER $$

-- Procedure to create a module_view record
CREATE PROCEDURE spr_create_module_view(
    IN p_module_id BIGINT,
    IN p_view_id BIGINT,
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO module_view (module_id, view_id, created_at, created_by, state, updated_at, updated_by)
    VALUES (p_module_id, p_view_id, NOW(6), p_created_by, 1, NOW(6), p_created_by);
END $$

-- Procedure to update a module_view record
CREATE PROCEDURE spr_update_module_view(
    IN p_id BIGINT,
    IN p_module_id BIGINT,
    IN p_view_id BIGINT,
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE module_view
    SET module_id = p_module_id,
        view_id = p_view_id,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

-- Procedure to delete a module_view record (soft delete)
CREATE PROCEDURE spr_delete_module_view(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE module_view
    SET deleted_at = NOW(6),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END $$

-- Procedure to find all active module_view records
CREATE PROCEDURE spr_find_all_module_view()
BEGIN
    SELECT id, module_id, view_id, created_at, created_by, state, updated_at, updated_by
    FROM module_view
    WHERE state = 1;
END $$

-- Procedure to find a module_view by id
CREATE PROCEDURE spr_find_module_view_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT id, module_id, view_id, created_at, created_by, state, updated_at, updated_by
    FROM module_view
    WHERE id = p_id;
END $$

-- Procedure to update the state of a module_view (activate/deactivate)
CREATE PROCEDURE spr_state_module_view(
    IN p_id BIGINT,
    IN p_state BIT(1),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE module_view
    SET state = p_state,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

DELIMITER ;
