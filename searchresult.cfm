<!--- Filtering by search item --->
<cfswitch expression="#form.searchitem#">
	<cfcase value="1">
    	<cfset searchitem = "Name">
    </cfcase>
	<cfcase value="2">
    	<cfset searchitem = "PhoneNum">
    </cfcase>
	<cfcase value="3">
    	<cfset searchitem = "Email">
    </cfcase>
	<cfcase value="4">
    	<cfset searchitem = "Address">
    </cfcase>
	<cfcase value="5">
    	<cfset searchitem = "URL">
    </cfcase>
	<cfcase value="6">
    	<cfset searchitem = "Note">
    </cfcase>
</cfswitch>

<cfquery name="rsSearchResult" datasource="addressbook">
SELECT Category, Name, PhoneNum, PhoneType, Email, Address, URL, Note
FROM CategoryLU as CLU 
left join Category as C on CLU.CategoryNum = C.CategoryNum
Left Join List as L on L.ListID = C.ListID 
left join Phone as P on L.ListID = P.ListID 
Left join PhoneType as PT on P.TypeNum = PT.TypeNum 
Left Join Email as E on L.ListID = E.ListID
Left Join Address as A on L.ListID = A.ListID
Left Join URL as U on L.ListID = U.ListID
Left Join Note as N on L.ListID = N.ListID 
WHERE Lower(#searchitem#) like Lower('%#form.search#%') 
</cfquery>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Search Result</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="addressbook.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="95%" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td><p class="contenttitle">Search Result</p>
      <table width="100%" border="0" cellspacing="0" cellpadding="3">
        <tr class="bodytext"> 
          <td>Category</td>
          <td>Name</td>
          <td>Phone</td>
          <td>PhoneType</td>
          <td>Email</td>
          <td>Address</td>
          <td>URL</td>
          <td>Note</td>
        </tr>
        <cfoutput query="rsSearchResult">
          <tr class="bodytextsmall"> 
            <td>#rsSearchResult.Category#</td>
            <td>#rsSearchResult.Name#</td>
            <td>#rsSearchResult.PhoneNum#</td>
            <td>#rsSearchResult.PhoneType#</td>
            <td>#rsSearchResult.Email#</td>
            <td>#rsSearchResult.Address#</td>
            <td>
			<a href="#rsSearchResult.URL#" target="_blank"> 
              <cfif #len(#rsSearchResult.URL#)# greater than 25>
                #left("#rsSearchResult.URL#", 25)#..... 
                <cfelse>
                #rsSearchResult.URL# 
              </cfif>
			</td>
            <td>#rsSearchResult.Note#</td>
          </tr>
        </cfoutput> 
      </table>
      <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
