<cfparam name="listid" default="0" type="Numeric">
<cfif not IsDefined("categorynum")>
<cfset categorynum = #session.categorynum#>
</cfif>
<cfquery name="rsList" datasource="addressbook">
select distinct name, phonenum, email, L.listid, Category, PhoneType     
from CategoryLU as CLU, 
category as c left join List as L on c.listid = l.listid
left join Email as e  on C.listid = e.listid 
left join phone as p on C.listid = p.listid 
left join PhoneType as PT on P.TypeNum = PT.TypeNum 
where c.categorynum = #categorynum# and 
C.CategoryNum = CLU.CategoryNum 
Order by L.Name Asc
</cfquery>
<cfset session.categorynum = #categorynum#>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>LIst</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="addressbook.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="800" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td> <p align="center" class="contenttitle">List of <cfoutput>#rsList.Category#</cfoutput></p>
      <table width="800" border="0" cellspacing="0" cellpadding="5">
        <tr class="bodybold"> 
          <td width="151">Name</td>
          <td width="235">Phone</td>
          <td width="185">Email</td>
          <td width="189"><a href="add.cfm">Add</a></td>
        </tr>
        <cfoutput query="rsList"> 
          <tr class="bodytextsmall"> 
            <td>#rsList.Name#</td>
            <td>#rsList.PhoneNum# (#rsList.PhoneType#)</td>
            <td>#rsList.Email#</td>
            <td><a href="view.cfm?listid=#rsList.ListID#">View</a> 
              | <a href="edit.cfm?listid=#rsList.ListID#">Edit</a> 
              | <a href="delete.cfm?listid=#rsList.ListID#">Delete</a></td>
          </tr>
        </cfoutput> 
      </table>
      <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
