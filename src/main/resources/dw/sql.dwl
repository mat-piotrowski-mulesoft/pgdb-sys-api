fun dynamicUpdateQuery (tableName, setParams, whereParams) = do {
	var notNullParams = (params) -> params filterObject not isEmpty($)
    var setParamsString = keysOf(notNullParams(setParams)) map ($ ++ " = " ++ ":" ++ $) joinBy ", "
    var whereParamsString = keysOf(notNullParams(whereParams)) map ($ ++ " = " ++ ":" ++ $) joinBy " AND "
	---
    "UPDATE " ++ tableName ++
    " SET " ++ setParamsString ++
    " WHERE " ++ whereParamsString
}