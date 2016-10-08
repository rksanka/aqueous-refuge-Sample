
<%@ page import="java.lang.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%

  String firstName = request.getParameter("FirstName");
  String lastName = request.getParameter("LastName");
  String title = request.getParameter("Title");
  String email = request.getParameter("Email");
  String company = request.getParameter("Company");
  String phone = request.getParameter("Phone");
  String street = request.getParameter("Street");
  String state = request.getParameter("State");
  String country = request.getParameter("Country"); 
  String hasOptedOutOfEmail = request.getParameter("HasOptedOutofEmail");

  String subSector = request.getParameter("SubSector"); 
  String subSectorLocked = request.getParameter("LockedSubSector"); 
  String industry = request.getParameter("Industry"); 

  String leadPasserName = request.getParameter("LeadPasserName");
  String leadPasserEmail = request.getParameter("LeadPasserEmail");
  String leadPasserId = request.getParameter("LeadPasserId");

  String counterpartName = request.getParameter("CounterpartName");
  String counterpartEmail = request.getParameter("CounterpartEmail");
  String counterpartId = request.getParameter("CounterpartId");
  
  String contactId = request.getParameter("ContactId");
  String accountId = request.getParameter("AccountId");   

  boolean requiredFieldMissing = false;

  System.out.println(
          "BeyondCore - Lead Pass from " +
		request.getRemoteAddr() + " for '" +
		firstName + " " +
		lastName + "' by " + 
		leadPasserEmail
	);

if( 
	(
	(request.getParameter("LeadPasserName") == null) || 
	(request.getParameter("LeadPasserName").length() == 0)
	)
	|| 
	(
	(request.getParameter("LastName") == null) || 
	(request.getParameter("LastName").length() == 0)
	) 
	|| 
	(
	(request.getParameter("LeadPasserEmail") == null) || 
	(request.getParameter("LeadPasserEmail").length() == 0)
	)
	|| 
	(
	(request.getParameter("Country") == null) || 
	(request.getParameter("Country").length() == 0)
	)
	|| 
	(
	(request.getParameter("Email") == null) || 
	(request.getParameter("Email").length() == 0)
	)
  
   ) {
       requiredFieldMissing = true;
   }

     	if (firstName == null) firstName = "";
     	if (title == null) title = "";
   	if (email == null) email = "";
   	if (company == null) company = "";
   	if (phone == null) phone = "";
   	if (street == null) street = "";
   	if (state == null) state = "";
   	if (country == null) country = "";
   	
   	if (subSector == null) subSector  = "";
   	if (subSectorLocked == null) subSectorLocked  = "";
   	if (industry == null) industry  = "";
   	
   	if (leadPasserEmail == null) leadPasserEmail = "";
   	if (leadPasserId == null) leadPasserId  = "";
   	if (leadPasserName == null) leadPasserName  = "";

   	if (counterpartEmail == null) counterpartEmail = "";
   	if (counterpartId == null) counterpartId  = "";
   	if (counterpartName == null) counterpartName  = "";
   	   	
   	if (contactId == null) contactId  = "";
   	if (accountId == null) accountId  = "";	    
   	
%>


<HTML>
<head>
  
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta http-equiv="Content-Language" content="en-US-CA"/>
  <meta property="og:type" content="website" />
  
  <meta name="description" content="BeyondCore Lead Pass"/>
  <meta property="og:title" content="BeyondCore Lead Pass" />
  <meta itemprop="name" content="BeyondCore Lead Pass" />
  <meta property="og:description" content="BeyondCore Lead Pass" /> 
  <meta itemprop="description" content="BeyondCore Lead Pass" />
  <meta property="og:site_name" content="BeyondCore Lead Pass" />
  
  <meta property="og:image" content="http://www.sfdcstatic.com/common/assets/img/logo-company-large.png" />  
  <meta property="og:locale" content="en_US" />

  <title>BeyondCore Lead Pass</title>

  <link href="https://secure2.sfdcstatic.com/common/assets/css/min/standard-rwd-min.css" rel="stylesheet" type="text/css" />
  <link href="https://secure2.sfdcstatic.com/common/assets/css/min/rwd-form-min.css" rel="stylesheet" type="text/css" />
  <link href="https://secure2.sfdcstatic.com/common/assets/css/min/forms-redesign-min.css" rel="stylesheet" type="text/css" />

  <script type="text/javascript">
  
  	function dispositionCounterpart()  
  	{
		if (<%=requiredFieldMissing%>) return;

  		if ((document.getElementById("PP_CounterpartEmail").value.length == 0) ||
  		   (document.getElementById("PP_CounterpartName").value.length == 0))
  		{  			  			
  			document.getElementById("InstructionA").innerHTML = "Please review your Lead information above, then complete the Qualification and Counterpart questions below. Click the <b><i>Pass Lead</i></b> button when finished.";
  			
  		} else {
  		     document.getElementById("InstructionA").innerHTML = "Please review your Lead information above, then complete the Qualification questions below. Click the 'Pass Lead' button when finished.";
  		}
  			
  			
  		if (document.getElementById("PP_CounterpartName").value.length == 0) {			    	    			    	    	
			    	    	document.getElementById("CounterpartNameLabel").style.visibility = "visible";
			    	    	document.getElementById("CounterpartNameQuestion").style.visibility = "visible";			    	    	
		} 
			    
		if (document.getElementById("PP_CounterpartEmail").value.length == 0) {			   			    	    	
			    	    	document.getElementById("CounterpartEmailLabel").style.visibility = "visible";
			    	    	document.getElementById("CounterpartEmailQuestion").style.visibility = "visible";			    	    	
		} 
	
  	}
  
	function submitform()
	{
	    var isLeadComplete = true;
	    var showCounterpartError = false;
			    	    
	    document.getElementById("CounterpartName").value = document.getElementById("PP_CounterpartName").value;
	    document.getElementById("CounterpartEmail").value = document.getElementById("PP_CounterpartEmail").value;	    
	    
	    document.getElementById("QualificationQuestion1").value = document.getElementById("QualificationQuestion1_Asked").value;	    
	    document.getElementById("QualificationQuestion2").value = document.getElementById("QualificationQuestion2_Asked").value;
	    document.getElementById("QualificationQuestion3").value = document.getElementById("QualificationQuestion3_Asked").value;
	    document.getElementById("QualificationQuestion4").value = document.getElementById("QualificationQuestion4_Asked").value;
	    document.getElementById("QualificationQuestion5").value = document.getElementById("QualificationQuestion5_Asked").value;
	    document.getElementById("QualificationQuestion6").value = document.getElementById("QualificationQuestion6_Asked").value;
	    document.getElementById("QualificationQuestion7").value = document.getElementById("QualificationQuestion7_Asked").value;
	    document.getElementById("QualificationQuestion8").value = document.getElementById("QualificationQuestion8_Asked").value;
	    document.getElementById("QualificationQuestion9").value = document.getElementById("QualificationQuestion9_Asked").value;
	    document.getElementById("QualificationQuestion10").value = document.getElementById("QualificationQuestion10_Asked").value;
	    document.getElementById("QualificationQuestion11").value = document.getElementById("QualificationQuestion11_Asked").value;
	    document.getElementById("QualificationQuestion12").value = document.getElementById("QualificationQuestion12_Asked").value;
	    document.getElementById("QualificationQuestion13").value = document.getElementById("QualificationQuestion13_Asked").value;
	    document.getElementById("QualificationQuestion14").value = document.getElementById("QualificationQuestion14_Asked").value;
	    document.getElementById("QualificationQuestion15").value = document.getElementById("QualificationQuestion15_Asked").value;

	    /*
	    if (document.getElementById("QualificationQuestion1").value.length == 0) {
		isLeadComplete = false;
		document.getElementById("QualificationQuestion1RF").style.visibility = "visible";
		document.getElementById("QualificationQuestion1_Asked").style.backgroundColor = "#FFB6C1";
	    } else {
		document.getElementById("QualificationQuestion1RF").style.visibility = "hidden";
		document.getElementById("QualificationQuestion1_Asked").style.backgroundColor = "#FFFFFF";
	    }
	    
	    if (document.getElementById("QualificationQuestion2").value.length == 0) {
		isLeadComplete = false;
		document.getElementById("QualificationQuestion2RF").style.visibility = "visible";
		document.getElementById("QualificationQuestion2_Asked").style.backgroundColor = "#FFB6C1";
	    } else {
		document.getElementById("QualificationQuestion2RF").style.visibility = "hidden";
		document.getElementById("QualificationQuestion2_Asked").style.backgroundColor = "#FFFFFF";
	    }

	    if (document.getElementById("QualificationQuestion3").value.length == 0) {
		isLeadComplete = false;
		document.getElementById("QualificationQuestion3RF").style.visibility = "visible";
		document.getElementById("QualificationQuestion3_Asked").style.backgroundColor = "#FFB6C1";
	    } else {
		document.getElementById("QualificationQuestion3RF").style.visibility = "hidden";
		document.getElementById("QualificationQuestion3_Asked").style.backgroundColor = "#FFFFFF";
	    }
	    */

	    if (document.getElementById("QualificationQuestion4").value.length == 0) {
		isLeadComplete = false;
		document.getElementById("QualificationQuestion4RF").style.visibility = "visible";
		document.getElementById("QualificationQuestion4_Asked").style.backgroundColor = "#FFB6C1";
	    } else {
		document.getElementById("QualificationQuestion4RF").style.visibility = "hidden";
		document.getElementById("QualificationQuestion4_Asked").style.backgroundColor = "#FFFFFF";
	    }

		/*
	    if (document.getElementById("QualificationQuestion5").value.length == 0) {
		isLeadComplete = false;
		document.getElementById("QualificationQuestion5RF").style.visibility = "visible";
		document.getElementById("QualificationQuestion5_Asked").style.backgroundColor = "#FFB6C1";
	    } else {
		document.getElementById("QualificationQuestion5RF").style.visibility = "hidden";
		document.getElementById("QualificationQuestion5_Asked").style.backgroundColor = "#FFFFFF";
	    }
		*/

	    if (document.getElementById("QualificationQuestion6").value.length == 0) {
		isLeadComplete = false;
		document.getElementById("QualificationQuestion6RF").style.visibility = "visible";
		document.getElementById("QualificationQuestion6_Asked").style.backgroundColor = "#FFB6C1";
	    } else {
		document.getElementById("QualificationQuestion6RF").style.visibility = "hidden";
		document.getElementById("QualificationQuestion6_Asked").style.backgroundColor = "#FFFFFF";
	    }

	    if (document.getElementById("QualificationQuestion7").value.length == 0) {
		isLeadComplete = false;
		document.getElementById("QualificationQuestion7RF").style.visibility = "visible";
		document.getElementById("QualificationQuestion7_Asked").style.backgroundColor = "#FFB6C1";
	    } else {
		document.getElementById("QualificationQuestion7RF").style.visibility = "hidden";
		document.getElementById("QualificationQuestion7_Asked").style.backgroundColor = "#FFFFFF";
	    }

	    if (document.getElementById("QualificationQuestion8").value.length == 0) {
		isLeadComplete = false;
		document.getElementById("QualificationQuestion8RF").style.visibility = "visible";
		document.getElementById("QualificationQuestion8_Asked").style.backgroundColor = "#FFB6C1";
	    } else {
		document.getElementById("QualificationQuestion8RF").style.visibility = "hidden";
		document.getElementById("QualificationQuestion8_Asked").style.backgroundColor = "#FFFFFF";
	    }

	    if (document.getElementById("QualificationQuestion9").value.length == 0) {
		isLeadComplete = false;
		document.getElementById("QualificationQuestion9RF").style.visibility = "visible";
		document.getElementById("QualificationQuestion9_Asked").style.backgroundColor = "#FFB6C1";
	    } else {
		document.getElementById("QualificationQuestion9RF").style.visibility = "hidden";
		document.getElementById("QualificationQuestion9_Asked").style.backgroundColor = "#FFFFFF";
	    }

	    if (document.getElementById("QualificationQuestion10").value.length == 0) {
		isLeadComplete = false;
		document.getElementById("QualificationQuestion10RF").style.visibility = "visible";
		document.getElementById("QualificationQuestion10_Asked").style.backgroundColor = "#FFB6C1";
	    } else {
		document.getElementById("QualificationQuestion10RF").style.visibility = "hidden";
		document.getElementById("QualificationQuestion10_Asked").style.backgroundColor = "#FFFFFF";
	    }

	    if (document.getElementById("QualificationQuestion11").value.length == 0) {
		isLeadComplete = false;
		document.getElementById("QualificationQuestion11RF").style.visibility = "visible";
		document.getElementById("QualificationQuestion11_Asked").style.backgroundColor = "#FFB6C1";
	    } else {
		document.getElementById("QualificationQuestion11RF").style.visibility = "hidden";
		document.getElementById("QualificationQuestion11_Asked").style.backgroundColor = "#FFFFFF";
	    }

	    if (document.getElementById("QualificationQuestion12").value.length == 0) {
		isLeadComplete = false;
		document.getElementById("QualificationQuestion12RF").style.visibility = "visible";
		document.getElementById("QualificationQuestion12_Asked").style.backgroundColor = "#FFB6C1";
	    } else {
		document.getElementById("QualificationQuestion12RF").style.visibility = "hidden";
		document.getElementById("QualificationQuestion12_Asked").style.backgroundColor = "#FFFFFF";
	    }

	    if (document.getElementById("QualificationQuestion13").value.length == 0) {
		isLeadComplete = false;
		document.getElementById("QualificationQuestion13RF").style.visibility = "visible";
		document.getElementById("QualificationQuestion13_Asked").style.backgroundColor = "#FFB6C1";
	    } else {
		document.getElementById("QualificationQuestion13RF").style.visibility = "hidden";
		document.getElementById("QualificationQuestion13_Asked").style.backgroundColor = "#FFFFFF";
	    }

	    if (document.getElementById("QualificationQuestion14").value.length == 0) {
		isLeadComplete = false;
		document.getElementById("QualificationQuestion14RF").style.visibility = "visible";
		document.getElementById("QualificationQuestion14_Asked").style.backgroundColor = "#FFB6C1";
	    } else {
		document.getElementById("QualificationQuestion14RF").style.visibility = "hidden";
		document.getElementById("QualificationQuestion14_Asked").style.backgroundColor = "#FFFFFF";
	    }
	    
	    if (document.getElementById("QualificationQuestion15").value.length == 0) {
	    		isLeadComplete = false;
	    		document.getElementById("QualificationQuestion15RF").style.visibility = "visible";
	    		document.getElementById("QualificationQuestion15_Asked").style.backgroundColor = "#FFB6C1";
	    	    } else {
	    		document.getElementById("QualificationQuestion15RF").style.visibility = "hidden";
	    		document.getElementById("QualificationQuestion15_Asked").style.backgroundColor = "#FFFFFF";
	    }
	    	    
	   
	    
	    if (document.getElementById("CounterpartName").value.length == 0) {
	    	    	isLeadComplete = false;
	    	    	document.getElementById("CounterpartNameRF").style.visibility = "visible";
	    	    	document.getElementById("PP_CounterpartName").style.backgroundColor = "#FFB6C1";
	    } else {
	    	document.getElementById("CounterpartNameRF").style.visibility = "hidden";
	    	document.getElementById("PP_CounterpartName").style.backgroundColor = "#FFFFFF";
	    }
	    
	    if (document.getElementById("CounterpartEmail").value.length == 0) {
	    	    	isLeadComplete = false;
	    	    	document.getElementById("CounterpartEmailRF").style.visibility = "visible";
	    	    	document.getElementById("PP_CounterpartEmail").style.backgroundColor = "#FFB6C1";
	    } else {
	    	document.getElementById("CounterpartEmailRF").style.visibility = "hidden";
	    	document.getElementById("PP_CounterpartEmail").style.backgroundColor = "#FFFFFF";
	    }
	    	    	    
	    
	    if (
	       (document.getElementById("CounterpartEmail").value.length == 0) ||
	       (document.getElementById("CounterpartEmail").value.indexOf('@')==-1) ||
	       (document.getElementById("CounterpartEmail").value.indexOf('.')==-1)
	      ){
	    	    	isLeadComplete = false;
	    	    	document.getElementById("CounterpartEmailRF").style.visibility = "visible";
	    	    	document.getElementById("PP_CounterpartEmail").style.backgroundColor = "#FFB6C1";
	    } else {

		    if (
		        (document.getElementById("CounterpartEmail").value.toUpperCase() == document.getElementById("LeadPasserEmail").value.toUpperCase()) ||
		        ((document.getElementById("CounterpartEmail").value.split("@").length - 1)>1)
		        ) {
	    	    	    	isLeadComplete = false;
	    	    	    	document.getElementById("CounterpartEmailRF").style.visibility = "visible";
	    	    	    	document.getElementById("PP_CounterpartEmail").style.backgroundColor = "#FFB6C1";
	    	    	    	showCounterpartError = true;
	    	    	    	
	    	    } else {
	    	    	document.getElementById("CounterpartEmailRF").style.visibility = "hidden";
	    	    	document.getElementById("PP_CounterpartEmail").style.backgroundColor = "#FFFFFF";	    	    	
		    }

	    }

	   if(showCounterpartError) {
	      document.getElementById("ErrorMessage").innerHTML = "Please fill out the highlighted fields above. Your name and password will automatically be included in the submission. Please provide one (1) name and one (1) email address for your Core/Analytics counterpart.";	    	    	    	
	   } else {
	      document.getElementById("ErrorMessage").innerHTML = "Please fill out the highlighted fields above.";	    	    	    	
	   }
	   
	   
	    	    	    	
	    if(!isLeadComplete) {
	      document.getElementById("ErrorMessage").style.visibility = "visible";	     	   
	      return;
	    } else {
	      document.getElementById("ErrorMessage").style.visibility = "hidden";	     	   
	    }
	
   	    document.getElementById("maskingoverlay").style.visibility = "visible";
   	    document.getElementById("maskingoverlay").style.zIndex = "10";
   	    document.getElementById("submitstatus").style.visibility = "visible";   	   
		     
	    document.leadpass.submit();	    	   	    
	}
			
	
  </script>
  
  <style>

   div.overlay {	
	position:fixed;
	left:0;
	top:0;
	background: rgba(150,150,150,0.6);
	height:100%;
	width:100%;
	z-index:-10;
	display: block;
	visibility:hidden;
  }
  
     div.submitstatus {	

    	position: fixed;
	top: 50%;
	left: 50%;
  	transform: translate(-50%, -50%);
	
	width: 600px;
	height: 200px;
  	
  	background: rgba(150,150,150,1.0);
  	display: block;
  	z-index:11;
  	display: block;
  	visibility:hidden;
  	color: #FFFFFF;
  	text-align: center;
  	font-size: 20px;
  	font-family: SalesforceSansRegular,Arial,sans-serif;
    	font-weight: normal;
  }

   div.prepoplabel {
     float:right;
     padding-top:5px;
     padding-right:10px;
     padding-left:0px;
     padding-top:10px;
     padding-bottom:4px;
     font-size:12px;
     color:#DDDDDD;
   }
   
   div.prepopvalue {
     float:left;
     padding-top:2px;
     padding-left:2px;
     padding-right:0px;
     padding-bottom:1px;
     width:310px;
     height:16px;
     border: 2px solid #c3e5f7;
     background-color: #dddddd;
     font-size:12px;
   }
   
   div.qualificationquestion {
        float:left;
        padding-top:5px;
        padding-left:10px;
        padding-right:0px;
        padding-bottom:2px;
        width:780px;
        font-size:14px;
        color:#FFFFFF;
   }
   
   span.requiredflag {
        font-size:20px;
     	color:#FFB6C1;
   	visibility:hidden;
   }
   
   div.ErrorMessage {
        font-size:15px;
        color:#FFB6C1;
      	visibility:hidden;
      	padding-left:7px;
      	font-family: SalesforceSansRegular,Arial,sans-serif;
   }
      
  </style>

</head>

<body class="en US form-theme-1 rwd rwd profile-size-exists profile-size-ent profile-customer" onload="dispositionCounterpart()">
  
  <center>
  <table border="0" style="width:400px;padding-top:5px">
   <tr>
   <td>
        <img src="http://www.siia.net/archive/codies/2015/finalists/logos/BeyondCore%20Logo.png" class="flex" alt=""/>
    </td>
    <tr>
    <td colspan="2">
    <center>
    	<h2 class="center-max-scr2" style="padding-top:0px;font-weight:bold;">
    		lead pass
    	</h2>
    </center>
    </td>
    </tr>
    <tr>
    <td colspan="2">
	&nbsp;
	</td>
	</tr>
    
   </table> 
  
<div id="pagewrap" class="touch-unhover" style="width:900px;"> 
  <div id="content-wrap">	
    <div class="content clearfix" style="">
      <div id="layout">
        <div class="grid-cell grid-40 cell-last width-100-max-scr2 backgrd-009ddc" style="width:900px;border: 4px solid #c3e5f7;">
          <div class="cell-content">
			
    <style>
        #header             {margin-bottom:0px;}
        .ie A.aloha-submit-mid-blue {background-color: #0582b7 !important;}
        .form-btn-caret         {padding-left: 10px; font-size: 16px;}
        #layout             {background-position: center top; background-repeat: repeat-y;}
        .endcap             {background-image: url("https://secure2.sfdcstatic.com/common/assets/images/salescloud/bg_bottom.png"); background-position: center top; background-repeat: repeat-y; height: 35px;}
    </style>
    
    <div id="form-container" class="clearfix wide-fields style-placeholder">  
        

<% if(requiredFieldMissing) { %>
<div style="color: #FFFFFF;text-align:left;text-wrap:normal;padding-top:20px;padding-right:10px;padding-left:10px;padding-bottom:5px;font-family:SalesforceSansRegular,Arial,sans-serif;font-weight: normal;">
	The following lead fields are mandatory:<BR>
	  1. <u>Contact email</u> (<%=email%>)<BR>
	  2. <u>Contact Last Name</u> (<%=lastName%>)<BR> 
	  3. <u>Contact Billing Country</u> (<%=country%>)<BR><BR>
	Please ensure that a value is populated for these three fields and try again.
</div>
<% } else { %>

<center>
<form id="leadpassvisible" name="leadpassvisible" method="" action="" class="form-builder-form" >            
  <table border="0" style="vertical-align:top;width:900px;">
    <tr>

			<td>                                
				<div class="prepoplabel">
				    <label for="FirstName">First name</label>
				</div>
			</td>
			
			<td>
				<div class="prepopvalue" name="PP_FirstName" id="PP_FirstName">
				  <%=firstName%>
				</div>                            
                	</td>

			<td>                                
				<div class="prepoplabel">
				    <label for="Company">Company</label>
				</div>
			</td>
			
			<td>
				<div class="prepopvalue" name="PP_Company" id="PP_Company">
				  <%=company%>
				</div>                               
                	</td>                	
                	
	</tr>
	<tr>
                	<td>                                    
                        <div class="prepoplabel">
                            <label for="LastName">Last name</label>
                        </div>
			</td>
			<td>
                        <div class="prepopvalue" name="PP_LastName" id="PP_LastName" >
                            <%=lastName%>
                        </div>                    
                    	</td>

                	<td>                                    
                        <div class="prepoplabel">
                            <label for="Phone">Phone</label>
                        </div>
			</td>
			<td>
                        <div class="prepopvalue" name="PP_Phone" id="PP_Phone" >
                            <%=phone%>
                        </div>                    
                    	</td>


         </tr>
         
         <tr>
                    	<td>                
                
                        <div class="prepoplabel">                
                                <label for="UserTitle">Job title</label>
                        </div>
			</td>
			<td>
                        <div class="prepopvalue" name="PP_Title" id="PP_Title" >
                                <%=title%>
                        </div>

			</td>

                    	<td>                                
                        <div class="prepoplabel">                
                                <label for="Street">Street</label>
                        </div>
			</td>
			<td>
                        <div class="prepopvalue" name="PP_Street" id="PP_Street" style="font-size:10px;">
                                <%=street%>
                        </div>
			</td>

			</tr>

                    	<tr>

                    	<td>                                
				<div class="prepoplabel">                
					<label for="Email">Email</label>
				</div>
			</td>
			<td>
				<div class="prepopvalue" name="PP_Email" id="PP_Email" >
					<%=email%>
				</div>
			</td>

			<td>
				<div class="prepoplabel">
					<label for="State">State</label>
				</div>
			</td>
			<td>
				<div class="prepopvalue" name="PP_State" id="PP_State" >
					<%=state%>
				</div>	
			</td>

			</tr>
			<tr>
			
				<td>                                
					<div class="prepoplabel">                
						<label for="Industry">Industry</label>
					</div>
				</td>
				<td>
					<div class="prepopvalue" name="PP_Industry" id="PP_Industry" >
						<%=industry%>
					</div>
				</td>
			

                    	<td>                                
	                        <div class="prepoplabel">                
	                                <label for="Country">Country</label>
	                        </div>
			</td>
			<td>
				<div class="prepopvalue" name="PP_Country" id="PP_Country" >
					<%=country%>
				</div>
			</td>
				
		</tr>
		<tr>
					<td>                                
						<div class="prepoplabel">                
							<label for="SubSector">SubSector</label>
						</div>
					</td>
					<td>
						<div class="prepopvalue" name="PP_SubSector" id="PP_SubSector" >
							<%=subSector%>
						</div>
					</td>
					<td>                                
						<div class="prepoplabel">                
							<label for="SubSectorLocked">SubSector (Locked)</label>
						</div>
					</td>
					<td>
						<div class="prepopvalue" name="PP_SubSectorLocked" id="PP_SubSectorLocked" >
							<%=subSectorLocked%>
						</div>
					</td>

		
	</tr>
	<tr>
	  <td colspan="4">
		<div id="InstructionA" class="font-white font-18" style="padding-top:15px;padding-right:10px;padding-left:10px;padding-bottom:5px;">
		</div>
	 </td>
	 </tr>
      
	<tr>
	<td colspan="4">
		   
                        <div class="qualificationquestion" id="QualificationQuestion1Label">
                             <span class="requiredflag" id="QualificationQuestion1RF">*</span>
                             <label for="QualificationQuestion1" class="qualificationquestion">What is the name of the champion?</label>
                         </div>
			
			 <div class="field" style="padding-left:2px;">
			    <input type="text" name="QualificationQuestion1_Asked" id="QualificationQuestion1_Asked" style="height:24px;font-size:12px;">
			</div>			

                        <div class="qualificationquestion" id="QualificationQuestion2Label">
                             <span class="requiredflag" id="QualificationQuestion2RF">*</span>
                             <label for="QualificationQuestion2" class="qualificationquestion">What is their role?</label>
                         </div>
                        
			 <div class="field" style="padding-left:2px;">
			    <input type="text" name="QualificationQuestion2_Asked" id="QualificationQuestion2_Asked" style="height:24px;font-size:12px;">
			</div>			

                        <div class="qualificationquestion" id="QualificationQuestion1Labe3">
                             <span class="requiredflag" id="QualificationQuestion3RF">*</span>
                             <label for="QualificationQuestion3" class="qualificationquestion">What is the name of the economic buyer?</label>
                         </div>
                        
			 <div class="field" style="padding-left:2px;">
			    <input type="text" name="QualificationQuestion3_Asked" id="QualificationQuestion3_Asked" style="height:24px;font-size:12px;">
			</div>			

                        <div class="qualificationquestion" id="QualificationQuestion4Label">
                             <span class="requiredflag" id="QualificationQuestion4RF">*</span>
                             <label for="QualificationQuestion4" class="qualificationquestion">Is there an Analytics project underway?</label>
                         </div>
                        
			 <div class="field">
			    <select name="QualificationQuestion4_Asked" id="QualificationQuestion4_Asked" autocomplete="off" style="width:700px;">
			       <optgroup style="font-size: 11px;white-space:pre-wrap;">
				 <option value="" selected="selected"></option>
				 <option value="Yes">Yes</option>
				 <option value="No">No</option>                                                     
			       </optgroup>                              
			    </select>                                      
			</div>

                        <div class="qualificationquestion" id="QualificationQuestion5Label">
                             <span class="requiredflag" id="QualificationQuestion5RF">*</span>
                             <label for="QualificationQuestion5" class="qualificationquestion">What is the name of the project?</label>
                         </div>

			 <div class="field" style="padding-left:2px;">
			    <input type="text" name="QualificationQuestion5_Asked" id="QualificationQuestion5_Asked" style="height:24px;font-size:12px;">
			</div>			                        

                         <div class="qualificationquestion" id="QualificationQuestion6Label">
                             <span class="requiredflag" id="QualificationQuestion6RF">*</span>
                             <label for="QualificationQuestion" class="qualificationquestion">If you are engaged with Sales, does the Sales Leader at your client have an initiative underway to:</label>
                         </div>
                        
			 <div class="field">
			    <select name="QualificationQuestion6_Asked" id="QualificationQuestion6_Asked" autocomplete="off" style="width:700px;">
			       <optgroup style="font-size: 11px;white-space:pre-wrap;">
				 <option value="" selected="selected"></option>
				 <option value="No initiative">No initiative</option>
				 <option value="determine whether the Pipeline supports the Forecast.">determine whether the Pipeline supports the Forecast.</option>
				 <option value="look for specific actions to increase the probability of winning an Opportunity.">look for specific actions to increase the probability of winning an Opportunity.</option>
				 <option value="understand the types of Opportunities worth pursuing and what are the specific attributes of those Opportunities.">understand the types of Opportunities worth pursuing and what are the specific attributes of those Opportunities.</option>
			       </optgroup>                              
			    </select>                                      
			</div>

                        <div class="qualificationquestion" id="QualificationQuestion7Label">
                             <span class="requiredflag" id="QualificationQuestion7RF">*</span>
                             <label for="QualificationQuestion7" class="qualificationquestion">If you are engaged with Sales, does the Sales Leader have an initiative underway to empower the sales reps to determine:</label>
                         </div>
                        
			 <div class="field">
			    <select name="QualificationQuestion7_Asked" id="QualificationQuestion7_Asked" autocomplete="off" style="width:700px;">
			       <optgroup style="font-size: 11px;white-space:pre-wrap;">
				 <option value="" selected="selected"></option>
				 <option value="No initiative">No initiative</option>
				 <option value="the likelihood of achieving quota based on my existing pipeline.">the likelihood of achieving quota based on my existing pipeline.</option>
				 <option value="the best accounts to target to pursue in order and Win a deal.">the best accounts to target to pursue in order and Win a deal.</option>
				 <option value="the specific factors that will improve the probability of winning the deal for each Opportunity in the pipeline.">the specific factors that will improve the probability of winning the deal for each Opportunity in the pipeline.</option>
				</optgroup>                              
			    </select>                                      
			</div>

                        <div class="qualificationquestion" id="QualificationQuestion8Label">
                             <span class="requiredflag" id="QualificationQuestion8RF">*</span>
                             <label for="QualificationQuestion8" class="qualificationquestion">If you are engaged with Finance, does your client's CFO or Finance Leader have an initiative underway to determine:</label>
                         </div>
                        
			 <div class="field">
			    <select name="QualificationQuestion8_Asked" id="QualificationQuestion8_Asked" autocomplete="off" style="width:700px;">
			       <optgroup style="font-size: 11px;white-space:pre-wrap;">
				 <option value="" selected="selected"></option>
				 <option value="No initiative">No initiative</option>
				 <option value="whether the Opportunity pipeline is sufficient to achieve the forecast?"> whether the Opportunity pipeline is sufficient to achieve the forecast?</option>
				 <option value="whether the Pipeline exceeds the Forecast?">whether the Pipeline exceeds the Forecast?</option>
				 <option value="the specific factors that could be addressed to avoid potential losses or Forecast shortfalls?">the specific factors that could be addressed to avoid potential losses or Forecast shortfalls?</option>				 
				 </optgroup>                              
			    </select>                                      
			</div>

                        <div class="qualificationquestion" id="QualificationQuestion9Label">
                             <span class="requiredflag" id="QualificationQuestion9RF">*</span>
                             <label for="QualificationQuestion9" class="qualificationquestion">If you are engaged with Product Management, does Product Management Leader have an effort underway to determine whether:</label>
                         </div>
                        
			 <div class="field">
			    <select name="QualificationQuestion9_Asked" id="QualificationQuestion9_Asked" autocomplete="off" style="width:700px;">
			       <optgroup style="font-size: 11px;white-space:pre-wrap;">
				 <option value="" selected="selected"></option>
				 <option value="No initiative">No initiative</option>
				 <option value="there is sufficient capacity in the Supply Chain to support the Forecast for all Opportunities?">there is sufficient capacity in the Supply Chain to support the Forecast for all Opportunities?</option>
				 <option value="there is sufficient infrastructure and resources to provision all Cloud orders within the fiscal period?">there is sufficient infrastructure and resources to provision all Cloud orders within the fiscal period?</option>
				</optgroup>                              
			    </select>                                      
			</div>

                        <div class="qualificationquestion" id="QualificationQuestion10Label">
                             <span class="requiredflag" id="QualificationQuestion10RF">*</span>
                             <label for="QualificationQuestion10" class="qualificationquestion">If you are engaged with Marketing, does your client's Marketing Leadership have a project underway to determine:</label>
                         </div>
                        
			 <div class="field">
			    <select name="QualificationQuestion10_Asked" id="QualificationQuestion10_Asked" autocomplete="off" style="width:700px;">
			       <optgroup style="font-size: 11px;white-space:pre-wrap;">
				 <option value="" selected="selected"></option>
				 <option value="No initiative">No initiative</option>
				 <option value="marketing campaigns to generate Opportunities and Revenue?">marketing campaigns to generate Opportunities and Revenue?</option>
				 <option value="how to most effectively spend Marketing budget to generate Leads that become Opportunities and Wins?">how to most effectively spend Marketing budget to generate Leads that become Opportunities and Wins?</option>
				 <option value="how Marketing can take actionwithin the current quarterto increase the Sales funnel?">how Marketing can take actionwithin the current quarterto increase the Sales funnel?</option>
				 </optgroup>                              
			    </select>                                      
			</div>

                        <div class="qualificationquestion" id="QualificationQuestion11Label">
                             <span class="requiredflag" id="QualificationQuestion11RF">*</span>
                             <label for="QualificationQuestion11" class="qualificationquestion">If you are engaged with Support, does your client have an initiative underway to determine:</label>
                         </div>
                        
			 <div class="field">
			    <select name="QualificationQuestion11_Asked" id="QualificationQuestion11_Asked" autocomplete="off" style="width:700px;">
			       <optgroup style="font-size: 11px;white-space:pre-wrap;">
				 <option value="" selected="selected"></option>
				 <option value="No initiative">No initiative</option>
				 <option value="the most effective way to reduce customer churn?">the most effective way to reduce customer churn?</option>
				 <option value="the most effective way to provide an excellent customer service experience?">the most effective way to provide an excellent customer service experience?</option>
				 <option value="the most effective way to sell more to my existing customers?">the most effective way to sell more to my existing customers?</option>
				 </optgroup>                              
			    </select>                                      
			</div>

                        <div class="qualificationquestion" id="QualificationQuestion12Label">
                             <span class="requiredflag" id="QualificationQuestion12RF">*</span>
                             <label for="QualificationQuestion12" class="qualificationquestion">If not any of the above: Are any of the following a good description of their business problem?</label>
                         </div>
                        
			 <div class="field">
			    <select name="QualificationQuestion12_Asked" id="QualificationQuestion12_Asked" autocomplete="off" style="width:700px;">
			       <optgroup style="font-size: 11px;white-space:pre-wrap;">
				 <option value="" selected="selected"></option>
				 <option value="No initiative">No initiative</option>
				 <option value="Understand spending patterns of my customers - which of my customers are the most profitable? Why? Where can I find more?">Understand spending patterns of my customers - which of my customers are the most profitable? Why? Where can I find more?</option>
				 <option value="How can I improve the Customer Experience?">How can I improve the Customer Experience?</option>
				 <option value="How can I reduce costs, expenses and risk in my business?">How can I reduce costs, expenses and risk in my business?</option>
				 <option value="Is the current Pricing model effective?">Is the current Pricing model effective?</option>
				 <option value="How do I make sense of the IOT data I am capturing?">How do I make sense of the IOT data I am capturing?</option>	
				 </optgroup>                              
			    </select>                                      
			</div>

                        <div class="qualificationquestion" id="QualificationQuestion13Label">
                             <span class="requiredflag" id="QualificationQuestion13RF">*</span>
                             <label for="QualificationQuestion13" class="qualificationquestion">Is there a significant renewal or expansion of salesforce.com services projected to close prior to the end of FY17?</label>
                         </div>
                        
			 <div class="field">
			    <select name="QualificationQuestion13_Asked" id="QualificationQuestion13_Asked" autocomplete="off" style="width:700px;">
			       <optgroup style="font-size: 11px;white-space:pre-wrap;">
				 <option value="" selected="selected"></option>
				 <option value="Yes">Yes</option>
				 <option value="No">No</option>
				</optgroup>                              
			    </select>                                      
			</div>

                        <div class="qualificationquestion" id="QualificationQuestion14Label">
                             <span class="requiredflag" id="QualificationQuestion14RF">*</span>
                             <label for="QualificationQuestion14" class="qualificationquestion">Size of overall salesforce Opportunity:</label>
                         </div>
                        
			 <div class="field">
			    <select name="QualificationQuestion14_Asked" id="QualificationQuestion14_Asked" autocomplete="off" style="width:700px;">
			       <optgroup style="font-size: 11px;white-space:pre-wrap;">
				 <option value="" selected="selected"></option>
				 <option value="$0 - $100,000">$0 - $100,000</option>
				 <option value="$250,000">$250,000</option>
				 <option value="$500,000">$500,000</option>
				 <option value="$1,000,000">$1,000,000</option>
				 <option value="&gt; $5,000,000">&gt;$5,000,000</option>
				</optgroup>                              
			    </select>                                      
			</div>

                        <div class="qualificationquestion" id="QualificationQuestion15Label">
                             <span class="requiredflag" id="QualificationQuestion15RF">*</span>
                             <label for="QualificationQuestion15" class="qualificationquestion">How large is the customer's data set? (Some examples of data are Leads, Opportunities (Closed & Lost), Invoices, Renewals, Sales Transactions, Customers, Expenses, Patients, Products, etc.)</label>
                         </div>
                        
			 <div class="field">
			    <select name="QualificationQuestion15_Asked" id="QualificationQuestion15_Asked" autocomplete="off" style="width:700px;">
			       <optgroup style="font-size: 11px;white-space:pre-wrap;">
				 <option value="" selected="selected"></option>
				 <option value="Less than 1,000 records">Less than 1,000 records</option>
				 <option value="Greater than 1,000 records">Greater than 1,000 records</option>
				 <option value="Greater than 10,000 records">Greater than 10,000 records</option>
				 <option value="Greater than 100,000 records">Greater than 100,000 records</option>
				 <option value="Don’t know">Don't know</option>
				</optgroup>                              
			    </select>                                      
			</div>

                        <div class="qualificationquestion" style="visibility:hidden;" id="CounterpartNameLabel">
                             <span class="requiredflag" id="CounterpartNameRF">*</span>
                             <label for="CounterpartName" class="qualificationquestion">What is the name of your Core/Analytics counterpart?</label>
                         </div>

                         <div class="field" style="padding-left:2px;visibility:hidden;" id="CounterpartNameQuestion">
                            <input type="text" name="PP_CounterpartName" id="PP_CounterpartName" style="height:24px;font-size:12px;" value="<%=counterpartName%>">
                        </div>

                        <div class="qualificationquestion" style="visibility:hidden;" id="CounterpartEmailLabel">
                             <span class="requiredflag" id="CounterpartEmailRF">*</span>
                             <label for="CounterpartEmail" class="qualificationquestion">What is the email address of your Core/Analytics counterpart?</label>
                         </div>

                         <div class="field" style="padding-left:2px;visibility:hidden;" id="CounterpartEmailQuestion">
                            <input type="text" name="PP_CounterpartEmail" id="PP_CounterpartEmail" style="height:24px;font-size:12px;" value="<%=counterpartEmail%>">
                        </div>



</form>

</td>
</tr>

  <tr>
    <td colspan="4">
	<form id="leadpass" name="leadpass" method="post" action="https://aqueous-refuge-42696.herokuapp.com/leadpass">

		<!-- Core Lead Fields -->
		<input  id="FirstName" name="FirstName" maxlength="40" type="hidden" value="<%=firstName%>"/>
		<input  id="LastName" name="LastName" maxlength="80" type="hidden" value="<%=lastName%>"/>
		<input  id="Title" name="Title" maxlength="128" type="hidden" value="<%=title%>"/>
		<input  id="Email" name="Email" maxlength="255" type="hidden" value="<%=email%>"/>
		<input  id="Company" name="Company" maxlength="80" type="hidden" value="<%=company%>"/>
		<input  id="Phone" name="Phone" maxlength="20" type="hidden" value="<%=phone%>"/>
		<input  id="Street" name="Street" maxlength="255" type="hidden" value="<%=street%>"/>
		<input  id="State" name="State" maxlength="80" type="hidden" value="<%=state%>"/>
		<input  id="Country" name="Country" maxlength="2" type="hidden" value="<%=country%>"/>		
		<input  id="HasOptedOutOfEmail" name="HasOptedOutOfEmail" maxlength="1" type="hidden" value="<%=hasOptedOutOfEmail%>"/>
		<input  id="Industry" name="Industry" maxlength="255" type="hidden" value="<%=industry%>"/>
		<input  id="SubSector" name="SubSector" maxlength="255" type="hidden" value="<%=subSector%>"/>
		<input  id="SubSectorLocked" name="SubSectorLocked" maxlength="255" type="hidden" value="<%=subSectorLocked%>"/>

		<!-- Lead Pass Metadata --> 
		<input  id="LeadPasserEmail" name="LeadPasserEmail" maxlength="255" type="hidden" value="<%=leadPasserEmail%>"/>		
		<input  id="LeadPasserName" name="LeadPasserName" maxlength="255" type="hidden" value="<%=leadPasserName%>"/>
		<input  id="LeadPasserId" name="LeadPasserId" maxlength="18" type="hidden" value="<%=leadPasserId%>"/>
		<input  id="ContactId" name="ContactId" maxlength="18" type="hidden" value="<%=contactId%>"/>
		<input  id="AccountId" name="AccountId" maxlength="18" type="hidden" value="<%=accountId%>"/>
		<input type="hidden" name="CounterpartName" id="CounterpartName" maxlength="255" value="<%=counterpartName%>">
		<input type="hidden" name="CounterpartEmail" id="CounterpartEmail" maxlength="255" value="<%=counterpartEmail%>">		
		<input type="hidden" name="CounterpartId" id="CounterpartId" maxlength="255" value="<%=counterpartId%>">		
 
		<!-- Qualification Questions -->		
		<input type="hidden" name="QualificationQuestion1" id="QualificationQuestion1" maxlength="255">
		<input type="hidden" name="QualificationQuestion2" id="QualificationQuestion2" maxlength="255">
		<input type="hidden" name="QualificationQuestion3" id="QualificationQuestion3" maxlength="255">
		<input type="hidden" name="QualificationQuestion4" id="QualificationQuestion4" maxlength="255">
		<input type="hidden" name="QualificationQuestion5" id="QualificationQuestion5" maxlength="255">
		<input type="hidden" name="QualificationQuestion6" id="QualificationQuestion6" maxlength="255">
		<input type="hidden" name="QualificationQuestion7" id="QualificationQuestion7" maxlength="255">
		<input type="hidden" name="QualificationQuestion8" id="QualificationQuestion8" maxlength="255">
		<input type="hidden" name="QualificationQuestion9" id="QualificationQuestion9" maxlength="255">
		<input type="hidden" name="QualificationQuestion10" id="QualificationQuestion10" maxlength="255">
		<input type="hidden" name="QualificationQuestion11" id="QualificationQuestion11" maxlength="255">
		<input type="hidden" name="QualificationQuestion12" id="QualificationQuestion12" maxlength="255">
		<input type="hidden" name="QualificationQuestion13" id="QualificationQuestion13" maxlength="255">
		<input type="hidden" name="QualificationQuestion14" id="QualificationQuestion14" maxlength="255">
		<input type="hidden" name="QualificationQuestion15" id="QualificationQuestion15" maxlength="255">
		
		<table border="0" width="900px" style="vertical-align:middle;">
		  <tr>
		    <td width="800px">		        
			<div id="ErrorMessage" class="ErrorMessage">
			   Please fill out the highlighted fields above.
			</div>			
		   </td>
		   <td width="100px">&nbsp;</td>
		   <td>
			    <div class="submit-container clearfix" style="position:relative;float:right;padding-bottom:10px;">
			     <a class="submit aloha-submit-mid-blue radius-flat-all btn bg-gradient-darkblue placeholder-style" style="width:200px" tabindex="0" href="javascript: submitform()"><span>Pass Lead</span></a> 
			    </div>
		  </td>
		  </tr></table>
	</form>
    </td>
  </tr>

</table>

</div> 

</div>      
 	   </div>
	  </div>						
        </div>
      </div>
    </div>
  </div>

<div class="overlay" id="maskingoverlay">
	&nbsp;
</div>

<div class="submitstatus" id="submitstatus">
	<span style="line-height: 200px; vertical-align: middle;">Submitting Lead..</span>
</div>

<% } %>

</center>
</body>
</html>