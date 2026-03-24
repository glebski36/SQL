/* VALUES construct 
to generate, use something like:
	  ,'(' + '''' + SOME_TEXT + ''','+ '''' + SOME_TEXT + ''','+ '''' + SOME_TEXT + ''','+ '''' + CAST([SOME_NUMBER] as char(1)) + '''' + ')' AS [VALUES_CLAUSE_LINE]
*/
WITH cte1 (col1, col2, col3) AS
(
SELECT * 
FROM
	(VALUES ('ABC', 'BCD', 'CDE')
         ,('DEF', 'EFG', 'FGH')
  	                            ) AS A (SomeColumn1, SomeColumn2, SomeColumn3)
)
, cte2 (colA, colB) AS
(
  SELECT val1 AS c1, vol2 AS c2
  UNION ALL
  SELECT val3, val4
) 
SELECT * 
  FROM cte1
;
