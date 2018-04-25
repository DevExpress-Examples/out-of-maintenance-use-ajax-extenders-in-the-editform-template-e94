using DevExpress.Web;
using System;
public partial class Grid_Editing_AjaxCalendarExtenderlInEditForm_AjaxCalendarExtenderlInEditForm : System.Web.UI.Page {
	bool invalidDate;
    protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
        e.Cancel = true; // Data modifications are not allowed in the online demo
    }
    protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e) {
        e.Cancel = true; // Data modifications are not allowed in the online demo
    }
	protected void grid_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e) {
		if (invalidDate){
			ASPxGridView g = sender as ASPxGridView;
			e.Errors.Add(g.DataColumns["BirthDate"], "Invalid date, please correct");
			e.RowError = "Invalid date, please correct";
		}
	}
	protected void grid_ParseValue(object sender, DevExpress.Web.Data.ASPxParseValueEventArgs e) {
		if (e.FieldName == "BirthDate") {
			DateTime result;
			if (!DateTime.TryParse(e.Value as string, out result)) {
				invalidDate = true;
				ASPxGridView g = sender as ASPxGridView;
				e.Value = g.GetRowValues(g.EditingRowVisibleIndex, "BirthDate");
				
			}

		}
	}
}
