select 
        		COUNT(CASE WHEN (TIMESTAMPDIFF(YEAR,p.birthdate,now()))<15 THEN p.patient_id else null END) AS '0-14',
        		COUNT(CASE WHEN (TIMESTAMPDIFF(YEAR,p.birthdate,now())) between 15 AND 20 THEN p.patient_id else null END) AS '15-20',
        		COUNT(CASE WHEN (TIMESTAMPDIFF(YEAR,p.birthdate,now())) between 21 AND 30 THEN p.patient_id else null END) AS '21-30',
        		COUNT(CASE WHEN (TIMESTAMPDIFF(YEAR,p.birthdate,now())) between 31 AND 40 THEN p.patient_id else null END) AS '31-40',
        		COUNT(CASE WHEN (TIMESTAMPDIFF(YEAR,p.birthdate,now())) between 41 AND 50 THEN p.patient_id else null END) AS '41-50',
        		COUNT(CASE WHEN (TIMESTAMPDIFF(YEAR,p.birthdate,now())) between 51 AND 60 THEN p.patient_id else null END) AS '51-60',
        		COUNT(CASE WHEN (TIMESTAMPDIFF(YEAR,p.birthdate,now())) between 61 AND 70 THEN p.patient_id else null END) AS '61-70',
        		COUNT(CASE WHEN (TIMESTAMPDIFF(YEAR,p.birthdate,now())) between 71 AND 80 THEN p.patient_id else null END) AS '71-80',
        		COUNT(CASE WHEN (TIMESTAMPDIFF(YEAR,p.birthdate,now())) between 81 AND 90 THEN p.patient_id else null END) AS '81-90',
        		COUNT(CASE WHEN (TIMESTAMPDIFF(YEAR,p.birthdate,now())) between 91 AND 100 THEN p.patient_id else null END) AS '91-100',
        		COUNT(CASE WHEN (TIMESTAMPDIFF(YEAR,p.birthdate,now())) between 101 AND 110 THEN p.patient_id else null END) AS '101-110',
        		COUNT(CASE WHEN (TIMESTAMPDIFF(YEAR,p.birthdate,now())) between 111 AND 120 THEN p.patient_id else null END) AS '111-120',
        		COUNT(CASE WHEN (TIMESTAMPDIFF(YEAR,p.birthdate,now())) between 121 AND 130 THEN p.patient_id else null END) AS '121-130',
        		COUNT(CASE WHEN (TIMESTAMPDIFF(YEAR,p.birthdate,now())) > 130 THEN p.patient_id else null END) AS '>130',
                count(p.patient_id) as 'Nombre total de patients'
        FROM isanteplus.patient p;