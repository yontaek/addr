Testing
Testing again
<cfset CurrentPage=GetFileFromPath(GetTemplatePath())>
<cfif IsDefined("FORM.MM_InsertRecord") AND FORM.MM_InsertRecord EQ "add">
 <cfif not #FORM.name# IS "">  
  <cfquery datasource="addressbook">
  INSERT INTO dbo.List (Name) VALUES (
  <cfif IsDefined("FORM.name") AND #FORM.name# NEQ "">
    '#FORM.name#'
    <cfelse>
    NULL
  </cfif>
  ) 
  </cfquery>
  </cfif>

<cfquery name="rsName" datasource="addressbook">
	SELECT dbo.List.ListID, dbo.List.Name FROM dbo.List WHERE dbo.List.Name = '#FORM.name#' 
</cfquery>
<cfset Session.listid=#rsName.ListID#>

  <cfif not #FORM.phonenum# IS "">
  <cfquery datasource="addressbook">
  INSERT INTO dbo.Phone (PhoneNum, TypeNum, PhoneNote, ListID) VALUES ( 
    '#FORM.phonenum#', '#FORM.typenum#', '#FORM.phonenote#', #rsName.ListID#
  ) 
  </cfquery>
  </cfif>
  
  <cfif not #FORM.email# IS "">  
  <cfquery datasource="addressbook">
  INSERT INTO dbo.Email (Email, ListID) VALUES ( 
    '#FORM.email#', #rsName.ListID#
  ) 
  </cfquery>
  </cfif>

  <cfif not #FORM.address# IS "">    
  <cfquery datasource="addressbook">
  INSERT INTO dbo.Address (Address, ListID) VALUES ( 
    '#FORM.address#', #rsName.ListID#
  ) 
  </cfquery>
  </cfif>

  <cfif not #FORM.url# IS "">    
  <cfquery datasource="addressbook">
  INSERT INTO dbo.URL (URL, ListID) VALUES ( 
    '#FORM.url#', #rsName.ListID#
  ) 
  </cfquery>
  </cfif>

  <cfif not #FORM.note# IS "">  
  <cfquery datasource="addressbook">
  INSERT INTO dbo.Note (Note, ListID) VALUES ( 
    '#FORM.note#', #rsName.ListID#
  )   
  </cfquery>   
  </cfif>

  <cfif not #FORM.categorynum# IS "">    
  <cfquery datasource="addressbook">
  INSERT INTO dbo.Category (CategoryNum, ListID) VALUES ( 
    '#FORM.categorynum#', #rsName.ListID# ) 
  </cfquery>   
  </cfif>
 <cflocation url="view.cfm">  
</cfif>

 
<cfquery name="rsPhoneType" datasource="addressbook">
SELECT * FROM dbo.PhoneType 
ORDER BY 
CASE WHEN TypeNum = 3 THEN 0 ELSE TypeNum END ASC
</cfquery>
<cfquery name="rsBusiness" datasource="addressbook">
SELECT * FROM dbo.CategoryLU, dbo.GroupingLU WHERE CategoryLU.GroupingNum = GroupingLU.GroupingNum 
AND GroupingLU.GroupingNum = 1 ORDER BY dbo.CategoryLU.Category
</cfquery>
<cfquery name="rsPeople" datasource="addressbook">
SELECT * FROM dbo.CategoryLU, dbo.GroupingLU WHERE CategoryLU.GroupingNum = GroupingLU.GroupingNum 
AND GroupingLU.GroupingNum = 2 ORDER BY dbo.CategoryLU.Category
</cfquery>
<html>
<head>
<title>Add</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="addressbook.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function addPhoneArea(phonetype) {
var phonenum = document.getElementById("phonenum");
var phonelen = phonenum.value.length;
	if (phonelen <= 4) {
		if (phonetype == 4) {
			phonenum.value = "800-";
			phonenum.focus();
		} else {
			phonenum.value = "520-";
			phonenum.focus();
		}
	}
}
</script>
</head>

<body onLoad="this.document.add.name.focus()">
<p>&nbsp;</p>
<table width="700" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td> 
      <form action="<cfoutput>#CurrentPage#</cfoutput>" method="POST" name="add" id="add">
        <table width="700" border="0" align="center" cellpadding="5" cellspacing="0">
          <tr> 
          <td width="93">&nbsp;</td>
          <td width="487" class="contenttitle">Add</td>
        </tr>
      </table>
		<table width="90%" border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <td class="bodybold"><div align="right">Name</div></td>
            <td class="bodybold">&nbsp;</td>
            <td class="bodytextsmall"><input name="name" type="text" id="name" size="40"></td>
          </tr>
          <tr>
            <td width="69" class="bodybold">
              <div align="right">Phone</div></td>
            <td width="16" class="bodybold">&nbsp;</td> 
            <td width="614" class="bodytextsmall"> 
              <input name="phonenum" type="text" id="phonenum" size="20" value="520-">
              , Type 
              <select name="typenum" id="typenum" onChange="addPhoneArea(this.value)";>
                <cfoutput query="rsPhoneType"> 
                  <option value="#rsPhoneType.TypeNum#">#rsPhoneType.PhoneType#</option>
                </cfoutput> </select>
              , Note 
              <input name="phonenote" type="text" id="phonenote" size="30"></td>
          </tr>
          <tr>
            <td class="bodybold">
              <div align="right">Email</div></td>
            <td class="bodybold">&nbsp;</td> 
            <td class="bodytextsmall"> <input name="email" type="text" id="email" size="50"></td>
          </tr>
          <tr>
            <td class="bodybold">
              <div align="right">Address</div></td>
            <td class="bodybold">&nbsp;</td> 
            <td class="bodytextsmall"> <textarea name="address" cols="70" rows="3" wrap="PHYSICAL" id="address"></textarea></td>
          </tr>
          <tr>
            <td class="bodybold">
              <div align="right">URL</div></td>
            <td class="bodybold">&nbsp;</td> 
            <td class="bodytextsmall"> <input name="url" type="text" id="url" size="100"></td>
          </tr>
          <tr>
            <td class="bodybold">
              <div align="right">Note</div></td>
            <td class="bodybold">&nbsp;</td> 
            <td class="bodytextsmall"> <textarea name="note" cols="100" rows="8" wrap="virtual" id="note"></textarea></td>
          </tr>
          <tr>
            <td class="bodybold">
              <div align="right">Category</div></td>
            <td class="bodybold">&nbsp;</td>
            <td class="bodytextsmall"> 
              <select name="categorynum" id="categorynum">
                <option value="">Business Categories</option>
                <cfoutput query="rsBusiness"> 
                  <option value="#rsBusiness.CategoryNum#">#rsBusiness.Category#</option>
                </cfoutput> 
              </select>
              or 
				<select name="categorynum" id="categorynum">
				  <option value="">People Categories</option>
                <cfoutput query="rsPeople"> 
                  <option value="#rsPeople.CategoryNum#">#rsPeople.Category#</option>
                </cfoutput> 
              </select>
			  <input type="hidden" name="categorynum_required" value="Category, Please!">										
			</td>
          </tr>
          <tr>
            <td><div align="center"></div></td>
            <td>&nbsp;</td> 
            <td class="bodytextsmall"> <input type="submit" name="Submit" value="Submit"></td>
          </tr>
        </table>
         <input type="hidden" name="MM_InsertRecord" value="add">
      </form>
      <p> </p>
      <p>&nbsp;</p></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp; </p>
</body>
</html>
