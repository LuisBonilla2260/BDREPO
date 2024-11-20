-- Call to create an invoice detail record
CALL spr_create_invoice_detail(10.0, 100.0, 90.0, 2, 1, 1, 1001);

-- Call to update an invoice detail record
CALL spr_update_invoice_detail(1, 15.0, 120.0, 105.0, 3, 2, 1, 1002);

-- Call to delete an invoice detail record (soft delete)
CALL spr_delete_invoice_detail(1, 1003);

-- Call to find all active invoice details for a specific invoice
CALL spr_find_all_invoice_detail(1);

-- Call to find an invoice detail record by ID
CALL spr_find_invoice_detail_by_id(1);

-- Call to update the state of an invoice detail record (activate/deactivate)
CALL spr_state_invoice_detail(1, 0, 1004);  -- 0 for deactivation
