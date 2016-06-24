[1mdiff --git a/add.cfm b/add.cfm[m
[1mindex fdaad6b..9f1ebf2 100644[m
[1m--- a/add.cfm[m
[1m+++ b/add.cfm[m
[36m@@ -1,8 +1,11 @@[m
 Changing Directly on Master[m
[32m+[m[32mAnother Change MAde[m[41m[m
[32m+[m[32mStaged, but not commited[m[41m[m
[32m+[m[32mMaking more change[m[41m[m
 <cfset CurrentPage=GetFileFromPath(GetTemplatePath())>[m
 <cfif IsDefined("FORM.MM_InsertRecord") AND FORM.MM_InsertRecord EQ "add">[m
 [m
[31m- <cfif not #FORM.name# IS "">  [m
[32m+[m[32m <cfif not #FORM.name# IS "">[m[41m[m
   <cfquery datasource="addressbook">[m
   INSERT INTO dbo.List (Name) VALUES ([m
   <cfif IsDefined("FORM.name") AND #FORM.name# NEQ "">[m
[36m@@ -10,76 +13,76 @@[m [mChanging Directly on Master[m
     <cfelse>[m
     NULL[m
   </cfif>[m
[31m-  ) [m
[32m+[m[32m  )[m[41m[m
   </cfquery>[m
   </cfif>[m
 [m
 <cfquery name="rsName" datasource="addressbook">[m
[31m-	SELECT dbo.List.ListID, dbo.List.Name FROM dbo.List WHERE dbo.List.Name = '#FORM.name#' [m
[32m+[m	[32mSELECT dbo.List.ListID, dbo.List.Name FROM dbo.List WHERE dbo.List.Name = '#FORM.name#'[m[41m[m
 </cfquery>[m
 <cfset Session.listid=#rsName.ListID#>[m
 [m
   <cfif not #FORM.phonenum# IS "">[m
   <cfquery datasource="addressbook">[m
[31m-  INSERT INTO dbo.Phone (PhoneNum, TypeNum, PhoneNote, ListID) VALUES ( [m
[32m+[m[32m  INSERT INTO dbo.Phone (PhoneNum, TypeNum, PhoneNote, ListID) VALUES ([m[41m[m
     '#FORM.phonenum#', '#FORM.typenum#', '#FORM.phonenote#', #rsName.ListID#[m
[31m-  ) [m
[32m+[m[32m  )[m[41m[m
   </cfquery>[m
   </cfif>[m
[31m-  [m
[31m-  <cfif not #FORM.email# IS "">  [m
[32m+[m[41m[m
[32m+[m[32m  <cfif not #FORM.email# IS "">[m[41m[m
   <cfquery datasource="addressbook">[m
[31m-  INSERT INTO dbo.Email (Email, ListID) VALUES ( [m
[32m+[m[32m  INSERT INTO dbo.Email (Email, ListID) VALUES ([m[41m[m
     '#FORM.email#', #rsName.ListID#[m
[31m-  ) [m
[32m+[m[32m  )[m[41m[m
   </cfquery>[m
   </cfif>[m
 [m
[31m-  <cfif not #FORM.address# IS "">    [m
[32m+[m[32m  <cfif not #FORM.address# IS "">[m[41m[m
   <cfquery datasource="addressbook">[m
[31m-  INSERT INTO dbo.Address (Address, ListID) VALUES ( [m
[32m+[m[32m  INSERT INTO dbo.Address (Address, ListID) VALUES ([m[41m[m
     '#FORM.address#', #rsName.ListID#[m
[31m-  ) [m
[32m+[m[32m  )[m[41m[m
   </cfquery>[m
   </cfif>[m
 [m
[31m-  <cfif not #FORM.url# IS "">    [m
[32m+[m[32m  <cfif not #FORM.url# IS "">[m[41m[m
   <cfquery datasource="addressbook">[m
[31m-  INSERT INTO dbo.URL (URL, ListID) VALUES ( [m
[32m+[m[32m  INSERT INTO dbo.URL (URL, ListID) VALUES ([m[41m[m
     '#FORM.url#', #rsName.ListID#[m
[31m-  ) [m
[32m+[m[32m  )[m[41m[m
   </cfquery>[m
   </cfif>[m
 [m
[31m-  <cfif not #FORM.note# IS "">  [m
[32m+[m[32m  <cfif not #FORM.note# IS "">[m[41m[m
   <cfquery datasource="addressbook">[m
[31m-  INSERT INTO dbo.Note (Note, ListID) VALUES ( [m
[32m+[m[32m  INSERT INTO dbo.Note (Note, ListID) VALUES ([m[41m[m
     '#FORM.note#', #rsName.ListID#[m
[31m-  )   [m
[31m-  </cfquery>   [m
[32m+[m[32m  )[m[41m[m
[32m+[m[32m  </cfquery>[m[41m[m
   </cfif>[m
 [m
[31m-  <cfif not #FORM.categorynum# IS "">    [m
[32m+[m[32m  <cfif not #FORM.categorynum# IS "">[m[41m[m
   <cfquery datasource="addressbook">[m
[31m-  INSERT INTO dbo.Category (CategoryNum, ListID) VALUES ( [m
[31m-    '#FORM.categorynum#', #rsName.ListID# ) [m
[31m-  </cfquery>   [m
[32m+[m[32m  INSERT INTO dbo.Category (CategoryNum, ListID) VALUES ([m[41m[m
[32m+[m[32m    '#FORM.categorynum#', #rsName.ListID# )[m[41m[m
[32m+[m[32m  </cfquery>[m[41m[m
   </cfif>[m
[31m- <cflocation url="view.cfm">  [m
[32m+[m[32m <cflocation url="view.cfm">[m[41m[m
 </cfif>[m
 [m
[31m- [m
[32m+[m[41m[m
 <cfquery name="rsPhoneType" datasource="addressbook">[m
[31m-SELECT * FROM dbo.PhoneType [m
[31m-ORDER BY [m
[32m+[m[32mSELECT * FROM dbo.PhoneType[m[41m[m
[32m+[m[32mORDER BY[m[41m[m
 CASE WHEN TypeNum = 3 THEN 0 ELSE TypeNum END ASC[m
 </cfquery>[m
 <cfquery name="rsBusiness" datasource="addressbook">[m
[31m-SELECT * FROM dbo.CategoryLU, dbo.GroupingLU WHERE CategoryLU.GroupingNum = GroupingLU.GroupingNum [m
[32m+[m[32mSELECT * FROM dbo.CategoryLU, dbo.GroupingLU WHERE CategoryLU.GroupingNum = GroupingLU.GroupingNum[m[41m[m
 AND GroupingLU.GroupingNum = 1 ORDER BY dbo.CategoryLU.Category[m
 </cfquery>[m
 <cfquery name="rsPeople" datasource="addressbook">[m
[31m-SELECT * FROM dbo.CategoryLU, dbo.GroupingLU WHERE CategoryLU.GroupingNum = GroupingLU.GroupingNum [m
[32m+[m[32mSELECT * FROM dbo.CategoryLU, dbo.GroupingLU WHERE CategoryLU.GroupingNum = GroupingLU.GroupingNum[m[41m[m
 AND GroupingLU.GroupingNum = 2 ORDER BY dbo.CategoryLU.Category[m
 </cfquery>[m
 <html>[m
[36m@@ -108,10 +111,10 @@[m [mvar phonelen = phonenum.value.length;[m
 <p>&nbsp;</p>[m
 <table width="700" border="0" cellspacing="0" cellpadding="0">[m
   <tr>[m
[31m-    <td> [m
[32m+[m[32m    <td>[m[41m[m
       <form action="<cfoutput>#CurrentPage#</cfoutput>" method="POST" name="add" id="add">[m
         <table width="700" border="0" align="center" cellpadding="5" cellspacing="0">[m
[31m-          <tr> [m
[32m+[m[32m          <tr>[m[41m[m
           <td width="93">&nbsp;</td>[m
           <td width="487" class="contenttitle">Add</td>[m
         </tr>[m
[36m@@ -125,65 +128,65 @@[m [mvar phonelen = phonenum.value.length;[m
           <tr>[m
             <td width="69" class="bodybold">[m
               <div align="right">Phone</div></td>[m
[31m-            <td width="16" class="bodybold">&nbsp;</td> [m
[31m-            <td width="614" class="bodytextsmall"> [m
[32m+[m[32m            <td width="16" class="bodybold">&nbsp;</td>[m[41m[m
[32m+[m[32m            <td width="614" class="bodytextsmall">[m[41m[m
               <input name="phonenum" type="text" id="phonenum" size="20" value="520-">[m
[31m-              , Type [m
[32m+[m[32m              , Type[m[41m[m
               <select name="typenum" id="typenum" onChange="addPhoneArea(this.value)";>[m
[31m-                <cfoutput query="rsPhoneType"> [m
[32m+[m[32m                <cfoutput query="rsPhoneType">[m[41m[m
                   <option value="#rsPhoneType.TypeNum#">#rsPhoneType.PhoneType#</option>[m
                 </cfoutput> </select>[m
[31m-              , Note [m
[32m+[m[32m              , Note[m[41m[m
               <input name="phonenote" type="text" id="phonenote" size="30"></td>[m
           </tr>[m
           <tr>[m
             <td class="bodybold">[m
               <div align="right">Email</div></td>[m
[31m-            <td class="bodybold">&nbsp;</td> [m
[32m+[m[32m            <td class="bodybold">&nbsp;</td>[m[41m[m
             <td class="bodytextsmall"> <input name="email" type="text" id="email" size="50"></td>[m
           </tr>[m
           <tr>[m
             <td class="bodybold">[m
               <div align="right">Address</div></td>[m
[31m-            <td class="bodybold">&nbsp;</td> [m
[32m+[m[32m            <td class="bodybold">&nbsp;</td>[m[41m[m
             <td class="bodytextsmall"> <textarea name="address" cols="70" rows="3" wrap="PHYSICAL" id="address"></textarea></td>[m
           </tr>[m
           <tr>[m
             <td class="bodybold">[m
               <div align="right">URL</div></td>[m
[31m-            <td class="bodybold">&nbsp;</td> [m
[32m+[m[32m            <td class="bodybold">&nbsp;</td>[m[41m[m
             <td class="bodytextsmall"> <input name="url" type="text" id="url" size="100"></td>[m
           </tr>[m
           <tr>[m
             <td class="bodybold">[m
               <div align="right">Note</div></td>[m
[31m-            <td class="bodybold">&nbsp;</td> [m
[32m+[m[32m            <td class="bodybold">&nbsp;</td>[m[41m[m
             <td class="bodytextsmall"> <textarea name="note" cols="100" rows="8" wrap="virtual" id="note"></textarea></td>[m
           </tr>[m
           <tr>[m
             <td class="bodybold">[m
               <div align="right">Category</div></td>[m
             <td class="bodybold">&nbsp;</td>[m
[31m-            <td class="bodytextsmall"> [m
[32m+[m[32m            <td class="bodytextsmall">[m[41m[m
               <select name="categorynum" id="categorynum">[m
                 <option value="">Business Categories</option>[m
[31m-                <cfoutput query="rsBusiness"> [m
[32m+[m[32m                <cfoutput query="rsBusiness">[m[41m[m
                   <option value="#rsBusiness.CategoryNum#">#rsBusiness.Category#</option>[m
[31m-                </cfoutput> [m
[32m+[m[32m                </cfoutput>[m[41m[m
               </select>[m
[31m-              or [m
[32m+[m[32m              or[m[41m[m
 				<select name="categorynum" id="categorynum">[m
 				  <option value="">People Categories</option>[m
[31m-                <cfoutput query="rsPeople"> [m
[32m+[m[32m                <cfoutput query="rsPeople">[m[41m[m
                   <option value="#rsPeople.CategoryNum#">#rsPeople.Category#</option>[m
[31m-                </cfoutput> [m
[32m+[m[32m                </cfoutput>[m[41m[m
               </select>[m
[31m-			  <input type="hidden" name="categorynum_required" value="Category, Please!">										[m
[32m+[m			[32m  <input type="hidden" name="categorynum_required" value="Category, Please!">[m[41m[m
 			</td>[m
           </tr>[m
           <tr>[m
             <td><div align="center"></div></td>[m
[31m-            <td>&nbsp;</td> [m
[32m+[m[32m            <td>&nbsp;</td>[m[41m[m
             <td class="bodytextsmall"> <input type="submit" name="Submit" value="Submit"></td>[m
           </tr>[m
         </table>[m
[1mdiff --git a/list.cfm b/list.cfm[m
[1mindex b5b45d4..c419d22 100644[m
[1m--- a/list.cfm[m
[1m+++ b/list.cfm[m
[36m@@ -1,14 +1,14 @@[m
 <!--- Changing Coldfusion --->[m
[31m-[m
[32m+[m[32m<!--- Changing Coldfusion --->[m[41m[m
 <cfparam name="listid" default="0" type="Numeric">[m
 [m
 <cfquery name="rsList" datasource="addressbook">[m
[31m-SELECT name, L.listid, Category      [m
[32m+[m[32mSELECT name, L.listid, Category[m[41m[m
 FROM CategoryLU CLU[m
 LEFT JOIN Category C[m
[31m-ON CLU.CategoryNum = C.CategoryNum [m
[31m-RIGHT JOIN List L [m
[31m-ON C.listid = L.listid [m
[32m+[m[32mON CLU.CategoryNum = C.CategoryNum[m[41m[m
[32m+[m[32mRIGHT JOIN List L[m[41m[m
[32m+[m[32mON C.listid = L.listid[m[41m[m
 where c.categorynum = #categorynum#[m
 Order by L.Name Asc[m
 </cfquery>[m
[36m@@ -26,21 +26,21 @@[m [mOrder by L.Name Asc[m
 <table width="600" border="0" align="left" cellpadding="5" cellspacing="0">[m
   <tr>[m
     <td> <table width="400" border="0" align="center" cellpadding="5" cellspacing="0">[m
[31m-        <tr> [m
[32m+[m[32m        <tr>[m[41m[m
           <td class="contenttitle">List of <cfoutput>#rsList.Category#</cfoutput><a href="list_note.cfm"> - with Notes</a></td>[m
         </tr>[m
       </table>[m
       <table width="400" border="0" align="center" cellpadding="5" cellspacing="0" class="dataTable">[m
[31m-        <tr class="dataTableHeader"> [m
[32m+[m[32m        <tr class="dataTableHeader">[m[41m[m
           <td width="294">Name</td>[m
           <td width="84"><div align="center"><a href="add.cfm">Add</a></div></td>[m
         </tr>[m
[31m-        <cfoutput query="rsList"> [m
[31m-          <tr class="bodytextsmall"> [m
[32m+[m[32m        <cfoutput query="rsList">[m[41m[m
[32m+[m[32m          <tr class="bodytextsmall">[m[41m[m
             <td><a href="view.cfm?listid=#rsList.ListID#">#rsList.Name#</a></td>[m
             <td><div align="center"><a href="delete.cfm?listid=#rsList.ListID#">Delete</a></div></td>[m
           </tr>[m
[31m-        </cfoutput> [m
[32m+[m[32m        </cfoutput>[m[41m[m
       </table>[m
       <p>&nbsp;</p></td>[m
   </tr>[m
[1mdiff --git a/test2 b/test2[m
[1mnew file mode 100644[m
[1mindex 0000000..4a1d2b6[m
[1m--- /dev/null[m
[1m+++ b/test2[m
[36m@@ -0,0 +1 @@[m
[32m+[m[32m'addr'[m[41m [m
[1mdiff --git a/test3 b/test3[m
[1mnew file mode 100644[m
[1mindex 0000000..4a1d2b6[m
[1m--- /dev/null[m
[1m+++ b/test3[m
[36m@@ -0,0 +1 @@[m
[32m+[m[32m'addr'[m[41m [m
