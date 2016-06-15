CREATE OR REPLACE PROCEDURE CT_CUSTOMER 
  IS V_TABCNT NUMBER; 
BEGIN 
      SELECT COUNT(*) INTO V_TABCNT 
      FROM ALL_TABLES 
      WHERE TABLE_NAME = 'CUSTOMER' AND 
      OWNER = USER;
      
      IF V_TABCNT = 0 THEN 
         EXECUTE IMMEDIATE 'CREATE TABLE CUSTOMER 
                          ( 
                            CUSTOMER_ID INTEGER PRIMARY KEY, 
                            FIRST_NAME VARCHAR2(20), 
                            CREDIT DECIMAL(10,2),
                          )';
                            
         COMMIT; 
         END IF;

        SELECT COUNT(*) INTO V_TABCNT
        FROM ALL_SEQUENCES
        WHERE SEQUENCE_NAME = 'SEQ_CUSTOMER_ID'
        AND SEQUENCE_OWNER = USER;

        IF V_TABCNT = 0 THEN
        EXECUTE IMMEDIATE
              'CREATE SEQUENCE SEQ_CUSTOMER_ID
               START WITH 1
               INCREMENT BY 1
               cache 20';

        COMMIT;
        END IF;
       
         
END CT_CUSTOMER; 