package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.NoSuchElementException;
import java.util.Scanner;

import javax.net.ssl.HttpsURLConnection;

import com.eclipsesource.json.JsonArray;
import com.eclipsesource.json.JsonObject;
import com.eclipsesource.json.JsonValue;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;


public class MarketoLeadUpsertManager {

	//marketo URL
	public final static String MARKETO_INSTANCE_URL = "https://591-KXC-791.mktorest.com";

	//functional paramters
	public final static String LOOKUP_FIELD = "email"; //defines the field to deduplicate off of
	public final static String ACTION = "createOrUpdate"; //createOnly, updateOnly, createOrUpdate, or createDuplicate
	public final static String ACQUISITION_PROGRAMID_FIELD_NAME = "acquisitionProgramId";
	public final static String ACQUISITION_PROGRAMID_FIELD_VALUE = "1168";
	public final static String LEAD_SOURCE_FIELD_NAME = "LeadSource";
	public final static String LEAD_SOURCE_FIELD_VALUE = "LeadPass";

	//Auth Paramters
	public final static String CLIENT_ID = System.getenv("BC_LEADDEDUP_CLIENT_ID");	//Obtain from your Custom Service in Admin>Launchpoint
	public final static String CLIENT_SECRET = System.getenv("BC_LEADDEDUP_CLIENT_SECRET");	//Obtain from your Custom Service in Admin>Launchpoint

	//HTTP RESPONSE CODE
	public final static int HTTP_RESPONSE_CODE_OK = 200;

    public static class LEAD_PASS_FORM_FIELD_NAMES {
		public final static String FIRSTNAME = "FirstName";
		public final static String LASTNAME = "LastName";
		public final static String TITLE = "Title";
		public final static String EMAIL = "Email";
		public final static String COMPANY = "Company";
		public final static String PHONE = "Phone";
		public final static String STATE = "State";
		public final static String COUNTRY = "Country";
		public final static String STREET = "Street";
		public final static String EMAILOPTOUT = "HasOptedOutOfEmail";
		public final static String SUBSECTOR = "SubSector";
		public final static String SUBSECTORLOCKED = "SubSectorLocked";
		public final static String INDUSTRY = "Industry";
		public final static String LEADPASSEREMAIL = "LeadPasserEmail";
		public final static String LEADPASSERID = "LeadPasserId";
		public final static String LEADPASSERNAME = "LeadPasserName";
		public final static String COUNTERPARTEMAIL = "CounterpartEmail";
		public final static String COUNTERPARTID = "CounterpartId";
		public final static String COUNTERPARTNAME = "CounterpartName";
		public final static String CONTACTID = "ContactId";
		public final static String ACCOUNTID = "AccountId";
		public final static String QUALIFICATIONQUESTION1 = "QualificationQuestion1";
		public final static String QUALIFICATIONQUESTION2 = "QualificationQuestion2";
		public final static String QUALIFICATIONQUESTION3 = "QualificationQuestion3";
		public final static String QUALIFICATIONQUESTION4 = "QualificationQuestion4";
		public final static String QUALIFICATIONQUESTION5 = "QualificationQuestion5";
		public final static String QUALIFICATIONQUESTION6 = "QualificationQuestion6";
		public final static String QUALIFICATIONQUESTION7 = "QualificationQuestion7";
		public final static String QUALIFICATIONQUESTION8 = "QualificationQuestion8";
		public final static String QUALIFICATIONQUESTION9 = "QualificationQuestion9";
		public final static String QUALIFICATIONQUESTION10 = "QualificationQuestion10";
		public final static String QUALIFICATIONQUESTION11 = "QualificationQuestion11";
		public final static String QUALIFICATIONQUESTION12 = "QualificationQuestion12";
		public final static String QUALIFICATIONQUESTION13 = "QualificationQuestion13";
		public final static String QUALIFICATIONQUESTION14 = "QualificationQuestion14";
		public final static String QUALIFICATIONQUESTION15 = "QualificationQuestion15";
	}

	public static class MARKETO_LEAD_FIELD_NAMES {
		public final static String FIRSTNAME = "firstName";
		public final static String LASTNAME = "lastName";
		public final static String TITLE = "title";
		public final static String EMAIL = "email";
		public final static String COMPANY = "company";
		public final static String PHONE = "phone";
		public final static String STATE = "state";
		public final static String COUNTRY = "country";
		public final static String STREET = "address";
		public final static String EMAILOPTOUT = "unsubscribed";
		public final static String SUBSECTOR = "SubSector__c";
		public final static String SUBSECTORLOCKED = "Locked_SubSector__c";
		public final static String INDUSTRY = "Industry";
		public final static String LEADPASSEREMAIL = "LeadPasserEmail__c";
		public final static String LEADPASSERID = "LeadPasserId__c";
		public final static String LEADPASSERNAME = "LeadPasserName__c";
		public final static String CONTACTID = "Org62ContactId__c";
		public final static String ACCOUNTID = "Org62AccountId__c";
		public final static String COUNTERPARTEMAIL = "CounterpartEmail__c";
		public final static String COUNTERPARTID = "CounterpartId__c";
		public final static String COUNTERPARTNAME = "CounterpartName__c";
		public final static String QUALIFICATIONQUESTION1 = "Champion__c";
		public final static String QUALIFICATIONQUESTION2 = "Champion_Role__c";
		public final static String QUALIFICATIONQUESTION3 = "Eco_Buyer__c";
		public final static String QUALIFICATIONQUESTION4 = "Existing_Project__c";
		public final static String QUALIFICATIONQUESTION5 = "Project_Description__c";
		public final static String QUALIFICATIONQUESTION6 = "Sales_Qual_1__c";
		public final static String QUALIFICATIONQUESTION7 = "Sales_Qual_2__c";
		public final static String QUALIFICATIONQUESTION8 = "Finance_Qual_1__c";
		public final static String QUALIFICATIONQUESTION9 = "Prod_Mgt_Qual_1__c";
		public final static String QUALIFICATIONQUESTION10 = "Marketing_Qual_1__c";
		public final static String QUALIFICATIONQUESTION11 = "Support_Qual_1__c";
		public final static String QUALIFICATIONQUESTION12 = "Other_Qual__c";
		public final static String QUALIFICATIONQUESTION13 = "SFDC_Expansion__c";
		public final static String QUALIFICATIONQUESTION14 = "SFDC_Oppty_Size__c";
		public final static String QUALIFICATIONQUESTION15 = "Customer_Dataset_Size__c";
	}

	//constructed URL paramters
	protected String m_marketoIdURL = null;
	protected String m_idEndPoint = null;
	protected String m_marketoEndpointWithToken = null;
	protected String m_token = null;

	//Lead state
	protected JsonObject m_lead = null;
	protected String m_newLeadId = null;

    public MarketoLeadUpsertManager() {
		m_marketoIdURL = MARKETO_INSTANCE_URL + "/identity";
		m_idEndPoint = m_marketoIdURL + "/oauth/token?grant_type=client_credentials&client_id=" + CLIENT_ID + "&client_secret=" + CLIENT_SECRET;

		m_lead = new JsonObject();

	}

    public String getMarketoEndPointWithToken() {
		return m_marketoEndpointWithToken;
	}

    public String createLead(HashMap<String, String> v) throws IOException {

			//add Lead Pass fields
			Iterator i = v.keySet().iterator();
			while(i.hasNext()) {
				String key = (String)i.next();
				String value = (String)v.get(key);
				m_lead.add(key, value);
			}

			//add required Marketo fields
			m_lead.add(ACQUISITION_PROGRAMID_FIELD_NAME, ACQUISITION_PROGRAMID_FIELD_VALUE);
			m_lead.add(LEAD_SOURCE_FIELD_NAME, LEAD_SOURCE_FIELD_VALUE);

			//log the Lead JSON
			return logLeadJSON(m_lead);
	}


	public static String logLeadJSON(JsonObject lead) {

			Iterator<JsonObject.Member> j = lead.iterator();
			List<String> names = new ArrayList<String>(lead.names());
			java.util.Collections.sort(names, String.CASE_INSENSITIVE_ORDER);

			StringBuffer sb = new StringBuffer();
			sb.append("<BR>2. Lead Payload Debug:<table class=\"debug\">");

			for (int i=0; i < names.size(); i++) {
				JsonValue value = lead.get(names.get(i));
				sb.append("<tr class=\"debug\"><td class=\"debug\">").append(names.get(i)).append("</td><td class=\"debug\">").append(value.toString()).append("</td></tr>");
			}
			sb.append("</table><BR><BR>");

			return sb.toString();
	}

	public String go() throws Exception {

		return postData(m_lead);
	}

	public String postData(JsonObject lead) throws Exception {

			String result = null;
			long newLeadId = -1;
			JsonObject requestBody = buildRequest(lead);

			URL url = new URL(m_marketoEndpointWithToken.toString());

			HttpsURLConnection urlConn = (HttpsURLConnection)url.openConnection();

			urlConn.setRequestMethod("POST");
			urlConn.setRequestProperty("Content-type", "application/json");
            urlConn.setRequestProperty("accept", "text/json");
            urlConn.setDoOutput(true);

			OutputStreamWriter wr = new OutputStreamWriter(urlConn.getOutputStream());
			wr.write(requestBody.toString());
			wr.flush();
			int responseCode = urlConn.getResponseCode();
			if (responseCode == HTTP_RESPONSE_CODE_OK){
				InputStream inStream = urlConn.getInputStream();
				result = "3. Marketo Lead Upsert Response: " + convertStreamToString(inStream);

			}else{
				result = "3. Marketo Lead Upsert Response Status Code: " + responseCode;
			}

			try {
					int indexOfIdToken = result.indexOf("\"id\"");
					int indexOfIdEnd = result.indexOf(",", indexOfIdToken);
					m_newLeadId = result.substring(indexOfIdToken + 5, indexOfIdEnd);
			} catch (Exception e) {
				System.out.println(e);
			}

		return result;
	}


	protected String getNewLeadId() { return m_newLeadId; }


	private JsonObject buildRequest(JsonObject lead) {

		JsonObject requestBody = new JsonObject();

		requestBody.add("action", ACTION);
		requestBody.add("lookupField", LOOKUP_FIELD);

		JsonArray input = new JsonArray();
		input.add(lead);
		requestBody.add("input", input);
		return requestBody;
	}

	public String establishToken() throws Exception {

			URL url = new URL(m_idEndPoint);
			HttpsURLConnection urlConn = (HttpsURLConnection) url.openConnection();
			urlConn.setRequestMethod("GET");
            urlConn.setRequestProperty("accept", "application/json");

            int responseCode = -1;
			responseCode = urlConn.getResponseCode();

			if (responseCode == HTTP_RESPONSE_CODE_OK) {
						InputStream inStream = urlConn.getInputStream();
						Reader reader = new InputStreamReader(inStream);
						JsonObject jsonObject = JsonObject.readFrom(reader);
						m_token = jsonObject.get("access_token").asString();
			} else {
					throw new Exception("Bad status (" + responseCode + ") in access token response: " + responseCode);
			}

			return "1. Marketo Token response code: " + responseCode + "<BR>";

	}

	public void establishEndPointURLWithToken() {
		m_marketoEndpointWithToken = MARKETO_INSTANCE_URL + "/rest/v1/leads.json?access_token=" + m_token;
	}

	private String convertStreamToString(InputStream inputStream)  throws Exception {
        return new Scanner(inputStream).useDelimiter("\\A").next();
    }


    public String describeLead() throws Exception {
	        	String data = null;

	        	String endpoint = MARKETO_INSTANCE_URL + "/rest/v1/leads/describe.json?access_token=" + m_token;
	            URL url = new URL(endpoint);
	            HttpsURLConnection urlConn = (HttpsURLConnection) url.openConnection();
	            urlConn.setRequestMethod("GET");
	            urlConn.setRequestProperty("accept", "text/json");
	            int responseCode = urlConn.getResponseCode();
	            if (responseCode == 200) {
	                InputStream inStream = urlConn.getInputStream();
	                data = convertStreamToString(inStream);
	            } else {
	                data = "Status:" + responseCode;
	            }

	        	return data;
    }

        public String updateProgramStatus() throws Exception {

					boolean validId = true;

		    		StringBuffer result = new StringBuffer();
		    		result.append("<BR><BR>4. Update program status: ");

					if ((m_newLeadId == null) || (m_newLeadId.length() == 0)) {
						validId = false;
					} else {
						try {
							Integer.parseInt(m_newLeadId);
						} catch(NumberFormatException e) {
							validId = false;
						}
					}

					if (!validId) {
						result.append("Lead Id data type not recognized; program status update aborted.");
						return result.toString();
					}

		        	String endpoint = MARKETO_INSTANCE_URL + "/rest/v1/leads/programs/" + ACQUISITION_PROGRAMID_FIELD_VALUE + "/status.json?access_token=" + m_token;

					JsonObject requestBody = new JsonObject();
					requestBody.add("status", "Filled-out Form");

					JsonObject newLead = new JsonObject();
					newLead.add("id", m_newLeadId);

					JsonArray input = new JsonArray();
					input.add(newLead);
					requestBody.add("input", input);

		            URL url = new URL(endpoint);
		            HttpsURLConnection urlConn = (HttpsURLConnection) url.openConnection();
					urlConn.setRequestMethod("POST");
					urlConn.setRequestProperty("Content-type", "application/json");
		            urlConn.setRequestProperty("accept", "text/json");
		            urlConn.setDoOutput(true);

					OutputStreamWriter wr = new OutputStreamWriter(urlConn.getOutputStream());
					wr.write(requestBody.toString());
					wr.flush();

  				    int responseCode = urlConn.getResponseCode();
				    if (responseCode == HTTP_RESPONSE_CODE_OK){
						InputStream inStream = urlConn.getInputStream();
						result.append(convertStreamToString(inStream));
					} else {
						result.append("Status Code: ").append(responseCode);
					}

		    		return result.toString();
    }


 }