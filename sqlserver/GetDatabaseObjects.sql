/* Get Objects From Database (configure WHERE filters to determine returned objects) */
SELECT '[' + s.name + ']' + + '.' + '[' + o.name + ']' AS FullObjectName
, CASE o.type_desc WHEN 'USER_TABLE' THEN 'TABLE' ELSE o.type_desc END AS [Type]
FROM sys.objects o INNER JOIN sys.schemas s ON o.schema_id =s.schema_id
WHERE o.type != 'v' -- exclude views
  AND o.type_desc NOT IN ('SYSTEM_TABLE', 'INTERNAL_TABLE') -- exclude system tables
  -- and o.type != 'u' -- exclude user tables
ORDER BY [Type]
