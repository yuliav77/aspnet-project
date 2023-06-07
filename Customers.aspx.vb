Public Class About
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub SqlDataSource2_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs)
        DropDownList1.DataBind()
    End Sub
End Class