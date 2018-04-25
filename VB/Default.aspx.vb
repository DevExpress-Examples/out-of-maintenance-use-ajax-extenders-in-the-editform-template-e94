Imports DevExpress.Web
Imports System
Partial Public Class Grid_Editing_AjaxCalendarExtenderlInEditForm_AjaxCalendarExtenderlInEditForm
    Inherits System.Web.UI.Page

    Private invalidDate As Boolean
    Protected Sub grid_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
        e.Cancel = True ' Data modifications are not allowed in the online demo
    End Sub
    Protected Sub grid_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.Cancel = True ' Data modifications are not allowed in the online demo
    End Sub
    Protected Sub grid_RowValidating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataValidationEventArgs)
        If invalidDate Then
            Dim g As ASPxGridView = TryCast(sender, ASPxGridView)
            e.Errors.Add(g.DataColumns("BirthDate"), "Invalid date, please correct")
            e.RowError = "Invalid date, please correct"
        End If
    End Sub
    Protected Sub grid_ParseValue(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxParseValueEventArgs)
        If e.FieldName = "BirthDate" Then
            Dim result As Date = Nothing
            If Not Date.TryParse(TryCast(e.Value, String), result) Then
                invalidDate = True
                Dim g As ASPxGridView = TryCast(sender, ASPxGridView)
                e.Value = g.GetRowValues(g.EditingRowVisibleIndex, "BirthDate")

            End If

        End If
    End Sub
End Class
