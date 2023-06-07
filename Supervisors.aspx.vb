Public Class Supervisors
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub MenteesDataSource_Selected(sender As Object, e As SqlDataSourceStatusEventArgs)
        TotalCountMenteesLabel.Text = e.AffectedRows
    End Sub
End Class