
--main
--USE [ReportServer] 
SELECT c.[name] as reportName 
       ,e.username as userExec 
       ,e.TimeStart 
       ,e.TimeEnd 
       ,DATEDIFF(ss,e.TimeStart,e.TimeEnd) as TimeInSeconds 
       ,e.Parameters 
       ,c.ModifiedDate as ReportLastModified 
       ,u.username as userCreated 
FROM catalog c 
       INNER JOIN executionlogstorage e on c.itemid = e.reportid 
       INNER JOIN users u on c.modifiedbyid = u.userid 
WHERE e.TimeStart >= '2020-01-01' 
       AND e.TimeEnd < getdate() 
      -- AND c.[name] = 'Marketing_Bi' 
ORDER BY timestart DESC