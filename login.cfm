<cfquery name="rsLogin" datasource="addressbook">
SELECT * FROM dbo."Admin" 
</cfquery>
<cfif IsDefined("FORM.a_user")>
  <cfset MM_redirectLoginSuccess="index.cfm">
  <cfset MM_redirectLoginFailed="login.cfm">
  <cfquery  name="MM_rsUser" datasource="addressbook">
  SELECT A_User,A_Pass FROM dbo.Admin WHERE A_User='#FORM.a_user#' AND A_Pass='#FORM.a_pass#' 
  </cfquery>
  <cfif MM_rsUser.RecordCount NEQ 0>
    <cftry>
      <cflock scope="Session" timeout="30" type="Exclusive">
        <cfset Session.MM_Username=FORM.a_user>
        <cfset Session.MM_UserAuthorization="">
      </cflock>
      <cfif IsDefined("URL.accessdenied") AND false>
        <cfset MM_redirectLoginSuccess=URL.accessdenied>
      </cfif>
      <cflocation url="#MM_redirectLoginSuccess#" addtoken="no">
      <cfcatch type="Lock">
        <!--- code for handling timeout of cflock --->
      </cfcatch>
    </cftry>
  </cfif>
  <cflocation url="#MM_redirectLoginFailed#" addtoken="no">
  <cfelse>
  <cfset MM_LoginAction=CGI.SCRIPT_NAME>
  <cfif CGI.QUERY_STRING NEQ "">
    <cfset MM_LoginAction=MM_LoginAction & "?" & CGI.QUERY_STRING>
  </cfif>
</cfif>
<html>
<head>
<title>Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="addressbook.css" rel="stylesheet" type="text/css">
</head>

<body onLoad="this.document.login.a_user.focus()">
<p>&nbsp;</p><p>&nbsp;</p>
<table width="600" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td>
<form action="<cfoutput>#MM_loginAction#</cfoutput>" method="POST" name="login" id="login">
        <table width="400" border="0" align="center" cellpadding="5" cellspacing="0">
          <tr> 
            <td width="94">&nbsp;</td>
            <td width="286" class="contenttitle">Login</td>
          </tr>
        </table>

        <table width="400" border="0" align="center" cellpadding="5" cellspacing="0" class="dataTable">
          <tr>
            <td width="110" class="bodybold">Username</td>
            <td width="370" class="bodytextsmall"> 
              <input name="a_user" type="text" id="a_user"></td>
          </tr>
          <tr>
            <td class="bodybold">Password</td>
            <td class="bodytextsmall"> 
              <input name="a_pass" type="password" id="a_pass"></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
<input type="submit" name="Submit" value="Submit"></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>
</html>
