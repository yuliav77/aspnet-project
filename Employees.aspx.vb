Public Class Employees
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub SqlDataSourceOneEmployee_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs)
        DropDownList1.DataBind()
    End Sub

    Protected Sub SqlDataSourceOneEmployee_Deleted(sender As Object, e As SqlDataSourceStatusEventArgs)
        DropDownList1.DataBind()
    End Sub
End Class