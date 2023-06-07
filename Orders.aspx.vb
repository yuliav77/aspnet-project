Public Class Orders
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub OneOrderDatasource_Updated(sender As Object, e As SqlDataSourceStatusEventArgs)
        OrdersListView.DataBind()
    End Sub

    Protected Sub AllOrdersDatasource_Selected(sender As Object, e As SqlDataSourceStatusEventArgs)
        AllOrdersCountLabel.Text = e.AffectedRows
    End Sub

    Protected Sub OneOrderDatasource_Deleted(sender As Object, e As SqlDataSourceStatusEventArgs)
        OrdersListView.DataBind()
    End Sub

    Protected Sub OneOrderDatasource_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs)
        OrdersListView.DataBind()
        OrdersListView.SelectedIndex = e.AffectedRows - 1
    End Sub

    Protected Sub FormView1_ItemUpdating(sender As Object, e As FormViewUpdateEventArgs)

    End Sub
End Class