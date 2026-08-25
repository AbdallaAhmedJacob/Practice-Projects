 -- Problem 68: Get all vehicles where VehicleDisplayName contains duplicated words  

 USE VehicleMakesDB
 GO

SELECT V.ID, V.VehicleDisplayName
FROM VehicleDetails V
WHERE (
	SELECT COUNT(DISTINCT LTRIM(S.value))
	FROM string_split(V.VehicleDisplayName, ' ') S
	WHERE LTRIM(RTRIM(S.value)) <> ' '
	) < (
		SELECT COUNT(*) 
		FROM string_split(V.VehicleDisplayName, ' ') S
		WHERE LTRIM(RTRIM(S.value)) <> ' '
)