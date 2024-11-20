	DELIMITER $$

	-- Procedure to create a category
	CREATE PROCEDURE spr_create_category(
		IN p_code VARCHAR(20),
		IN p_name VARCHAR(100),
		IN p_description TEXT,
		IN p_created_by BIGINT
	)
	BEGIN
		INSERT INTO category (code, name, description, created_at, created_by, state, updated_at, updated_by)
		VALUES (p_code, p_name, p_description, NOW(6), p_created_by, 1, NOW(6), p_created_by);
	END $$

	-- Procedure to update a category
	CREATE PROCEDURE spr_update_category(
		IN p_id BIGINT,
		IN p_code VARCHAR(20),
		IN p_name VARCHAR(100),
		IN p_description TEXT,
		IN p_updated_by BIGINT
	)
	BEGIN
		UPDATE category
		SET code = p_code,
			name = p_name,
			description = p_description,
			updated_at = NOW(6),
			updated_by = p_updated_by
		WHERE id = p_id;
	END $$

	-- Procedure to delete a category (soft delete)
	CREATE PROCEDURE spr_delete_category(
		IN p_id BIGINT,
		IN p_deleted_by BIGINT
	)
	BEGIN
		UPDATE category
		SET deleted_at = NOW(6),
			deleted_by = p_deleted_by,
			state = 0
		WHERE id = p_id;
	END $$

	-- Procedure to find all active categories
	CREATE PROCEDURE spr_find_all_category()
	BEGIN
		SELECT id, code, name, description, created_at, created_by, state, updated_at, updated_by
		FROM category
		WHERE state = 1;
	END $$

	-- Procedure to find a category by its id
	CREATE PROCEDURE spr_find_category_by_id(
		IN p_id BIGINT
	)
	BEGIN
		SELECT id, code, name, description, created_at, created_by, state, updated_at, updated_by
		FROM category
		WHERE id = p_id;
	END $$

	-- Procedure to update the state of a category (activate/deactivate)
	CREATE PROCEDURE spr_state_category(
		IN p_id BIGINT,
		IN p_state BIT(1),
		IN p_updated_by BIGINT
	)
	BEGIN
		UPDATE category
		SET state = p_state,
			updated_at = NOW(6),
			updated_by = p_updated_by
		WHERE id = p_id;
	END $$

	DELIMITER ;
