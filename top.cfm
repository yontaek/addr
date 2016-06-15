<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Top</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="addressbook.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="1000" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td width="">&nbsp;
    <p class="bigtitle">Addressbook </p></td>
    <!---<td width="587">&nbsp;</td>--->
  </tr>
  <tr>
    <!---<td>&nbsp;</td>--->
    <td><form action="searchresult.cfm" method="post" name="search" id="search" target="main">
        <input name="search" type="text" id="search" size="50" >
        <select name="searchitem" id="searchitem">
        	<option value="1">Name</option>
            <option value="2">Phone</option>
            <option value="3">Email</option>
            <option value="4">Address</option>
            <option value="5">URL</option>
            <option value="6">Note</option>
        </select>
        <input type="submit" name="Submit" value="Search">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <span class="bodybold"><a href="view.cfm?listid=208" target="main">Yontaek/Sara</a> | <a href="view.cfm?listid=217" target="main">Steve</a> | <a href="view.cfm?listid=221" target="main">Mike</a> | <a href="view.cfm?listid=396" target="main">YMin</a></span>
      </form>
    </td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>
</body>
</html>
