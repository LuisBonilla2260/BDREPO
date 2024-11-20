DELIMITER $$

-- Procedure to create a role_module record
CREATE PROCEDURE spr_create_role_module(
    IN p_role_id BIGINT,
    IN p_module_id BIGINT,
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO role_module (role_id, module_id, created_at, created_by, state, updated_at, updated_by)
    VALUES (p_role_id, p_module_id, NOW(6), p_created_by, 1, NOW(6), p_created_by);
END $$

-- Procedure to update a role_module record
CREATE PROCEDURE spr_update_role_module(
    IN p_id BIGINT,
    IN p_role_id BIGINT,
    IN p_module_id BIGINT,
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE role_module
    SET role_id = p_role_id,
        module_id = p_module_id,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

-- Procedure to delete a role_module record (soft delete)
CREATE PROCEDURE spr_delete_role_module(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE role_module
    SET deleted_at = NOW(6),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END $$

-- Procedure to find all active role_module records
CREATE PROCEDURE spr_find_all_role_module()
BEGIN
    SELECT id, role_id, module_id, created_at, created_by, state, updated_at, updated_by
    FROM role_module
    WHERE state = 1;
END $$

-- Procedure to find a role_module by id
CREATE PROCEDURE spr_find_role_module_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT id, role_id, module_id, created_at, created_by, state, updated_at, updated_by
    FROM role_module
    WHERE id = p_id;
END $$

-- Procedure to update the state of a role_module (activate/deactivate)
CREATE PROCEDURE spr_state_role_module(
    IN p_id BIGINT,
    IN p_state BIT(1),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE role_module
    SET state = p_state,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

DELIMITER ;
