SELECT SUBSTR(AGE, 1, 1) || '0대',
       ROUND(COUNT(*) / (SELECT COUNT(*)
                         FROM TBLADDRESSBOOK
                         WHERE JOB = (SELECT JOB
                                      FROM TBLADDRESSBOOK
                                      GROUP BY JOB
                                      HAVING COUNT(*) = (
                                          SELECT MAX(COUNT(*))
                                          FROM TBLADDRESSBOOK
                                          GROUP BY JOB))) * 100,
             1) AS "비율"
FROM TBLADDRESSBOOK
WHERE JOB = (SELECT JOB
             FROM TBLADDRESSBOOK
             GROUP BY JOB
             HAVING COUNT(*) = (
                 SELECT MAX(COUNT(*))
                 FROM TBLADDRESSBOOK
                 GROUP BY JOB))
GROUP BY SUBSTR(AGE, 1, 1)
ORDER BY SUBSTR(AGE, 1, 1);