DELIMITER $$

-- Procedure to create a user_role record
CREATE PROCEDURE spr_create_user_role(
    IN p_role_id BIGINT,
    IN p_user_id BIGINT,
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO user_role (role_id, user_id, created_at, created_by, state, updated_at, updated_by)
    VALUES (p_role_id, p_user_id, NOW(6), p_created_by, 1, NOW(6), p_created_by);
END $$

-- Procedure to update a user_role record
CREATE PROCEDURE spr_update_user_role(
    IN p_id BIGINT,
    IN p_role_id BIGINT,
    IN p_user_id BIGINT,
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE user_role
    SET role_id = p_role_id,
        user_id = p_user_id,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

-- Procedure to delete a user_role record (soft delete)
CREATE PROCEDURE spr_delete_user_role(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE user_role
    SET deleted_at = NOW(6),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END $$

-- Procedure to find all active user_role records
CREATE PROCEDURE spr_find_all_user_role()
BEGIN
    SELECT id, role_id, user_id, created_at, created_by, state, updated_at, updated_by
    FROM user_role
    WHERE state = 1;
END $$

-- Procedure to find a user_role by id
CREATE PROCEDURE spr_find_user_role_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT id, role_id, user_id, created_at, created_by, state, updated_at, updated_by
    FROM user_role
    WHERE id = p_id;
END $$

-- Procedure to update the state of a user_role (activate/deactivate)
CREATE PROCEDURE spr_state_user_role(
    IN p_id BIGINT,
    IN p_state BIT(1),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE user_role
    SET state = p_state,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

DELIMITER ;
