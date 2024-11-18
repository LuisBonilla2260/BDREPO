DELIMITER $$

-- Procedure to create a user record
CREATE PROCEDURE spr_create_user(
    IN p_password VARCHAR(255),
    IN p_username VARCHAR(50),
    IN p_person_id BIGINT,
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO user (password, username, person_id, created_at, created_by, state, updated_at, updated_by)
    VALUES (p_password, p_username, p_person_id, NOW(6), p_created_by, 1, NOW(6), p_created_by);
END $$

-- Procedure to update a user record
CREATE PROCEDURE spr_update_user(
    IN p_id BIGINT,
    IN p_password VARCHAR(255),
    IN p_username VARCHAR(50),
    IN p_person_id BIGINT,
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE user
    SET password = p_password,
        username = p_username,
        person_id = p_person_id,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

-- Procedure to delete a user record (soft delete)
CREATE PROCEDURE spr_delete_user(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE user
    SET deleted_at = NOW(6),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END $$

-- Procedure to find all active users
CREATE PROCEDURE spr_find_all_user()
BEGIN
    SELECT id, password, username, person_id, created_at, created_by, state, updated_at, updated_by
    FROM user
    WHERE state = 1;
END $$

-- Procedure to find a user by id
CREATE PROCEDURE spr_find_user_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT id, password, username, person_id, created_at, created_by, state, updated_at, updated_by
    FROM user
    WHERE id = p_id;
END $$

-- Procedure to update the state of a user (activate/deactivate)
CREATE PROCEDURE spr_state_user(
    IN p_id BIGINT,
    IN p_state BIT(1),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE user
    SET state = p_state,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

DELIMITER ;
