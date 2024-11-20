DELIMITER $$

CREATE TRIGGER audit_category_after_insert
AFTER INSERT ON category
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation_type, changed_data, changed_at, changed_by)
    VALUES (
        'category',
        'INSERT',
        JSON_OBJECT(
            'id', NEW.id,
            'code', NEW.code,
            'name', NEW.name,
            'description', NEW.description,
            'state', NEW.state
        ),
        NOW(),
        NEW.created_by
    );
END$$

CREATE TRIGGER audit_category_after_update
AFTER UPDATE ON category
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation_type, changed_data, changed_at, changed_by)
    VALUES (
        'category',
        'UPDATE',
        JSON_OBJECT(
            'id', OLD.id,
            'code', OLD.code,
            'name', OLD.name,
            'description', OLD.description,
            'state', OLD.state
        ),
        NOW(),
        NEW.updated_by
    );
END$$

CREATE TRIGGER audit_category_after_delete
AFTER DELETE ON category
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation_type, changed_data, changed_at, changed_by)
    VALUES (
        'category',
        'DELETE',
        JSON_OBJECT(
            'id', OLD.id,inventoryinventoryinvoiceinvoiceinvoiceinvoice_detailinvoice_detailpersonpersonpayment_methodpayment_methodpayment_methodpayment_methodmodule_viewmodule_viewinvoice_detail
            'code', OLD.code,
            'name', OLD.name,
            'description', OLD.description,
            'state', OLD.state
        ),
        NOW(),
        OLD.deleted_by
    );
END$$

DELIMITER ;
