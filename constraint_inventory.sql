SELECT * FROM edrink24.inventory;

ALTER TABLE inventory
ADD CONSTRAINT inventory_quantity_non_minus
CHECK (quantity>= 0);

commit;
