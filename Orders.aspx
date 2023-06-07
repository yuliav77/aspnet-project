<%@ Page Title="Orders" MasterPageFile="~/Site.Master" Language="vb" AutoEventWireup="true" CodeBehind="Orders.aspx.vb" Inherits="Simpact10.Orders" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">

        function valOrderInfo() {
            var prefix = 'MainContent_FormView1_';
            var ddlEmployeeList = document.getElementById(prefix + "EmployeesDropDownList");
            var customersDropDownList = document.getElementById(prefix + "CustomersDropDownList");
            var txtOrderDate = document.getElementById(prefix + "txtOrderDate");
            var txtShipCity = document.getElementById(prefix + "txtShipCity");
            var txtShipCountry = document.getElementById(prefix + "txtShipCountry");

            if (customersDropDownList.options[customersDropDownList.selectedIndex].value == 0) { alert("Please select Customer name."); return false; }
            if (ddlEmployeeList.options[ddlEmployeeList.selectedIndex].value == 0) { alert("Please select Employee name."); return false; }
            if (txtOrderDate.value == "") { alert("Please enter Order Date"); return false; }
            if (txtOrderDate.value != "" && !isDate(document.getElementById(prefix + 'txtOrderDate'))) { alert("Invalid Order Date Format! \n\nEnter date in format [yyyy/mm/dd]"); return false; }
            if (txtShipCity.value == "") { alert("Please enter City order"); return false; }
            if (txtShipCountry.value == "") { alert("Please enter Country order"); return false; }
        }

        function isDate(input) {
            var vf1 = /^\d{2}\/\d{1}\/\d{1}$/
            var vf2 = /^\d{2}\/\d{1}\/\d{2}$/
            var vf3 = /^\d{2}\/\d{2}\/\d{1}$/
            var vf4 = /^\d{2}\/\d{2}\/\d{2}$/
            var vf5 = /^\d{4}\/\d{1}\/\d{1}$/
            var vf6 = /^\d{4}\/\d{1}\/\d{2}$/
            var vf7 = /^\d{4}\/\d{2}\/\d{1}$/
            var vf8 = /^\d{4}\/\d{2}\/\d{2}$/
            var returnval = false
            if (vf1.test(input.value) || vf2.test(input.value) || vf3.test(input.value) || vf4.test(input.value) || vf5.test(input.value)
                || vf6.test(input.value) || vf7.test(input.value) || vf8.test(input.value)) {
                var yearfield = input.value.split("/")[0]
                var monthfield = input.value.split("/")[1]
                var dayfield = input.value.split("/")[2]
                if (yearfield.length == 2) yearfield = "19" + yearfield
                var dayobj = new Date(yearfield, monthfield - 1, dayfield)
                if ((dayobj.getMonth() + 1 == monthfield) && (dayobj.getDate() == dayfield) && (dayobj.getFullYear() == yearfield))
                    returnval = true
            }
            if (returnval == false) input.select()
            return returnval
        }

        function deleteConfirmation() {
            return confirm('Are you sure?');
        }
    </script>

        <main aria-labelledby="title" class="orders-area">
            <h2>SIMPACT Orders</h2>
            <hr />
            <h4>Orders list:</h4>
            <asp:SqlDataSource OnSelected="AllOrdersDatasource_Selected" ID="AllOrdersDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:SimpactDBConnectionString %>" SelectCommand="SELECT Orders.OrderID, Orders.OrderDate, Orders.ShipCity, Orders.ShipCountry, Customers.CompanyName, Orders.Freight FROM Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID ORDER BY Orders.OrderID DESC"></asp:SqlDataSource>
        <asp:SqlDataSource OnUpdated="OneOrderDatasource_Updated" OnDeleted="OneOrderDatasource_Deleted" OnInserted="OneOrderDatasource_Inserted" ID="OneOrderDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:SimpactDBConnectionString %>" 
            SelectCommand="SELECT Orders.OrderID, Orders.CustomerID, Orders.EmployeeID, Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate, Orders.ShipVia, Orders.Freight, Orders.ShipName, Orders.ShipAddress, Orders.ShipCity, Orders.ShipRegion, Orders.ShipPostalCode, Orders.ShipCountry, Customers.CompanyName, Employees.LastName, Employees.FirstName, CONCAT_WS(' ', FirstName, LastName) Full_name FROM Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID WHERE (Orders.OrderID = @OrderID)" 
            DeleteCommand="DELETE FROM [Orders] WHERE [OrderID] = @OrderID" 
            InsertCommand="INSERT INTO [Orders] ([CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (@CustomerID, @EmployeeID, @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @Freight, @ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry)" UpdateCommand="UPDATE [Orders] SET [CustomerID] = @CustomerID, [EmployeeID] = @EmployeeID, [OrderDate] = @OrderDate, [RequiredDate] = @RequiredDate, [ShippedDate] = @ShippedDate, [ShipVia] = @ShipVia, [Freight] = @Freight, [ShipName] = @ShipName, [ShipAddress] = @ShipAddress, [ShipCity] = @ShipCity, [ShipRegion] = @ShipRegion, [ShipPostalCode] = @ShipPostalCode, [ShipCountry] = @ShipCountry WHERE [OrderID] = @OrderID">
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="EmployeeID" Type="Int32" />
                <asp:Parameter Name="OrderDate" Type="DateTime" />
                <asp:Parameter Name="RequiredDate" Type="DateTime" />
                <asp:Parameter Name="ShippedDate" Type="DateTime" />
                <asp:Parameter Name="ShipVia" Type="Int32" />
                <asp:Parameter Name="Freight" Type="Decimal" />
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipAddress" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipRegion" Type="String" />
                <asp:Parameter Name="ShipPostalCode" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="OrdersListView" Name="OrderID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="EmployeeID" Type="Int32" />
                <asp:Parameter Name="OrderDate" Type="DateTime" />
                <asp:Parameter Name="RequiredDate" Type="DateTime" />
                <asp:Parameter Name="ShippedDate" Type="DateTime" />
                <asp:Parameter Name="ShipVia" Type="Int32" />
                <asp:Parameter Name="Freight" Type="Decimal" />
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipAddress" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipRegion" Type="String" />
                <asp:Parameter Name="ShipPostalCode" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />
                <asp:Parameter Name="OrderID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="OrderDetailsDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:SimpactDBConnectionString %>" 
            SelectCommand="SELECT [Order Details].OrderID, [Order Details].ProductID, [Order Details].UnitPrice, [Order Details].Quantity, [Order Details].Discount, [Order Details].UnitPrice * [Order Details].Quantity AS Total, Products.ProductName FROM [Order Details] INNER JOIN Products ON [Order Details].ProductID = Products.ProductID WHERE ([Order Details].OrderID = @OrderID)" 
            DeleteCommand="DELETE FROM [Order Details] WHERE [OrderID] = @OrderID AND [ProductID] = @ProductID" 
            InsertCommand="INSERT INTO [Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (@OrderID, @ProductID, @UnitPrice, @Quantity, @Discount)" 
            UpdateCommand="UPDATE [Order Details] SET [ProductID] = @ProductID, [UnitPrice] = @UnitPrice, [Quantity] = @Quantity, [Discount] = @Discount WHERE [OrderID] = @OrderID AND [ProductID] = @ProductID">
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
                <asp:Parameter Name="ProductID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="OrdersListView" PropertyName="SelectedValue" Name="OrderID" Type="Int32" />
                <asp:Parameter Name="ProductID" Type="Int32" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="Quantity" Type="Int16" />
                <asp:Parameter Name="Discount" Type="Single" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="OrdersListView" Name="OrderID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="Quantity" Type="Int16" />
                <asp:Parameter Name="Discount" Type="Single" />
                <asp:Parameter Name="OrderID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="CustomersDropdownDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SimpactDBConnectionString %>" SelectCommand="SELECT '' as [CustomerID], '' as [CompanyName] UNION SELECT [CustomerID], [CompanyName] FROM [Customers]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="EmployeesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SimpactDBConnectionString %>" SelectCommand="SELECT '' as [LastName], '' as [FirstName], '' as [EmployeeID], '' as [Full_name] UNION SELECT [LastName], [FirstName], [EmployeeID], CONCAT_WS(' ', FirstName, LastName) Full_name FROM [Employees]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="ProductsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SimpactDBConnectionString %>" SelectCommand="SELECT '' as [ProductID], '' as [ProductName] UNION SELECT [ProductID], [ProductName] FROM [Products]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="ShippersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SimpactDBConnectionString %>" SelectCommand="SELECT [CompanyName], [ShipperID] FROM [Shippers]"></asp:SqlDataSource>
        <asp:ListView ID="OrdersListView" runat="server" SelectedIndex="0" DataKeyNames="OrderID" DataSourceID="AllOrdersDatasource">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:LinkButton ID="LinkButton2" runat="server"  Text='<%# Eval("OrderID") %>' CommandName="Select" />
                    </td>
                    <td>
                        <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ShipCityLabel" runat="server" Text='<%# Eval("ShipCity") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ShipCountryLabel" runat="server" Text='<%# Eval("ShipCountry") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Eval("CompanyName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FreightLabel" runat="server" Text='<%# Eval("Freight") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="OrderIDLabel1" runat="server" Text='<%# Eval("OrderID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OrderDateTextBox" runat="server" Text='<%# Bind("OrderDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ShipCityTextBox" runat="server" Text='<%# Bind("ShipCity") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ShipCountryTextBox" runat="server" Text='<%# Bind("ShipCountry") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CompanyNameTextBox" runat="server" Text='<%# Bind("CompanyName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="FreightTextBox" runat="server" Text='<%# Bind("Freight") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="OrderDateTextBox" runat="server" Text='<%# Bind("OrderDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ShipCityTextBox" runat="server" Text='<%# Bind("ShipCity") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ShipCountryTextBox" runat="server" Text='<%# Bind("ShipCountry") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CompanyNameTextBox" runat="server" Text='<%# Bind("CompanyName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="FreightTextBox" runat="server" Text='<%# Bind("Freight") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("OrderID") %>' CommandName="Select" />
                    </td>
                    <td>
                        <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ShipCityLabel" runat="server" Text='<%# Eval("ShipCity") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ShipCountryLabel" runat="server" Text='<%# Eval("ShipCountry") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Eval("CompanyName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FreightLabel" runat="server" Text='<%# Eval("Freight") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server">OrderID</th>
                                    <th runat="server">OrderDate</th>
                                    <th runat="server">ShipCity</th>
                                    <th runat="server">ShipCountry</th>
                                    <th runat="server">CompanyName</th>
                                    <th runat="server">Freight</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ShipCityLabel" runat="server" Text='<%# Eval("ShipCity") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ShipCountryLabel" runat="server" Text='<%# Eval("ShipCountry") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Eval("CompanyName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FreightLabel" runat="server" Text='<%# Eval("Freight") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
            <p>Total count of orders: <b><asp:Label ID="AllOrdersCountLabel" runat="server" Text=""></asp:Label></b></p>
            <p></p>
            <hr />
            <h4>Order information:</h4>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="OrderID" DataSourceID="OneOrderDatasource" CssClass="form-view-table mt-3" OnItemUpdating="FormView1_ItemUpdating">
                <EditItemTemplate>
                    <div class="form">
                        <div class="form-layout">
                             <div class="form-layout-column">
                                <div>
                                    <span class="form-field-label">OrderID:
                                    <asp:Label ID="OrderIDLabel1" runat="server" Text='<%# Eval("OrderID") %>' />
                                </div>
                                <div>
                                    <span class="form-field-label">CustomerID:</span>
                                    <asp:DropDownList ID="CustomersDropDownList" runat="server" SelectedValue='<%# Bind("CustomerID") %>' AutoPostBack="True" DataSourceID="CustomersDropdownDataSource1" DataTextField="CompanyName" DataValueField="CustomerID" CssClass="form-select"/>
                                </div>
                                <div>
                                    <span class="form-field-label">EmployeeID:</span>
                                    <asp:DropDownList ID="EmployeesDropDownList" runat="server" DataSourceID="EmployeesDataSource" DataTextField="Full_name" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' CssClass="form-select"></asp:DropDownList>
                                </div>
                                 <div>
                                    <span class="form-field-label">OrderDate:</span>
                                     <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="OrderDateTextBox" Format="yyyy/MM/dd" />
                                    <asp:TextBox ID="OrderDateTextBox" runat="server" Text='<%# Bind("OrderDate") %>' CssClass="form-control" />
                                </div>
                                <div>
                                    <span class="form-field-label">RequiredDate:</span>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="RequiredDateTextBox"  Format="yyyy/MM/dd" />
                                    <asp:TextBox ID="RequiredDateTextBox" runat="server" Text='<%# Bind("RequiredDate") %>'  CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-layout-column">
                                <div>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="ShippedDateTextBox"  Format="yyyy/MM/dd" />
                                    <span class="form-field-label">ShippedDate:</span>
                                    <asp:TextBox ID="ShippedDateTextBox" runat="server" Text='<%# Bind("ShippedDate") %>'  CssClass="form-control" />
                                </div>
                                <div>
                                <span class="form-field-label">ShipVia:</span>
                                <asp:DropDownList ID="ShippersDropDownList" runat="server" DataSourceID="ShippersDataSource" DataTextField="CompanyName" DataValueField="ShipperID" SelectedValue='<%# Eval("ShipVia") %>' AppendDataBoundItems="true" CssClass="form-select">
                                    <asp:ListItem Text="" Value="" />
                                </asp:DropDownList>
                                </div>
                                <div>
                                <span class="form-field-label">Freight:</span>
                                <asp:TextBox ID="FreightTextBox" runat="server" Text='<%# Bind("Freight") %>'  CssClass="form-control" />
                                </div>
                                <div>
                                <span class="form-field-label">ShipName:</span>
                                <asp:TextBox ID="ShipNameTextBox" runat="server" Text='<%# Bind("ShipName") %>'  CssClass="form-control" />
                                </div>
                                <div>
                                <span class="form-field-label">ShipAddress:</span>
                                <asp:TextBox ID="ShipAddressTextBox" runat="server" Text='<%# Bind("ShipAddress") %>'  CssClass="form-control" />
                                </div>
                             </div>
                             <div class="form-layout-column">
                                <div>
                                <span class="form-field-label">ShipCity:</span>
                                <asp:TextBox ID="ShipCityTextBox" runat="server" Text='<%# Bind("ShipCity") %>'  CssClass="form-control"/>
                                </div>
                                <div>
                                <span class="form-field-label">ShipRegion:</span>
                                <asp:TextBox ID="ShipRegionTextBox" runat="server" Text='<%# Bind("ShipRegion") %>'  CssClass="form-control"/>
                                </div>
                                 <div>
                                <span class="form-field-label">ShipPostalCode:</span>
                                <asp:TextBox ID="ShipPostalCodeTextBox" runat="server" Text='<%# Bind("ShipPostalCode") %>'  CssClass="form-control"/>
                                </div>
                                 <div>
                                <span class="form-field-label">ShipCountry:</span>
                                <asp:TextBox ID="ShipCountryTextBox" runat="server" Text='<%# Bind("ShipCountry") %>'  CssClass="form-control"/>
                                </div>
                              </div>                  
                        </div>
                            <hr />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update"  CssClass="btn btn-primary" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="form">
                        <div class="form-layout">
                            <div class="form-layout-column">
                                <div>
                                <span class="form-field-label">CustomerID:</span>
                                <asp:DropDownList ID="CustomersDropDownList" runat="server" AutoPostBack="True" DataSourceID="CustomersDropdownDataSource1" DataTextField="CompanyName" DataValueField="CustomerID"  SelectedValue='<%# Bind("CustomerID") %>' CssClass="form-select" />
                                <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                                  ControlToValidate="CustomersDropDownList"
                                  ErrorMessage="CustomerID is a required field."
                                  ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                </div>
                                <div>
                                <span class="form-field-label">EmployeeID:</span>
                                    <asp:DropDownList ID="EmployeesDropDownList" runat="server" AutoPostBack="True" DataSourceID="EmployeesDataSource" DataTextField="Full_name" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' CssClass="form-select" />
                                </div>
                                <div>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtOrderDate"  Format="yyyy/MM/dd"/>
                                    <span class="form-field-label">OrderDate:</span>
                                    <asp:TextBox ID="txtOrderDate" runat="server" Text='<%# Bind("OrderDate") %>' CssClass="form-control" />
                                    <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                                      ControlToValidate="txtOrderDate"
                                      ErrorMessage="OrderDate is a required field."
                                      ForeColor="Red">
                                    </asp:RequiredFieldValidator>                              
                                </div>
                                <div>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="RequiredDateTextBox"  Format="yyyy/MM/dd"/>
                                    <span class="form-field-label">RequiredDate:</span>
                                    <asp:TextBox ID="RequiredDateTextBox" runat="server" Text='<%# Bind("RequiredDate") %>'  CssClass="form-control" />
                                </div>
                                <div>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="ShippedDateTextBox"  Format="yyyy/MM/dd"/>
                                    <span class="form-field-label">ShippedDate:</span>
                                    <asp:TextBox ID="ShippedDateTextBox" runat="server" Text='<%# Bind("ShippedDate") %>'  CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-layout-column">
                                <div>
                                    <span class="form-field-label">ShipVia:</span>
                                    <asp:DropDownList ID="ShippersDropDownList2" runat="server" DataSourceID="ShippersDataSource" DataTextField="CompanyName" DataValueField="ShipperID" SelectedValue='<%# Bind("ShipVia") %>' AppendDataBoundItems="true" CssClass="form-select">
                                        <asp:ListItem Text="" Value="" />
                                    </asp:DropDownList>
                                </div>
                                <div>
                                <span class="form-field-label">Freight:</span>
                                <asp:TextBox ID="FreightTextBox" runat="server" Text='<%# Bind("Freight") %>'  CssClass="form-control" />
                                </div>
                                <div>
                                <span class="form-field-label">ShipName:</span>
                                <asp:TextBox ID="ShipNameTextBox" runat="server" Text='<%# Bind("ShipName") %>'  CssClass="form-control" />
                                </div>
                                <div>
                                <span class="form-field-label">ShipAddress:</span>
                                <asp:TextBox ID="ShipAddressTextBox" runat="server" Text='<%# Bind("ShipAddress") %>'  CssClass="form-control" />
                                </div>
                                <div>
                                <span class="form-field-label">ShipCity:</span>
                                <asp:TextBox ID="txtShipCity" runat="server" Text='<%# Bind("ShipCity") %>' CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-layout-column">
                                <div>
                                <span class="form-field-label">ShipRegion:</span>
                                <asp:TextBox ID="ShipRegionTextBox" runat="server" Text='<%# Bind("ShipRegion") %>'  CssClass="form-control" />
                                </div>
                                <div>
                                <span class="form-field-label">ShipPostalCode:</span>
                                <asp:TextBox ID="ShipPostalCodeTextBox" runat="server" Text='<%# Bind("ShipPostalCode") %>'  CssClass="form-control" />
                                </div>
                                <div>
                                <span class="form-field-label">ShipCountry:</span>
                                <asp:TextBox ID="txtShipCountry" runat="server" Text='<%# Bind("ShipCountry") %>'  CssClass="form-control" />
                                </div>
                            </div>
                        </div>
                            <hr />

                            <asp:LinkButton ID="InsertButton" runat="server" OnClientClick="return valOrderInfo()" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"  CssClass="btn btn-secondary" />
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="form form-item-template">
                        <div class="form-layout">
                            <div class="form-layout-column">
                                <div>
                                <span class="form-field-label">Order ID:</span>
                                <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                                </div>
                                <div>
                                <span class="form-field-label">Customer Name:</span>
                                <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Bind("CompanyName") %>' />
                                </div>
                                <div>
                                <span class="form-field-label">Employee Name:</span>
                                <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Bind("Full_name") %>' />
                                </div>
                                <div>
                                <span class="form-field-label">OrderDate:</span>
                                <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Bind("OrderDate") %>' />
                                </div>
                                <div>
                                <span class="form-field-label">RequiredDate:</span>
                                <asp:Label ID="RequiredDateLabel" runat="server" Text='<%# Bind("RequiredDate") %>' />
                                </div>
                            </div>
                             <div class="form-layout-column">
                                <div>
                                <span class="form-field-label">ShippedDate:</span>
                                <asp:Label ID="ShippedDateLabel" runat="server" Text='<%# Bind("ShippedDate") %>' />
                                </div>
                                 <div>
                                <span class="form-field-label">ShipVia:</span>
                                <asp:Label ID="ShipViaLabel" runat="server" Text='<%# Bind("ShipVia") %>' />
                                </div>
                                <div>
                                <span class="form-field-label">Freight:</span>
                                <asp:Label ID="FreightLabel" runat="server" Text='<%# Bind("Freight") %>' />
                                </div>
                                <div>
                                <span class="form-field-label">ShipName:</span>
                                <asp:Label ID="ShipNameLabel" runat="server" Text='<%# Bind("ShipName") %>' />
                                </div>
                                <div>
                                <span class="form-field-label">ShipAddress:</span>
                                <asp:Label ID="ShipAddressLabel" runat="server" Text='<%# Bind("ShipAddress") %>' />
                                </div>
                            </div>
                            <div class="form-layout-column">
                                <div>
                                <span class="form-field-label">ShipCity:</span>
                                <asp:Label ID="ShipCityLabel" runat="server" Text='<%# Bind("ShipCity") %>' />
                                </div>
                                <div>
                                <span class="form-field-label">ShipRegion:</span>
                                <asp:Label ID="ShipRegionLabel" runat="server" Text='<%# Bind("ShipRegion") %>' />
                                </div>
                                <div>
                                <span class="form-field-label">ShipPostalCode:</span>
                                <asp:Label ID="ShipPostalCodeLabel" runat="server" Text='<%# Bind("ShipPostalCode") %>' />
                                </div>
                                <div>
                                <span class="form-field-label">ShipCountry:</span>
                                <asp:Label ID="ShipCountryLabel" runat="server" Text='<%# Bind("ShipCountry") %>' />
                                </div>
                            </div>
                        </div>
                            <hr/>
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-primary" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" OnClientClick="return deleteConfirmation();" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-success" />
                    </div>
                </ItemTemplate>
        </asp:FormView>
            <hr />
            <h4>Order details:</h4>
        <br />
            <asp:ListView ID="OrderDetailsListView2" runat="server" DataKeyNames="OrderID,ProductID" DataSourceID="OrderDetailsDatasource" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FAFAD2;color: #284775;">
                        <td class="td_flex">
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete"  OnClientClick=" return deleteConfirmation();" CssClass="btn btn-danger"/>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit"  CssClass="btn btn-primary" />
                        </td>
                        <td>
                            <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                        </td>
                        <td>
                            <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DiscountLabel" runat="server" Text='<%# Eval("Discount") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #FFCC66;color: #000080;">
                        <td  class="td_flex">
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                        </td>
                        <td>
                            <asp:Label ID="ProductLabel" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="UnitPriceTextBox" runat="server" Text='<%# Bind("UnitPrice") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DiscountTextBox" runat="server" Text='<%# Bind("Discount") %>' />
                        </td>
                        <td>
                            
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="" class="tr_insert">
                        <td class="td_flex">
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-success" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-secondary" />
                        </td>
                        <td>
                            <asp:DropDownList ID="ProductsDropDownList" runat="server" AutoPostBack="True" DataSourceID="ProductsDataSource" DataTextField="ProductName" DataValueField="ProductID" SelectedValue='<%# Bind("ProductID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="UnitPriceTextBox" runat="server" Text='<%# Bind("UnitPrice") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DiscountTextBox" runat="server" Text='<%# Bind("Discount") %>' />
                        </td>
                        <td>
                            
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #FFFBD6;color: #333333;">
                        <td class="td_flex">
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" OnClientClick=" return deleteConfirmation();" CssClass="btn btn-danger" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit"  CssClass="btn btn-primary"/>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                        </td>
                        <td>
                            <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DiscountLabel" runat="server" Text='<%# Eval("Discount") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                        <th runat="server"></th>
                                        <th runat="server">ProductID</th>
                                        <th runat="server">UnitPrice</th>
                                        <th runat="server">Quantity</th>
                                        <th runat="server">Discount</th>
                                        <th runat="server">Total</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                        </td>
                        <td>
                            <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DiscountLabel" runat="server" Text='<%# Eval("Discount") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
    </asp:ListView>
        </main>
    </asp:Content>
