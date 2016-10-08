package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;

@WebServlet(
        name = "LeadPassServlet",
        urlPatterns = {"/leadpass"}
    )

  public class LeadPassServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

		String result = manageLead(gatherPostedData(req));
		req.setAttribute("leadManagementResult", result);

		req.getRequestDispatcher("beyondcoreconfirmation.jsp").forward(req, resp);

	}

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

		ServletOutputStream out = resp.getOutputStream();

		out.write("no-op\n\n".getBytes());

		//out.write("hello jon\n\n".getBytes());
		//manageLead(gatherPostedData(req));
		//out.write("\n\n goodbye jon".getBytes());

		out.flush();
		out.close();
   }


  protected HashMap<String, String> gatherPostedData(HttpServletRequest req) {
	  HashMap<String, String> v = new HashMap<String, String>();
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.FIRSTNAME, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.FIRSTNAME));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.LASTNAME, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.LASTNAME));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.TITLE, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.TITLE));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.EMAIL, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.EMAIL));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.COMPANY, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.COMPANY));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.PHONE, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.PHONE));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.STATE, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.STATE));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.COUNTRY, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.COUNTRY));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.STREET, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.STREET));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.EMAILOPTOUT, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.EMAILOPTOUT));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.SUBSECTOR, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.SUBSECTOR));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.SUBSECTORLOCKED, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.SUBSECTORLOCKED));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.INDUSTRY, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.INDUSTRY));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.LEADPASSEREMAIL, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.LEADPASSEREMAIL));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.LEADPASSERID, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.LEADPASSERID));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.LEADPASSERNAME, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.LEADPASSERNAME));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.CONTACTID, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.CONTACTID));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.ACCOUNTID, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.ACCOUNTID));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.COUNTERPARTID, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.COUNTERPARTID));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.COUNTERPARTNAME, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.COUNTERPARTNAME));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.COUNTERPARTEMAIL, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.COUNTERPARTEMAIL));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.QUALIFICATIONQUESTION1, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.QUALIFICATIONQUESTION1));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.QUALIFICATIONQUESTION2, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.QUALIFICATIONQUESTION2));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.QUALIFICATIONQUESTION3, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.QUALIFICATIONQUESTION3));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.QUALIFICATIONQUESTION4, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.QUALIFICATIONQUESTION4));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.QUALIFICATIONQUESTION5, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.QUALIFICATIONQUESTION5));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.QUALIFICATIONQUESTION6, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.QUALIFICATIONQUESTION6));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.QUALIFICATIONQUESTION7, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.QUALIFICATIONQUESTION7));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.QUALIFICATIONQUESTION8, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.QUALIFICATIONQUESTION8));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.QUALIFICATIONQUESTION9, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.QUALIFICATIONQUESTION9));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.QUALIFICATIONQUESTION10, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.QUALIFICATIONQUESTION10));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.QUALIFICATIONQUESTION11, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.QUALIFICATIONQUESTION11));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.QUALIFICATIONQUESTION12, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.QUALIFICATIONQUESTION12));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.QUALIFICATIONQUESTION13, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.QUALIFICATIONQUESTION13));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.QUALIFICATIONQUESTION14, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.QUALIFICATIONQUESTION14));
	  v.put(MarketoLeadUpsertManager.MARKETO_LEAD_FIELD_NAMES.QUALIFICATIONQUESTION15, req.getParameter(MarketoLeadUpsertManager.LEAD_PASS_FORM_FIELD_NAMES.QUALIFICATIONQUESTION15));
	  return v;
  }


  protected String manageLead(HashMap v) throws IOException {

	  	MarketoLeadUpsertManager marketoLeadUpsertManager = new MarketoLeadUpsertManager();
	  	StringBuffer l = new StringBuffer();
		String result = null;

	  	try {

			//0. Get auth token
	  		result = marketoLeadUpsertManager.establishToken();
			l.append(result);

	  		marketoLeadUpsertManager.establishEndPointURLWithToken();

			//1. Create Lead
			result = marketoLeadUpsertManager.createLead(v);
			l.append(result);

			//2. Upsert Lead
			result = marketoLeadUpsertManager.go();
			l.append(result);

	  	} catch (Exception e) {
	  		l.append("CRITICAL ERROR: ").append(e.getMessage()).append("\n");
	  		stackTraceToString(e, l);
	  		l.append("\n");
	  	}

		try {

			//4. Update Lead w/ Program Status
			result = marketoLeadUpsertManager.updateProgramStatus();
			l.append(result);

		} catch (Exception e) {
			  		l.append("Program Status Error: ").append(e.getMessage()).append("\n");
			  		stackTraceToString(e, l);
			  		l.append("\n");
	  	}

		/*
		try {
	  				//X. Describe Lead
			  		result = marketoLeadUpsertManager.describeLead();
			  		l.append("<BR><BR>Marketo Lead Articulation:<BR>" + result);

		} catch (Exception e) {
			  		l.append("Lead Articualtion Error: ").append(e.getMessage()).append("\n");
			  		stackTraceToString(e, l);
			  		l.append("\n");
	  	}
		*/

	  	return l.toString();

  }

  protected void stackTraceToString(Throwable e, StringBuffer sb) {
      for (StackTraceElement element : e.getStackTrace()) {
          sb.append(element.toString());
          sb.append("\n");
      }
  }

}