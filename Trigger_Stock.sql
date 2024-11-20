DELIMITER $$

CREATE TRIGGER update_stock_after_invoice_detail_insert
AFTER INSERT ON invoice_detail
FOR EACH ROW
BEGIN
    -- Declare a variable to hold the current stock
    DECLARE current_stock INT;

    -- Retrieve the current stock for the product
    SELECT stock INTO current_stock
    FROM inventory
    WHERE product_id = NEW.product_id;

    -- Check if there is enough stock
    IF current_stock >= NEW.quantity THEN
        -- Update the stock
        UPDATE inventory
        SET stock = stock - NEW.quantity
        WHERE product_id = NEW.product_id;
    ELSE
        -- Raise an error if stock is insufficient
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock available';
    END IF;
END$$

DELIMITER ;
