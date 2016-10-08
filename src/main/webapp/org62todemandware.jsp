
<%@ page import="java.lang.*"%>

<%

  String firstName = request.getParameter("FirstName");
  String lastName = request.getParameter("LastName");
  String title = request.getParameter("Title");
  String email = request.getParameter("Email");
  String company = request.getParameter("Company");
  String phone = request.getParameter("Phone");
  String street = request.getParameter("Street");
  String country = request.getParameter("Country"); 

  String leadPasserEmail = request.getParameter("LeadPasserEmail");
  String leadPasserId = request.getParameter("LeadPasserId");
  String leadPasserName = request.getParameter("LeadPasserName");
  String leadId = request.getParameter("LeadId");
  String contactId = request.getParameter("ContactId");
  String accountId = request.getParameter("AccountId");

  	if (title == null) title = "";
	if (email == null) email = "";
	if (company == null) company = "";
	if (phone == null) phone = "";
	if (street == null) street = "";
	if (country == null) country = "";
	if (leadPasserEmail == null) leadPasserEmail = "";
	if (leadPasserId == null) leadPasserId  = "";
	if (leadPasserName == null) leadPasserName  = "";
	if (leadId == null) leadId  = "";
	if (contactId == null) contactId  = "";
	if (accountId == null) accountId  = "";
	 

  //TESTING
  //country = "US";


System.out.println(
          "Demandware - HTTP Request: " +
		request.getRemoteAddr() + "_" +
		firstName + "_" +
		lastName + "_"
	);


if( 
	(
	(request.getParameter("FirstName") == null) || 
	(request.getParameter("FirstName").length() == 0)
	)
	&& 
	(
	(request.getParameter("LastName") == null) || 
	(request.getParameter("LastName").length() == 0)
	) 
   ) {
%>

<HTML>
  <BODY>Required data missing. Please contact salesforce support.</BODY>
</HTML>

<% } else { %>


<HTML>
<head>
  
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta http-equiv="Content-Language" content="en-US-CA"/>
  <meta name="description" content="Demandware Lead Pass."/>
  <meta property="og:title" content="Demandware Lead Pass." />
  <meta itemprop="name" content="Demandware Lead Pass." />
  <meta property="og:type" content="website" />
  <meta property="og:description" content="Demandware Lead Pass." /> 
  <meta itemprop="description" content="Demandware Lead Pass." />
  <meta property="og:image" content="http://www.sfdcstatic.com/common/assets/img/logo-company-large.png" />
  <meta property="og:site_name" content="Salesforce.com" />
  <meta property="og:locale" content="en_US" />

  <title>Demandware Lead Pass.</title>

  <link href="https://secure2.sfdcstatic.com/common/assets/css/min/standard-rwd-min.css" rel="stylesheet" type="text/css" />
  <link href="https://secure2.sfdcstatic.com/common/assets/css/min/rwd-form-min.css" rel="stylesheet" type="text/css" />
  <link href="https://secure2.sfdcstatic.com/common/assets/css/min/forms-redesign-min.css" rel="stylesheet" type="text/css" />

  <script type="text/javascript">
  
  	function dispositionState()
  	{
  		if ((document.getElementById("PP_Country").textContent.trim() == "US") ||
  		   (document.getElementById("PP_Country").textContent.trim() == "CA"))
  		{
  			document.getElementById("State_Label").style.visibility = "visible";
  			document.getElementById("State_Asked").style.visibility = "visible";
  			
  			document.getElementById("InstructionA").innerHTML = "Please complete all of the following questions and select a State/Province above.";
  			
  		} else {
  			document.getElementById("InstructionA").innerHTML = "Please complete all of the following questions.";
  		}
  	}
  
	function submitform()
	{
	    var isLeadComplete = true;
		
	    document.getElementById("FirstName").value = document.getElementById("PP_FirstName").textContent.trim();	    
	    document.getElementById("LastName").value = document.getElementById("PP_LastName").textContent.trim();
	    document.getElementById("Title").value = document.getElementById("PP_Title").textContent.trim();
	    document.getElementById("Email").value = document.getElementById("PP_Email").textContent.trim();
	    document.getElementById("Company").value = document.getElementById("PP_Company").textContent.trim();
	    document.getElementById("Phone").value = document.getElementById("PP_Phone").textContent.trim();
	    document.getElementById("Street").value = document.getElementById("PP_Street").textContent.trim();
	    document.getElementById("Country").value = document.getElementById("PP_Country").textContent.trim();
	    
	    document.getElementById("State").value = document.getElementById("State_Asked").value;
	    
	    document.getElementById("QualificationQuestion1").value = document.getElementById("QualificationQuestion1_Asked").value;
	    document.getElementById("QualificationQuestion2").value = document.getElementById("QualificationQuestion2_Asked").value;
	    document.getElementById("QualificationQuestion3").value = document.getElementById("QualificationQuestion3_Asked").value;
	    document.getElementById("QualificationQuestion4").value = document.getElementById("QualificationQuestion4_Asked").value;
	    document.getElementById("QualificationQuestion5").value = document.getElementById("QualificationQuestion5_Asked").value;
	    document.getElementById("QualificationQuestion6").value = document.getElementById("QualificationQuestion6_Asked").checked;
	    document.getElementById("QualificationQuestion7").value = document.getElementById("QualificationQuestion7_Asked").value;
	    document.getElementById("QualificationQuestion8").value = document.getElementById("QualificationQuestion8_Asked").value;
	    document.getElementById("QualificationQuestion9").value = document.getElementById("QualificationQuestion9_Asked").value;
	    document.getElementById("QualificationQuestion10").value = document.getElementById("QualificationQuestion10_Asked").value;
		    
	
	    if (document.getElementById("QualificationQuestion1").value.length == 0) {
	    	isLeadComplete = false;
	    	document.getElementById("QualificationQuestion1RF").style.visibility = "visible";
	    } else {
	    	document.getElementById("QualificationQuestion1RF").style.visibility = "hidden";
	    }
	    
	    if (document.getElementById("QualificationQuestion2").value.length == 0) {
	    	    	isLeadComplete = false;
	    	    	document.getElementById("QualificationQuestion2RF").style.visibility = "visible";
	    } else {
	    	document.getElementById("QualificationQuestion2RF").style.visibility = "hidden";
	    }
	    
	    if (document.getElementById("QualificationQuestion3").value.length == 0) {
	    	    	isLeadComplete = false;
	    	    	document.getElementById("QualificationQuestion3RF").style.visibility = "visible";
	    } else {
	    	document.getElementById("QualificationQuestion3RF").style.visibility = "hidden";
	    }
	    
	    if (document.getElementById("QualificationQuestion4").value.length == 0) {
	    	    	isLeadComplete = false;
	    	    	document.getElementById("QualificationQuestion4RF").style.visibility = "visible";
	    } else {
	    	document.getElementById("QualificationQuestion4RF").style.visibility = "hidden";
	    }
	    
	    if (document.getElementById("QualificationQuestion5").value.length == 0) {
	    	    	isLeadComplete = false;
	    	    	document.getElementById("QualificationQuestion5RF").style.visibility = "visible";
	    } else {
	    	document.getElementById("QualificationQuestion5RF").style.visibility = "hidden";
	    }
	    	    
	    if (document.getElementById("QualificationQuestion6").value == "false") {
	    	    	isLeadComplete = false;
	    	    	document.getElementById("QualificationQuestion6RF").style.visibility = "visible";
	    } else {
	    	document.getElementById("QualificationQuestion6RF").style.visibility = "hidden";
	    }
	    
	    if (document.getElementById("QualificationQuestion7").value.length == 0) {
	    	    	isLeadComplete = false;
	    	    	document.getElementById("QualificationQuestion7RF").style.visibility = "visible";
	    } else {
	    	document.getElementById("QualificationQuestion7RF").style.visibility = "hidden";
	    }
	    
	    if (document.getElementById("QualificationQuestion8").value.length == 0) {
	    	    	isLeadComplete = false;
	    	    	document.getElementById("QualificationQuestion8RF").style.visibility = "visible";
	    } else {
	    	document.getElementById("QualificationQuestion8RF").style.visibility = "hidden";
	    }
	    
	    if (document.getElementById("QualificationQuestion9").value.length == 0) {
	    	    	isLeadComplete = false;
	    	    	document.getElementById("QualificationQuestion9RF").style.visibility = "visible";
	    } else {
	    	document.getElementById("QualificationQuestion9RF").style.visibility = "hidden";
	    }
	    
	    if (document.getElementById("QualificationQuestion10").value.length == 0) {
	    	    	isLeadComplete = false;
	    	    	document.getElementById("QualificationQuestion10RF").style.visibility = "visible";
	    } else {
	    	document.getElementById("QualificationQuestion10RF").style.visibility = "hidden";
	    }
	    
	    if (
	        ((document.getElementById("PP_Country").textContent.trim() == "US") || (document.getElementById("PP_Country").textContent.trim() == "CA")) && 
	        (document.getElementById("State").value.length == 0) 
	        )
  		{
  		  isLeadComplete = false;
	    	  document.getElementById("StateRF").style.visibility = "visible";
  		} else {
	    	   document.getElementById("StateRF").style.visibility = "hidden";
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
     padding-left:10px;
     padding-top:10px;
     padding-bottom:4px;
     font-size:14px;
     color:#DDDDDD;
   }
   
   div.prepopvalue {
     float:left;
     padding-top:2px;
     padding-left:2px;
     padding-right:0px;
     padding-bottom:1px;
     width:300px;
     height:16px;
     border: 2px solid #c3e5f7;
     background-color: white;
     font-size:14px;
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
     	color:#DD2222;
   	visibility:hidden;
   }
   
      div.ErrorMessage {
        font-size:18px;
        color:#DD2222;
      	visibility:hidden;
      	padding-left:7px;
      	font-family: SalesforceSansRegular,Arial,sans-serif;
   }
      
  </style>

</head>

<body class="en US form-theme-1 rwd rwd profile-size-exists profile-size-ent profile-customer" onload="dispositionState()">
  
  <center>
  <table border="0" style="width:400px;padding-top:5px">
   <tr>
   <!--
   <td>
    <img src="https://secure2.sfdcstatic.com/common/assets/images/form/salesforce-logo-122x86.png" class="flex" alt="" />
    </td>
   -->
   <td>
        <img src="demandwarelogo.png" class="flex" alt=""/>
    </td>
    <tr>
    <td colspan="2">
    <center><h2 class="center-max-scr2" style="padding-top:10px;font-weight:bold;">lead pass
    
    
    </h2></center>
    </td>
    </tr>
    <tr>
    <td colspan="2">
	&nbsp;
	</td>
	</tr>
    
   </table> 
  </center>

  
<div id="pagewrap" class="touch-unhover"> 
  <div id="content-wrap">	
    <div class="content clearfix" style="">
      <div id="layout">
        <div class="grid-cell grid-40 cell-last width-100-max-scr2 backgrd-009ddc" style="width:1000px;border: 4px solid #c3e5f7;">
          <div class="cell-content bottom-30">
			
    <style>
        #header             {margin-bottom:0px;}
        .ie A.aloha-submit-mid-blue {background-color: #0582b7 !important;}
        .form-btn-caret         {padding-left: 10px; font-size: 16px;}
        #layout             {background-position: center top; background-repeat: repeat-y;}
        .endcap             {background-image: url("https://secure2.sfdcstatic.com/common/assets/images/salescloud/bg_bottom.png"); background-position: center top; background-repeat: repeat-y; height: 35px;}
    </style>
    
    <div id="form-container" class="clearfix wide-fields style-placeholder">  
        
<center>

<form id="leadpassvisible" name="leadpassvisible" method="" action="" class="form-builder-form" >            
  <table border="0" style="vertical-align:top;width:1000px;">
    <tr>

			<td>                                
				<div class="prepoplabel">
				    <label for="FirstName" style="font-size:16px;">First name</label>
				</div>
			</td>
			
			<td>
				<div class="prepopvalue" name="PP_FirstName" id="PP_FirstName">
				  <%=firstName%>
				</div>                            
                	</td>

			<td>                                
				<div class="prepoplabel">
				    <label for="Company" style="font-size:16px;">Company</label>
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
                        <div class="prepopvalue" name="PP_Street" id="PP_Street" >
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
				<div class="prepoplabel" style="visibility:hidden;" id="State_Label">
					<span class="requiredflag" id="StateRF">*</span>
					<label for="State">State/Province</label>
				</div>

			</td>
			<td>
				<div style="visibility:hidden;">
					    <select name="State_Asked" id="State_Asked" autocomplete="off" style="width:250px;">
					       <optgroup style="font-size: 9px;white-space:pre-wrap;">
						 <option value="" selected="selected"></option>
						 <option value="AL">Alabama</option>
						 <option value="AK">Alaska</option>
						 <option value="AZ">Arizona</option>
						 <option value="AR">Arkansas</option>
						 <option value="CA">California</option>
						 <option value="CO">Colorado</option>
						 <option value="CT">Connecticut</option>
						 <option value="DE">Delaware</option>
						 <option value="FL">Florida</option>
						 <option value="GA">Georgia</option>
						 <option value="HI">Hawaii</option>
						 <option value="ID">Idaho</option>
						 <option value="IL">Illinois</option>
						 <option value="IN">Indiana</option>
						 <option value="IA">Iowa</option>
						 <option value="KS">Kansas</option>
						 <option value="KY">Kentucky</option>
						 <option value="LA">Louisiana</option>
						 <option value="ME">Maine</option>
						 <option value="MD">Maryland</option>
						 <option value="MA">Massachusetts</option>
						 <option value="MI">Michigan</option>
						 <option value="MN">Minnesota</option>
						 <option value="MS">Mississippi</option>
						 <option value="MO">Missouri</option>
						 <option value="MT">Montana</option>
						 <option value="NE">Nebraska</option>
						 <option value="NV">Nevada</option>
						 <option value="NH">New Hampshire</option>
						 <option value="NJ">New Jersey</option>
						 <option value="NM">New Mexico</option>
						 <option value="NY">New York</option>
						 <option value="NC">North Carolina</option>
						 <option value="ND">North Dakota</option>
						 <option value="OH">Ohio</option>
						 <option value="OK">Oklahoma</option>
						 <option value="OR">Oregon</option>
						 <option value="PA">Pennsylvania</option>
						 <option value="RI">Rhode Island</option>
						 <option value="SC">South Carolina</option>
						 <option value="SD">South Dakota</option>
						 <option value="TN">Tennessee</option>
						 <option value="TX">Texas</option>
						 <option value="UT">Utah</option>
						 <option value="VT">Vermont</option>
						 <option value="VA">Virginia</option>
						 <option value="WA">Washington</option>
						 <option value="WV">West Virginia</option>
						 <option value="WI">Wisconsin</option>
						 <option value="WY">Wyoming</option>
						 <option value="DC">District of Columbia</option>
						 <option value="AB">Alberta</option>
						 <option value="BC">British Columbia</option>
						 <option value="MB">Manitoba</option>
						 <option value="NB">New Brunswick</option>
						 <option value="NL">Newfoundland and Labrador</option>
						 <option value="NS">Nova Scotia</option>
						 <option value="ON">Ontario</option>
						 <option value="PE">Prince Edward Island</option>
						 <option value="QC">Quebec</option>
						 <option value="SK">Saskatchewan</option>
						 <option value="NT">Northwest Territories</option>
						 <option value="NU">Nunavut</option>
						 <option value="YT">Yukon</option>
					       </optgroup>                              
					    </select>                                      
				</div>
				</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>	
		</tr>

	<tr>
	  <td colspan="4">
		<div id="InstructionA" class="font-white font-20" style="padding-top:20px;padding-right:10px;padding-left:10px;padding-bottom:5px;">
		</div>
	 </td>
	 </tr>
      

	<tr>
	<td colspan="4">

                        <div class="qualificationquestion">
                             <span class="requiredflag" id="QualificationQuestion1RF">*</span>
                             <label for="QualificationQuestion1">Industry</label>
                         </div>

                         <div class="field">
                            <select name="QualificationQuestion1_Asked" id="QualificationQuestion1_Asked" autocomplete="off" style="width:775px;">
                               <optgroup style="font-size: 9px;white-space:pre-wrap;">
                                 <option value="" selected="selected"></option>
                                 <option value="Retail">Retail</option>
                                 <option value="Consumer Packaged Goods (CPG)">Consumer Packaged Goods (CPG)</option>                                                     
                                 <option value="Other">Other</option>                                                        
                               </optgroup>                              
                            </select>                                      
                        </div>

                        <div class="qualificationquestion">
                             <span class="requiredflag" id="QualificationQuestion2RF">*</span>
                             <label for="QualificationQuestion2">How would you describe the core business and the products that they sell?</label>
                         </div>

                         <div class="field">
                            <select name="QualificationQuestion2_Asked" id="QualificationQuestion2_Asked" autocomplete="off" style="width:775px;">
                               <optgroup style="font-size: 9px;white-space:pre-wrap;">
                                 <option value="" selected="selected"></option>
                                 <option value="A retailer (i.e. Abercrombie, PacSun, Macys) conducting business on-line and via brick and mortar stores">A retailer (i.e. Abercrombie, PacSun, Macys) conducting business on-line and via brick and mortar stores</option>
                                 <option value="A branded manufacturer (i.e. Under Armor, Patagonia, Puma, Nike) selling their products through wholesale channel(s) and/or via a marketplace (i.e. Amazon, eBay) and online to consumers">A branded manufacturer (i.e. Under Armor, Patagonia, Puma, Nike) selling their products through wholesale channel(s) and/or via a marketplace (i.e. Amazon, eBay) and online to consumers</option>                                                     
                                 <option value="A direct marketer/cataloger (Harry & David, Oriental Trading Co.) or online pureplay (Wayfair.com, ModCloth, 1800Contact) selling directly to consumers in a core vertical - apparel, footwear, health & beauty, speciality, sporting goods">A direct marketer/cataloger (Harry & David, Oriental Trading Co.) or online pureplay (Wayfair.com, ModCloth, 1800Contact) selling directly to consumers in a core vertical - apparel, footwear, health & beauty, speciality, sporting goods</option>                                                        
                               </optgroup>                              
                            </select>                                      
                        </div>

                        <div class="qualificationquestion">
                             <span class="requiredflag" id="QualificationQuestion3RF">*</span>
                             <label for="QualificationQuestion3" class="qualificationquestion">What is the estimated annual sales revenue currently? Online revenue?</label>
                         </div>

                         <div class="field">
                            <select name="QualificationQuestion3_Asked" id="QualificationQuestion3_Asked" autocomplete="off" style="width:775px;">
                               <optgroup style="font-size: 9px;white-space:pre-wrap;">
                                 <option value="" selected="selected"></option>
                                 <option value="Annual revenue over $50M or online revenue over $5M">Annual revenue over $50M or online revenue over $5M</option>
                                 <option value="Annual revenue less than $50M and Online revenue less than $5M">Annual revenue less than $50M and Online revenue less than $5M</option>                                                     
                               </optgroup>                              
                            </select>                                      
                        </div>

                        <div class="qualificationquestion">
                             <span class="requiredflag" id="QualificationQuestion4RF">*</span>
                             <label for="QualificationQuestion4" class="qualificationquestion">What are the top ecommerce/digital commerce initiatives for the business during the coming year?</label>
                         </div>

                         <div class="field">
                            <select name="QualificationQuestion4_Asked" id="QualificationQuestion4_Asked" autocomplete="off" style="width:775px;">
                               <optgroup style="font-size: 9px;white-space:pre-wrap;">
                                 <option value="" selected="selected"></option>
                                 <option value="Need to create a seamless consumer experience across all channels – mobile, on-line, in-store (omni-channel)">Need to create a seamless consumer experience across all channels – mobile, on-line, in-store (omni-channel)</option>
                                 <option value="Personalization / Loyalty / Predictive Intelligence">Personalization / Loyalty / Predictive Intelligence</option>
				<option value="Growth in new geographic markets (international expansion)">Growth in new geographic markets (international expansion)</option>
				<option value="Update in-store Point-of-Sale (POS) system">Update in-store Point-of-Sale (POS) system</option>
                                 <option value="Other">Other</option>
                               </optgroup>                              
                            </select>                                      
                        </div>

                        <div class="qualificationquestion">
                             <span class="requiredflag" id="QualificationQuestion5RF">*</span>
                             <label for="QualificationQuestion5" class="qualificationquestion">Is there a defined project timeline?</label>
                         </div>

                         <div class="field">
                            <select name="QualificationQuestion5_Asked" id="QualificationQuestion5_Asked" autocomplete="off" style="width:775px;">
                               <optgroup style="font-size: 9px;white-space:pre-wrap;">
                                 <option value="" selected="selected"></option>
                                 <option value="Less than 6 months">Less than 6 months</option>
                                 <option value="">6-12 months</option>
                                 <option value="12-18 months">12-18 months</option>
                                 <option value="24 months">24 months</option>
                                 <option value="No defined timeline">No defined timeline</option>                                 
                               </optgroup>                              
                            </select>                                      
                        </div>

                        <div class="qualificationquestion" stlye="padding-bottom:0px;">
                             <BR>
                             <span class="requiredflag" id="QualificationQuestion6RF">*</span>
                             <span>Customer agrees to a call from Demandware?</span>
                             <div style="position:relative;left:200;top:-18;">
                               <input type="checkbox" name="QualificationQuestion6_Asked" id="QualificationQuestion6_Asked">
                             </div>                             
                         </div>

                        <div class="qualificationquestion">
                             <span class="requiredflag" id="QualificationQuestion7RF">*</span>
                             <label for="QualificationQuestion7" class="qualificationquestion">What are the top business/technical challenges you are looking to address with a new platform?</label>
                         </div>

                         <div class="field">
                            <select name="QualificationQuestion7_Asked" id="QualificationQuestion7_Asked" autocomplete="off" style="width:775px;">
                               <optgroup style="font-size: 9px;white-space:pre-wrap;">
                                 <option value="" selected="selected"></option>
                                 <option value="Current ecommerce platform not flexible and agile enough to achieve growth goals">Current ecommerce platform not flexible and agile enough to achieve growth goals</option>
				 <option value="Reliability/performance issues">Reliability/performance issues</option>
				 <option value="Takes too long to implement new capabilities/features/functions">Takes too long to implement new capabilities/features/functions</option>
				 <option value="Cannot scale to accommodate large increases in traffic during peak season/flash sales">Cannot scale to accommodate large increases in traffic during peak season/flash sales</option>
                               </optgroup>                              
                            </select>                                      
                        </div>

                        <div class="qualificationquestion">
                             <span class="requiredflag" id="QualificationQuestion8RF">*</span>
                             <label for="QualificationQuestion8" class="qualificationquestion">What is your current ecommerce platform?</label>
                         </div>

                         <div class="field">
                            <select name="QualificationQuestion8_Asked" id="QualificationQuestion8_Asked" autocomplete="off" style="width:775px;">
                               <optgroup style="font-size: 9px;white-space:pre-wrap;">
                                 <option value="" selected="selected"></option>
                                 <option value="In-House/Custom">In-House/Custom</option>
                                 <option value="Oracle/ATG">Oracle/ATG</option>
                                 <option value="IBM/Websphere">IBM/Websphere</option>
                                 <option value="SAP/Hybris">SAP/Hybris</option>
                                 <option value="Magento">Magento</option>
                                 <option value="Mozu">Mozu</option>
                                 <option value="Intershop">Intershop</option>
                                 <option value="OXID">OXID</option>
                                 <option value="Venda/Netsuite">Venda/Netsuite</option>
                                 <option value="BT Fresca">BT Fresca</option>
                                 <option value="Digital River">Digital River</option>
                                 <option value="Other">Other</option>                                 
                               </optgroup>                              
                            </select>                                      
                        </div>

                        <div class="qualificationquestion">
                             <span class="requiredflag" id="QualificationQuestion9RF">*</span>
                             <label for="QualificationQuestion9" class="qualificationquestion">What is the name of your Core/MC counterpart?</label>
                         </div>

                         <div class="field" style="padding-left:2px;">
                            <input type="text" name="QualificationQuestion9_Asked" id="QualificationQuestion9_Asked" style="width:350px;height:20px;">
                        </div>

                        <div class="qualificationquestion">
                             <span class="requiredflag" id="QualificationQuestion10RF">*</span>
                             <label for="QualificationQuestion10" class="qualificationquestion">What is the email address of your Core/MC counterpart?</label>
                         </div>

                         <div class="field" style="padding-left:2px;">
                            <input type="text" name="QualificationQuestion10_Asked" id="QualificationQuestion10_Asked" style="width:350px;height:20px;">
                        </div>


</form>

</td>
</tr>

  <tr>
    <td colspan="4">
	<form id="leadpass" name="leadpass" method="post" action="https://s2370.t.eloqua.com/e/f2">

		<!-- Lead Record -->
		<input  id="FirstName" name="FirstName" maxlength="40" type="hidden" />
		<input  id="LastName" name="LastName" maxlength="80" type="hidden" />
		<input  id="Title" name="Title" maxlength="128" type="hidden" />
		<input  id="Email" name="Email" maxlength="255" type="hidden" />
		<input  id="Company" name="Company" maxlength="80" type="hidden" />
		<input  id="Phone" name="Phone" maxlength="20" type="hidden" />
		<input  id="Country" name="Country" maxlength="2" type="hidden" />
		<input  id="Street" name="Street" maxlength="255" type="hidden" />

		<!-- Lead Pass Metadata --> 
		<input  id="LeadPasserEmail" name="LeadPasserEmail" maxlength="255" type="hidden" value="<%=leadPasserEmail%>"/>
		<input  id="LeadPasserId" name="LeadPasserId" maxlength="18" type="hidden" value="<%=leadPasserId%>"/>
		<input  id="LeadPasserName" name="LeadPasserName" maxlength="255" type="hidden" value="<%=leadPasserName%>"/>
		<input  id="LeadId" name="LeadId" maxlength="18" type="hidden" value="<%=leadId%>"/>
		<input  id="ContactId" name="ContactId" maxlength="18" type="hidden" value="<%=contactId%>"/>
		<input  id="AccountId" name="AccountId" maxlength="18" type="hidden" value="<%=accountId%>"/>
 

		<!-- Eloqua Config -->
		<input type="hidden" name="elqFormName" value="sfdcleadpass">
		<input type="hidden" name="elqSiteId" value="2370">
		<input type="hidden" name="elqCookieWrite" value="0">                              

		<!-- Questions -->
		<input type="hidden" name="QualificationQuestion1" id="QualificationQuestion1">
		<input type="hidden" name="QualificationQuestion2" id="QualificationQuestion2">
		<input type="hidden" name="QualificationQuestion3" id="QualificationQuestion3">
		<input type="hidden" name="QualificationQuestion4" id="QualificationQuestion4">
		<input type="hidden" name="QualificationQuestion5" id="QualificationQuestion5">
		<input type="hidden" name="QualificationQuestion6" id="QualificationQuestion6">
		<input type="hidden" name="QualificationQuestion7" id="QualificationQuestion7">
		<input type="hidden" name="QualificationQuestion8" id="QualificationQuestion8">
		<input type="hidden" name="QualificationQuestion9" id="QualificationQuestion9">
		<input type="hidden" name="QualificationQuestion10" id="QualificationQuestion10">
		
		<input  id="State" name="State" maxlength="80" type="hidden" />

		<table border="0" width="975px">
		  <tr>
		    <td width="500px">
			<div id="ErrorMessage" class="ErrorMessage">
			   Please fill out the highlighted fields above.
			</div>
		   </td>
		   <td width="100px">&nbsp;</td>
		   <td>
			    <div class="submit-container clearfix" style="position:relative;float:right">
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

</html>

<% } %>

