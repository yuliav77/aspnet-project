<%@ Page Title="Customers" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.vb" Inherits="Simpact10.About" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script>
        function deleteConfirmation() {
            return confirm('Are you sure?');
        }
    </script>

    <main aria-labelledby="title">
        <h2>SIMPACT Customers</h2>
        <hr />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SimpactDBConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CompanyName" DataValueField="CustomerID" CssClass="form-select">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" OnInserted="SqlDataSource2_Inserted" ConnectionString="<%$ ConnectionStrings:SimpactDBConnectionString %>" SelectCommand="SELECT * FROM [Customers] WHERE ([CustomerID] = @CustomerID)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID AND (([CompanyName] = @original_CompanyName) OR ([CompanyName] IS NULL AND @original_CompanyName IS NULL)) AND (([ContactName] = @original_ContactName) OR ([ContactName] IS NULL AND @original_ContactName IS NULL)) AND (([ContactTitle] = @original_ContactTitle) OR ([ContactTitle] IS NULL AND @original_ContactTitle IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([Region] = @original_Region) OR ([Region] IS NULL AND @original_Region IS NULL)) AND (([PostalCode] = @original_PostalCode) OR ([PostalCode] IS NULL AND @original_PostalCode IS NULL)) AND (([Country] = @original_Country) OR ([Country] IS NULL AND @original_Country IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Fax] = @original_Fax) OR ([Fax] IS NULL AND @original_Fax IS NULL))" InsertCommand="INSERT INTO [Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax]) VALUES (@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country, @Phone, @Fax)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Customers] SET [CompanyName] = @CompanyName, [ContactName] = @ContactName, [ContactTitle] = @ContactTitle, [Address] = @Address, [City] = @City, [Region] = @Region, [PostalCode] = @PostalCode, [Country] = @Country, [Phone] = @Phone, [Fax] = @Fax WHERE [CustomerID] = @original_CustomerID AND (([CompanyName] = @original_CompanyName) OR ([CompanyName] IS NULL AND @original_CompanyName IS NULL)) AND (([ContactName] = @original_ContactName) OR ([ContactName] IS NULL AND @original_ContactName IS NULL)) AND (([ContactTitle] = @original_ContactTitle) OR ([ContactTitle] IS NULL AND @original_ContactTitle IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([Region] = @original_Region) OR ([Region] IS NULL AND @original_Region IS NULL)) AND (([PostalCode] = @original_PostalCode) OR ([PostalCode] IS NULL AND @original_PostalCode IS NULL)) AND (([Country] = @original_Country) OR ([Country] IS NULL AND @original_Country IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Fax] = @original_Fax) OR ([Fax] IS NULL AND @original_Fax IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_CustomerID" Type="String" />
            <asp:Parameter Name="original_CompanyName" Type="String" />
            <asp:Parameter Name="original_ContactName" Type="String" />
            <asp:Parameter Name="original_ContactTitle" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_Region" Type="String" />
            <asp:Parameter Name="original_PostalCode" Type="String" />
            <asp:Parameter Name="original_Country" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
            <asp:Parameter Name="original_Fax" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="ContactName" Type="String" />
            <asp:Parameter Name="ContactTitle" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Region" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="CustomerID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="ContactName" Type="String" />
            <asp:Parameter Name="ContactTitle" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Region" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="original_CustomerID" Type="String" />
            <asp:Parameter Name="original_CompanyName" Type="String" />
            <asp:Parameter Name="original_ContactName" Type="String" />
            <asp:Parameter Name="original_ContactTitle" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_Region" Type="String" />
            <asp:Parameter Name="original_PostalCode" Type="String" />
            <asp:Parameter Name="original_Country" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
            <asp:Parameter Name="original_Fax" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="CustomerID" DataSourceID="SqlDataSource2" Width="100%" CssClass="form-view-table mt-3">
        <EditItemTemplate>
            <div class="form">
                <div>           
                    <span class="fw-bold">Customer ID:</span>
                    <asp:Label ID="CustomerIDLabel1" runat="server" Text='<%# Eval("CustomerID") %>' />
                </div>
                <hr/>
                <div class="form-layout">
                    <div class="form-layout-column">
                        <div>  
                            <span class="form-field-label">Company Name:</span>
                            <asp:TextBox ID="CompanyNameTextBox" runat="server" Text='<%# Bind("CompanyName") %>' CssClass="form-control" />
                        </div>
                         <div>             
                            <span class="form-field-label">Contact Name:</span>
                            <asp:TextBox ID="ContactNameTextBox" runat="server" Text='<%# Bind("ContactName") %>' CssClass="form-control" />
                        </div> 
                        <div>             
                            <span class="form-field-label">Contact Title:</span>
                            <asp:TextBox ID="ContactTitleTextBox" runat="server" Text='<%# Bind("ContactTitle") %>' CssClass="form-control" />
                        </div>  
                        <div>             
                            <span class="form-field-label">Address:</span>
                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' CssClass="form-control" />
                        </div> 
                        <div>             
                            <span class="form-field-label">City:</span>
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-layout-column">
                        <div>             
                            <span class="form-field-label">Region:</span>
                            <asp:TextBox ID="RegionTextBox" runat="server" Text='<%# Bind("Region") %>' CssClass="form-control" />
                        </div> 
                        <div> 
                            <span class="form-field-label">Postal Code:</span>
                            <asp:TextBox ID="PostalCodeTextBox" runat="server" Text='<%# Bind("PostalCode") %>' CssClass="form-control" />
                        </div>             
                        <div> 
                            <span class="form-field-label">Country:</span>
                            <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' CssClass="form-control" />
                        </div> 
                         <div> 
                            <span class="form-field-label">Phone:</span>
                            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' CssClass="form-control" />
                        </div> 
                        <div> 
                            <span class="form-field-label">Fax:</span>
                            <asp:TextBox ID="FaxTextBox" runat="server" Text='<%# Bind("Fax") %>' CssClass="form-control" />
                        </div> 
                    </div>
                </div>
                <hr/>
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update"   CssClass="btn btn-primary" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"   CssClass="btn btn-secondary" />
            </div>
        </EditItemTemplate>
        <InsertItemTemplate>
            <div class="form">
                <div>           
                    <span class="form-field-label">Customer ID:</span>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CustomerID") %>'  CssClass="form-control"/>
                </div>
                <hr/>
                <div class="form-layout">
                    <div class="form-layout-column">
                        <div>  
                            <span class="form-field-label">Company Name:</span>
                            <asp:TextBox ID="CompanyNameTextBox" runat="server" Text='<%# Bind("CompanyName") %>' CssClass="form-control" />
                        </div>
                         <div>             
                            <span class="form-field-label">Contact Name:</span>
                            <asp:TextBox ID="ContactNameTextBox" runat="server" Text='<%# Bind("ContactName") %>' CssClass="form-control" />
                        </div> 
                        <div>             
                            <span class="form-field-label">Contact Title:</span>
                            <asp:TextBox ID="ContactTitleTextBox" runat="server" Text='<%# Bind("ContactTitle") %>' CssClass="form-control" />
                        </div>  
                        <div>             
                            <span class="form-field-label">Address:</span>
                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>'  CssClass="form-control"/>
                        </div> 
                        <div>             
                            <span class="form-field-label">City:</span>
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>'  CssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-layout-column">
                        <div>             
                            <span class="form-field-label">Region:</span>
                            <asp:TextBox ID="RegionTextBox" runat="server" Text='<%# Bind("Region") %>'  CssClass="form-control"/>
                        </div> 
                        <div> 
                            <span class="form-field-label">Postal Code:</span>
                            <asp:TextBox ID="PostalCodeTextBox" runat="server" Text='<%# Bind("PostalCode") %>'  CssClass="form-control"/>
                        </div>             
                        <div> 
                            <span class="form-field-label">Country:</span>
                            <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>'  CssClass="form-control"/>
                        </div> 
                         <div> 
                            <span class="form-field-label">Phone:</span>
                            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>'  CssClass="form-control"/>
                        </div> 
                        <div> 
                            <span class="form-field-label">Fax:</span>
                            <asp:TextBox ID="FaxTextBox" runat="server" Text='<%# Bind("Fax") %>'  CssClass="form-control"/>
                        </div> 
                    </div>
                </div>
                 <hr/>
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"  CssClass="btn btn-secondary" />
            </div>
        </InsertItemTemplate>
        <ItemTemplate>
            <div class="form form-item-template">
                <div>           
                    <span class="form-field-label">Customer ID:</span>                   
                    <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("CustomerID") %>' />
                </div>
                <hr/>
                <div class="form-layout">
                    <div class="form-layout-column">
                        <div>
                            <span class="form-field-label">Company Name:</span>  
                            <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Bind("CompanyName") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Contact Name:</span>  
                            <asp:Label ID="ContactNameLabel" runat="server" Text='<%# Bind("ContactName") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Contact Title:</span>  
                            <asp:Label ID="ContactTitleLabel" runat="server" Text='<%# Bind("ContactTitle") %>' />
                        </div>
                         <div>
                            <span class="form-field-label">Address:</span>  
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                        </div>
                         <div>
                            <span class="form-field-label">City:</span>  
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                        </div>
                    </div>
                     <div class="form-layout-column">
                         <div>
                            <span class="form-field-label">Region:</span>
                            <asp:Label ID="RegionLabel" runat="server" Text='<%# Bind("Region") %>' />
                         </div>
                         <div>
                            <span class="form-field-label">PostalCode:</span>
                            <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Bind("PostalCode") %>' />
                         </div>
                         <div>
                            <span class="form-field-label">Country:</span>
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Bind("Country") %>' />
                         </div>
                         <div>
                            <span class="form-field-label">Phone:</span>
                            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
                         </div>
                         <div>
                            <span class="form-field-label">Fax:</span>
                            <asp:Label ID="FaxLabel" runat="server" Text='<%# Bind("Fax") %>' />
                         </div>
                     </div>
                </div>
                <hr/>
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-primary" />  
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"  CssClass="btn btn-danger" OnClientClick="return deleteConfirmation();" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New"  CssClass="btn btn-success" />
             </div> 
        </ItemTemplate>
    </asp:FormView>


    </main>
</asp:Content>
