
<%@ page import="java.lang.*"%>


<% 

  String leadManagementResult = (String)request.getAttribute("leadManagementResult");


%>

<HTML>
<head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta http-equiv="Content-Language" content="en-US-CA"/>
  <meta property="og:image" content="http://www.sfdcstatic.com/common/assets/img/logo-company-large.png" />
  <meta property="og:site_name" content="Salesforce.com" />
  <meta property="og:locale" content="en_US" />

  <title>Your referral has been sent to BeyondCore.</title>

  <link href="https://secure2.sfdcstatic.com/common/assets/css/min/standard-rwd-min.css" rel="stylesheet" type="text/css" />
            <link href="https://secure2.sfdcstatic.com/common/assets/css/min/rwd-form-min.css" rel="stylesheet" type="text/css" />
            <link href="https://secure2.sfdcstatic.com/common/assets/css/min/forms-redesign-min.css" rel="stylesheet" type="text/css" />

<style>
	table.debug {
	   border: 1px solid white;
	}
	tr.debug:nth-child(even) {
		background-color: #888888;
	}
	tr.debug:nth-child(odd) {
			background-color: #666666;
	}
	td.debug {
		font-family: Arial; 
		font-size: 10pt; 
		color: white;
		border: 1px solid white;
		padding: 2px;
	}
</style>

</head>

<body  class="en US form-theme-1 rwd rwd  profile-size-exists profile-size-ent profile-customer">

<center>
  <table border="0" style="width:820px">
   <tr>
     <td colspan="2">
        <center>       
        <div style="width:400px;"> 	 
            <img src="http://www.siia.net/archive/codies/2015/finalists/logos/BeyondCore%20Logo.png" class="flex" alt="" style="padding-top:5px"/>
        </div>
          </center>
      </td>
    <tr>
      <td colspan="2">
        <center><h2 class="center-max-scr2" style="padding-top:10px;font-weight:bold;">lead pass</h2></center>
      </td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>    
   </table> 

  <div id="pagewrap" style="width:800px;"> 
        <div id="layout">
          <div class="backgrd-009ddc" style="width:700px">
             <div class="cell-content bottom-30">
                         <div class="font-white font-14 top-30 left-30 right-30" style="width:600px;text-align: left;">
                            Thank you, your referral has been submitted.<BR>
			    <BR>
			    If you have any questions, please post to the <u>Cross-Selling BeyondCore</u> chatter group and the <b>Global Integration Desk</b> will assist.<BR>
			    <BR>
			    Next Steps: <BR>
			    - A BeyondCore SDR will connect with your prospect to qualify<BR>
			    - You will receive a notification when the lead is Disqualified, Qualified, Closed Won or Closed Lost<BR>
			    <BR>
			    Thanks again for your referral,<BR>
			    The BeyondCore Team<BR><BR><BR><HR><BR>
			    <%=leadManagementResult%>
                         </div>
               </div>
             </div>
          </div>
    </div>


 </center>

</html>