<cfparam name="listid" default="0" type="Numeric">
<cfif not IsDefined("categorynum")>
<cfset categorynum = #session.categorynum#>
</cfif>
<cfquery name="rsList" datasource="addressbook">
SELECT name, L.listid, Category     
FROM CategoryLU CLU
LEFT JOIN Category C
ON CLU.CategoryNum = C.CategoryNum 
RIGHT JOIN List L 
ON C.listid = L.listid 
where c.categorynum = #categorynum#
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
<p></p>
<table width="95%" border="0" align="left" cellpadding="5" cellspacing="0">
  <tr>
    <td> <table width="400" border="0" align="center" cellpadding="5" cellspacing="0">
        <tr> 
          <td class="contenttitle">List of <cfoutput>#rsList.Category#</cfoutput><a href="list.cfm"> - without Notes</a></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="5" cellspacing="0" class="dataTable">
        <tr class="dataTableHeader"> 
          <td width="20%">Name</td>
          <td width="70%">Note</td>
          <td width="5%"><div align="center"><a href="add.cfm">Add</a></div></td>
        </tr>
        <cfoutput query="rsList"> 
        <cfquery name="rsNotes" datasource="addressbook">
        	SELECT Note FROM Note WHERE ListID = #listid#
        </cfquery>
          <tr class="bodytextsmall"> 
            <td align="left" valign="top"><a href="view.cfm?listid=#rsList.ListID#">#rsList.Name#</a></td>
            <td>
			<cfloop query="rsNotes">
            	<a href="view.cfm?listid=#rsList.ListID#">#rsNotes.Note#</a><br />
            </cfloop>
			</td>
            <td><div align="center"><a href="delete.cfm?listid=#rsList.ListID#">Delete</a></div></td>
          </tr>
        </cfoutput> 
      </table>
      <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
