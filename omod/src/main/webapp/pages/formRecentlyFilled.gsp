<%
    ui.decorateWith("appui", "standardEmrPage")
    ui.includeJavascript("coreapps", "fragments/datamanagement/codeDiagnosisDialog.js")
    ui.includeJavascript("uicommons", "datatables/jquery.dataTables.min.js")

%>

<script type="text/javascript">
    var breadcrumbs = [
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        { label: "${ ui.escapeJs(ui.message("reportingui.reportsapp.home.title")) }", link: emr.pageLink("reportingui", "reportsapp/home") },
        { label: "${ ui.message("isanteplusreports.form_recently_filled") }", link: "${ ui.thisUrl() }" }
    ];
</script>


<div ng-app="formRecentlyFilled" ng-controller="FormRecentlyFilledPageController">

	 <div class="running-reports">
     
          <form id="nonCodedForm" method="post">
    <fieldset id="run-report">
        <legend>
            ${ ui.message("reportingui.runReport.run.legend") }
        </legend>

        <% for (int i=0; i<reportManager.parameters.size(); i++) {
            def parameter = reportManager.parameters.get(i); %>
            <p id="parameter${i}Section">
                <% if (parameter.name == "total") { %>
                ${ ui.includeFragment("uicommons", "field/text", [ "id": "totalField", "label": parameter.label, "formFieldName": "total", "defaultValue": "100" ]) }
                <% } %>
              <% } %>
        <p>
            <button id="submit" type="submit" class="disab">${ ui.message("reportingui.runButtonLabel") }</button>
        </p>
    </fieldset>

</form>
        
        <% if (total != null) { %>
    <h3>
        ${ ui.message("isanteplusreports.form_recently_filled", ui.format(total)) }
    </h3>
 <% if (formRecentlyFilled != null ) { %>
    <table id="non-coded-diagnoses" width="100%" border="1" cellspacing="0" cellpadding="2">
        <thead>
            
            	<tr>
            	
	                <th>${ ui.message("isanteplusreports.st_id") }</th>
	                <th>${ ui.message("isanteplusreports.user") }</th>
	                <th>${ ui.message("isanteplusreports.form") }</th>
	                <th>${ ui.message("isanteplusreports.date_created") }</th>
	                <th>${ ui.message("isanteplusreports.last_date_updated") }</th>
	                <th>${ ui.message("isanteplusreports.form") }</th>
                 
           		 </tr>
        </thead>
        <tbody>
        <% if (formRecentlyFilled == null ) { %>
            <tr>
                <td colspan="3">${ ui.message("isanteplusreports.no_result") }</td>
            </tr>
        <% } else formRecentlyFilled.each { %>
            <tr id="obs-id-${ it.getColumnValue("numero") }">
                <td>
                    ${ ui.format(it.getColumnValue("numero")) }
                </td>
                 <td>
                     ${ ui.format(it.getColumnValue("utilisateur")) }
                </td>
                 <td>
                     ${ ui.format(it.getColumnValue("fiche")) }
                   
                </td>
                <td>
                      ${ ui.format(it.getColumnValue("creation")) }
                    
                </td>
                <td>
                    ${ ui.format(it.getColumnValue("modification")) }
                </td>
                <td>
                    ${ ui.format(it.getColumnValue("fiches")) }
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
   <% } %>
<% } %>
           
   </div>
   
</div>