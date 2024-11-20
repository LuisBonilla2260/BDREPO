DELIMITER $$

-- Procedure to create a person
CREATE PROCEDURE spr_create_person(
    IN p_address VARCHAR(255),
    IN p_document_num VARCHAR(15),
    IN p_document_type VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_first_name VARCHAR(50),
    IN p_last_name VARCHAR(50),
    IN p_middle_name VARCHAR(50),
    IN p_phone VARCHAR(15),
    IN p_second_last_name VARCHAR(50),
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO person (address, document_num, document_type, email, first_name, last_name, middle_name, phone, second_last_name, created_at, created_by, state, updated_at, updated_by)
    VALUES (p_address, p_document_num, p_document_type, p_email, p_first_name, p_last_name, p_middle_name, p_phone, p_second_last_name, NOW(6), p_created_by, 1, NOW(6), p_created_by);
END $$

-- Procedure to update a person
CREATE PROCEDURE spr_update_person(
    IN p_id BIGINT,
    IN p_address VARCHAR(255),
    IN p_document_num VARCHAR(15),
    IN p_document_type VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_first_name VARCHAR(50),
    IN p_last_name VARCHAR(50),
    IN p_middle_name VARCHAR(50),
    IN p_phone VARCHAR(15),
    IN p_second_last_name VARCHAR(50),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE person
    SET address = p_address,
        document_num = p_document_num,
        document_type = p_document_type,
        email = p_email,
        first_name = p_first_name,
        last_name = p_last_name,
        middle_name = p_middle_name,
        phone = p_phone,
        second_last_name = p_second_last_name,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

-- Procedure to delete a person (soft delete)
CREATE PROCEDURE spr_delete_person(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE person
    SET deleted_at = NOW(6),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END $$

-- Procedure to find all active persons
CREATE PROCEDURE spr_find_all_person()
BEGIN
    SELECT id, address, document_num, document_type, email, first_name, last_name, middle_name, phone, second_last_name, created_at, created_by, state, updated_at, updated_by
    FROM person
    WHERE state = 1;
END $$

-- Procedure to find a person by id
CREATE PROCEDURE spr_find_person_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT id, address, document_num, document_type, email, first_name, last_name, middle_name, phone, second_last_name, created_at, created_by, state, updated_at, updated_by
    FROM person
    WHERE id = p_id;
END $$

-- Procedure to update the state of a person (activate/deactivate)
CREATE PROCEDURE spr_state_person(
    IN p_id BIGINT,
    IN p_state BIT(1),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE person
    SET state = p_state,
        updated_at = NOW(6),
        updated_by = p_updated_by
    WHERE id = p_id;
END $$

DELIMITER ;
