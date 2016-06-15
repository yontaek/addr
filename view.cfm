
<cfif IsDefined("URL.listid")>
  <cfset listid = #URL.listid#>
  <cfset Session.listid = #URL.listid#>
<cfelse> 
  <cfif IsDefined("Session.listid")>
  <cfset listid = #Session.listid#>
  <cfelse>
  <cflocation url="index.cfm" addtoken="no">
  </cfif>
</cfif>
<cfparam name="addressid" default="0" type="Numeric">
<cfparam name="phonenum" default="" type="String">
<cfparam name="emailid" default="0" type="Numeric">
<cfparam name="urlid" default="0" type="Numeric">
<cfparam name="categoryid" default="0" type="Numeric">
<cfquery name="rsList" datasource="addressbook">
SELECT Name, dbo.List.ListID FROM dbo.List WHERE ListID = #listid# 
</cfquery>
<cfquery name="rsPhone" datasource="addressbook">
SELECT * FROM dbo.Phone, dbo.PhoneType 
WHERE dbo.Phone.ListID = #listid# AND dbo.Phone.TypeNum = PhoneType.TypeNum ORDER 
BY dbo.Phone.TypeNum
</cfquery>
<cfquery name="rsEmail" datasource="addressbook">
SELECT Email, dbo.Email.EmailID FROM dbo.Email WHERE ListID = #listid# 
</cfquery>
<cfquery name="rsAddress" datasource="addressbook">
SET Language Korean 
SELECT AddressID, Address FROM dbo.Address WHERE ListID = #listid# 
</cfquery>
<cfquery name="rsURL" datasource="addressbook">
SELECT URL, dbo.URL.URLID FROM dbo.URL WHERE ListID = #listid# 
</cfquery>
<cfquery name="rsNote" datasource="addressbook">
SELECT Note, dbo.Note.NoteID, NoteTimeStamp FROM dbo.Note WHERE ListID = #listid# 
</cfquery>
<cfquery name="rsCategory" datasource="addressbook">
SELECT Category, Grouping, dbo.Category.CategoryID FROM dbo.Category, CategoryLU, 
GroupingLU WHERE ListID = #listid# and Category.CategoryNum = CategoryLU.CategoryNum 
and CategoryLU.GroupingNum = GroupingLu.GroupingNum 
</cfquery>

<html>
<head>
<title>View</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="addressbook.css" rel="stylesheet" type="text/css">
</head>

<body>
<p>&nbsp;</p>
<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td> <table width="600" border="0" cellpadding="5" cellspacing="0">
        <tr> 
          <td width="110" class="contenttitle">&nbsp;</td>
          <td width="519" class="contenttitle">View </td>
        </tr>
      </table>

      <table width="800" border="0" align="left" cellpadding="5" cellspacing="0" class="dataTable">
        <tr> 
          <td width="66" class="majorheading">Name</td>
          <td width="33" class="bodybold"><div align="center"><span class="bodybold"><a href="add.cfm">Add</a></span></div></td>
          <td width="769" class="bodytextsmall"> <table width="100%" border="1" cellpadding="3" cellspacing="0" bordercolor="#FF9900">
              <tr> 
                <td width="" bgcolor="#FFCC66" class="majorheading"><cfoutput>#rsList.Name#</cfoutput></td>
                <td width="80" class="bodytextsmall"><div align="center"><a href="name/edit.cfm?listid=<cfoutput>#rsList.ListID#</cfoutput>">Edit</a> 
                    | <a href="name/delete.cfm?listid=<cfoutput>#rsList.ListID#</cfoutput>">Delete</a></div></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td valign="middle" class="majorheading">Phone</td>
          <td class="bodybold"> <div align="center"><a href="phone/add.cfm">Add</a></div></td>
          <td class="bodytextsmall"> <table width="100%" border="1" cellpadding="3" cellspacing="0" bordercolor="#FF9900">
              <cfoutput query="rsPhone"> 
                <tr class="bodytextsmall"> 
                  <td width="" bgcolor="##FFFF66"> 
                    <span class="textpurple">#rsPhone.PhoneNum#</span>                    <cfif rsPhone.RecordCount GT 0>
                  (#rsPhone.PhoneType#) </cfif> #rsPhone.PhoneNote#</td>
                  <td width="80"> <div align="center"><a href="phone/edit.cfm?phoneID=#rsPhone.phoneID#"> 
                      <cfif rsPhone.RecordCount GT 0>
                        Edit 
                      </cfif>
                      </a> 
                      <cfif rsPhone.RecordCount GT 0>
                        | <a href="phone/delete.cfm?phoneID=#phoneID#">Delete</a> 
                      </cfif>
                    </div></td>
                </tr>
              </cfoutput> </table></td>
        </tr>
        <tr> 
          <td class="majorheading">Email</td>
          <td class="bodybold"> <div align="center"><a href="email/add.cfm">Add</a></div></td>
          <td class="bodytextsmall"><table width="100%" border="1" cellpadding="3" cellspacing="0" bordercolor="#FF9900">
              <cfoutput query="rsEmail"> 
                <tr class="bodytextsmall"> 
                  <td width="" bgcolor="##FFFF66" class="textpurple">#rsEmail.Email#</td>
                  <td width="80" bgcolor="##FFFF66" class="textpurple"><div align="center"><a href="email/email_primary.cfm?emailid=#rsEmail.EmailID#&num=#find("<b>",rsEmail.Email)#" class="navigation"><cfif #find("<b>",rsEmail.Email)# EQ 0>Make 1st<cfelse>Make 2nd</cfif></a> </div></td>
                  <td width="80"><div align="center"> 
                      <cfif rsEmail.RecordCount GT 0>
                        <a href="email/edit.cfm?emailid=#rsEmail.EmailID#">Edit</a> 
                        | <a href="email/delete.cfm?emailid=#rsEmail.EmailID#">Delete</a> 
                      </cfif>
                    </div></td>
                </tr>
              </cfoutput> </table></td>
        </tr>
        <tr> 
          <td valign="top" class="majorheading">Address</td>
          <td valign="middle" class="bodybold"> <div align="center"><a href="address/add.cfm">Add</a></div></td>
          <td class="bodytextsmall"><table width="100%" border="1" cellpadding="3" cellspacing="0" bordercolor="#FF9900">
              <cfoutput query="rsAddress"> 
                <tr class="bodytextsmall"> 
                  <td width="" bgcolor="##FFFF66" class="textpurple">
				  #Replace(rsAddress.Address, "#chr(13)##chr(10)#","<br>","all")#
				  </td>
                  <td width="80"><div align="center"> 
                      <cfif rsAddress.RecordCount GT 0>
                        <a href="address/edit.cfm?addressid=#rsAddress.AddressID#">Edit</a> 
                        | <a href="address/delete.cfm?addressid=#rsAddress.AddressID#">Delete</a> 
                      </cfif>
                    </div></td>
                </tr>
              </cfoutput> </table></td>
        </tr>
        <tr> 
          <td class="majorheading">URL</td>
          <td class="bodybold"> <div align="center"><a href="url/add.cfm">Add</a></div></td>
          <td class="bodytextsmall"><table width="100%" border="1" cellpadding="3" cellspacing="0" bordercolor="#FF9900">
              <cfoutput query="rsURL"> 
                <tr class="bodytextsmall"> 
                  <td width="" bgcolor="##FFFF66"><a href="#rsURL.URL#" target="_blank">#rsURL.URL#</a></td>
                  <td width="80"><div align="center"> 
                      <cfif rsURL.RecordCount GT 0>
                        <a href="url/edit.cfm?urlid=#rsURL.URLID#">Edit</a> 
                        | <a href="url/delete.cfm?urlid=#rsURL.URLID#">Delete</a> 
                      </cfif>
                    </div></td>
                </tr>
              </cfoutput> </table></td>
        </tr>
        <tr> 
          <td class="majorheading">Note</td>
          <td class="bodybold"> <div align="center"><a href="note/add.cfm">Add</a></div></td>
          <td class="bodytextsmall"><table width="100%" border="1" cellpadding="3" cellspacing="0" bordercolor="#FF9900">
              <cfoutput query="rsNote"> 
                <tr class="bodytextsmall"> 
                  <td width="" bgcolor="##FFFF66" class="textpurple">
				  #Replace(rsNote.Note, "#chr(13)##chr(10)#","<br>","all")#
                  <cfif NoteID GT 1752>(<span class="bodytextsmall">#DateFormat(NoteTimeStamp, "M/D/YYYY")#</span>)
                  </cfif>
                  </td>
                  <td width="80"><div align="center"><a href="note/edit.cfm?noteid=#rsNote.NoteID#"> 
                      <cfif rsNote.RecordCount GT 0>
                        Edit 
                      </cfif>
                      </a> 
                      <cfif rsNote.RecordCount GT 0>
                        | <a href="note/delete.cfm?noteid=#rsNote.NoteID#">Delete</a> 
                      </cfif>
                    </div></td>
                </tr>
              </cfoutput> </table></td>
        </tr>
        <tr> 
          <td class="majorheading">Category</td>
          <td class="bodybold"><div align="center"><a href="category/add.cfm">Add</a></div></td>
          <td class="bodytextsmall"> <table width="100%" border="1" cellpadding="3" cellspacing="0" bordercolor="#FF9900">
              <cfoutput query="rsCategory"> 
                <tr> 
                  <td width="" bgcolor="##FFCC66" class="bodytextsmall"><span class="textpurple">#rsCategory.Category#</span> (<span class="bodytext">#rsCategory.Grouping#</span>)</td>
                  <td width="80" class="bodytextsmall"> 
                    <div align="center"><a href="category/edit.cfm?categoryid=#rsCategory.CategoryID#">Edit</a> 
                      | <a href="category/delete.cfm?categoryid=#rsCategory.CategoryID#">Delete</a></div></td>
                </tr>
              </cfoutput> </table></td>
        </tr>
      </table>
      <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
