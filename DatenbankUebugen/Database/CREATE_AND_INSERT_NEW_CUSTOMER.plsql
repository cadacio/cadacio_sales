CREATE OR replace PROCEDURE 
Proc_new_customer(customer_id OUT NUMBER,
                  first_name  IN VARCHAR2,
                  credit      IN OUT NUMBER) IS
BEGIN
    SELECT seq_customer_id.NEXTVAL
    INTO   customer_id
    FROM   dual;

    IF ( credit IS NULL ) THEN
    SELECT 100
    INTO   credit
    FROM   dual;
    
   END IF;

   INSERT INTO customer VALUES(customer_id,
                                first_name,
                                credit);
                                
END proc_new_customer; 