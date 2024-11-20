-- Llamar a spr_create_person
CALL spr_create_person(
    '123 Main St',             -- p_address
    '123456789',               -- p_document_num
    'Passport',                -- p_document_type
    'john.doe@example.com',    -- p_email
    'John',                    -- p_first_name
    'Doe',                     -- p_last_name
    'Alexander',               -- p_middle_name
    '555-1234',                -- p_phone
    'Smith',                   -- p_second_last_name
    1                          -- p_created_by
);

-- Llamar a spr_update_person
CALL spr_update_person(
    1,                         -- p_id
    '456 Elm St',              -- p_address
    '987654321',               -- p_document_num
    'ID Card',                 -- p_document_type
    'jane.doe@example.com',    -- p_email
    'Jane',                    -- p_first_name
    'Doe',                     -- p_last_name
    'Maria',                   -- p_middle_name
    '555-5678',                -- p_phone
    'Brown',                   -- p_second_last_name
    2                          -- p_updated_by
);

-- Llamar a spr_delete_person
CALL spr_delete_person(
    1,                         -- p_id
    3                          -- p_deleted_by
);

-- Llamar a spr_find_all_person
CALL spr_find_all_person();

-- Llamar a spr_find_person_by_id
CALL spr_find_person_by_id(
    1                          -- p_id
);

-- Llamar a spr_state_person
CALL spr_state_person(1, 1, 4);
