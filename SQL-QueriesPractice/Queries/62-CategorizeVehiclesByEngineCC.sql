 -- Problem 62: Categorize vehicles into Heavy, Medium, Light based on Engine_CC  

USE VehicleMakesDB
GO

WITH StatusCC AS (
	SELECT
	((MAX(V.Engine_CC) - MIN(V.Engine_CC)) / 3 + MIN(V.Engine_CC)) AS MIN_CC,
	((MAX(V.Engine_CC) - MIN(V.Engine_CC)) / 3 * 2) + MIN(V.Engine_CC) AS MED_CC,
	MAX(V.Engine_CC) AS MAX_CC
	FROM VehicleDetails AS V
)
SELECT V.ID,
	   V.Engine_CC,
	CASE
		WHEN V.Engine_CC <= S.MIN_CC THEN 'Light' 
		WHEN V.Engine_CC <= S.MED_CC THEN 'Meduim'
		WHEN V.Engine_CC <= S.MAX_CC THEN 'Heavy'
		ELSE 'Unknown'
	END AS VehicleCategory

FROM VehicleDetails AS V, StatusCC AS S
GO
