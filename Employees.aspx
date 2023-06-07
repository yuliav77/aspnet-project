<%@ Page Title="Employees" MasterPageFile="~/Site.Master" AutoEventWireup="true" Language="vb" CodeBehind="Employees.aspx.vb" Inherits="Simpact10.Employees" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <script>
            function deleteConfirmation() {
                return confirm('Are you sure?');
            }
        </script>

    <main aria-labelledby="title">
        <h2>SIMPACT Employees</h2>
        <hr />
        <asp:SqlDataSource ID="SqlDataSource_Employees" runat="server" ConnectionString="<%$ ConnectionStrings:SimpactDBConnectionString %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @EmployeeID" InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Extension], [Photo], [Notes], [ReportsTo], [PhotoPath]) VALUES (@LastName, @FirstName, @Title, @TitleOfCourtesy, @BirthDate, @HireDate, @Address, @City, @Region, @PostalCode, @Country, @HomePhone, @Extension, @Photo, @Notes, @ReportsTo, @PhotoPath)" SelectCommand="SELECT *, CONCAT_WS(' ', FirstName, LastName) Full_name FROM [Employees]" UpdateCommand="UPDATE [Employees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Title] = @Title, [TitleOfCourtesy] = @TitleOfCourtesy, [BirthDate] = @BirthDate, [HireDate] = @HireDate, [Address] = @Address, [City] = @City, [Region] = @Region, [PostalCode] = @PostalCode, [Country] = @Country, [HomePhone] = @HomePhone, [Extension] = @Extension, [Photo] = @Photo, [Notes] = @Notes, [ReportsTo] = @ReportsTo, [PhotoPath] = @PhotoPath WHERE [EmployeeID] = @EmployeeID">
            <DeleteParameters>
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="TitleOfCourtesy" Type="String" />
                <asp:Parameter Name="BirthDate" Type="DateTime" />
                <asp:Parameter Name="HireDate" Type="DateTime" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Region" Type="String" />
                <asp:Parameter Name="PostalCode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="HomePhone" Type="String" />
                <asp:Parameter Name="Extension" Type="String" />
                <asp:Parameter Name="Photo" Type="Object" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="ReportsTo" Type="Int32" />
                <asp:Parameter Name="PhotoPath" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="TitleOfCourtesy" Type="String" />
                <asp:Parameter Name="BirthDate" Type="DateTime" />
                <asp:Parameter Name="HireDate" Type="DateTime" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Region" Type="String" />
                <asp:Parameter Name="PostalCode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="HomePhone" Type="String" />
                <asp:Parameter Name="Extension" Type="String" />
                <asp:Parameter Name="Photo" Type="Object" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="ReportsTo" Type="Int32" />
                <asp:Parameter Name="PhotoPath" Type="String" />
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource_Employees" DataTextField="Full_name" DataValueField="EmployeeID" AutoPostBack="True" CssClass="form-select">
    </asp:DropDownList>
    </main>
    <asp:SqlDataSource ID="SqlDataSourceOneEmployee" runat="server" OnDeleted="SqlDataSourceOneEmployee_Deleted" OnInserted="SqlDataSourceOneEmployee_Inserted" ConnectionString="<%$ ConnectionStrings:SimpactDBConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Employees] WHERE ([EmployeeID] = @EmployeeID)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @original_EmployeeID AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([TitleOfCourtesy] = @original_TitleOfCourtesy) OR ([TitleOfCourtesy] IS NULL AND @original_TitleOfCourtesy IS NULL)) AND (([BirthDate] = @original_BirthDate) OR ([BirthDate] IS NULL AND @original_BirthDate IS NULL)) AND (([HireDate] = @original_HireDate) OR ([HireDate] IS NULL AND @original_HireDate IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([Region] = @original_Region) OR ([Region] IS NULL AND @original_Region IS NULL)) AND (([PostalCode] = @original_PostalCode) OR ([PostalCode] IS NULL AND @original_PostalCode IS NULL)) AND (([Country] = @original_Country) OR ([Country] IS NULL AND @original_Country IS NULL)) AND (([HomePhone] = @original_HomePhone) OR ([HomePhone] IS NULL AND @original_HomePhone IS NULL)) AND (([Extension] = @original_Extension) OR ([Extension] IS NULL AND @original_Extension IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL)) AND (([ReportsTo] = @original_ReportsTo) OR ([ReportsTo] IS NULL AND @original_ReportsTo IS NULL)) AND (([PhotoPath] = @original_PhotoPath) OR ([PhotoPath] IS NULL AND @original_PhotoPath IS NULL))" InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Extension], [Photo], [Notes], [ReportsTo], [PhotoPath]) VALUES (@LastName, @FirstName, @Title, @TitleOfCourtesy, @BirthDate, @HireDate, @Address, @City, @Region, @PostalCode, @Country, @HomePhone, @Extension, NULL, @Notes, @ReportsTo, @PhotoPath)" UpdateCommand="UPDATE [Employees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Title] = @Title, [TitleOfCourtesy] = @TitleOfCourtesy, [BirthDate] = @BirthDate, [HireDate] = @HireDate, [Address] = @Address, [City] = @City, [Region] = @Region, [PostalCode] = @PostalCode, [Country] = @Country, [HomePhone] = @HomePhone, [Extension] = @Extension, [Photo] = NULL, [Notes] = @Notes, [ReportsTo] = @ReportsTo, [PhotoPath] = @PhotoPath WHERE [EmployeeID] = @original_EmployeeID AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([TitleOfCourtesy] = @original_TitleOfCourtesy) OR ([TitleOfCourtesy] IS NULL AND @original_TitleOfCourtesy IS NULL)) AND (([BirthDate] = @original_BirthDate) OR ([BirthDate] IS NULL AND @original_BirthDate IS NULL)) AND (([HireDate] = @original_HireDate) OR ([HireDate] IS NULL AND @original_HireDate IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([Region] = @original_Region) OR ([Region] IS NULL AND @original_Region IS NULL)) AND (([PostalCode] = @original_PostalCode) OR ([PostalCode] IS NULL AND @original_PostalCode IS NULL)) AND (([Country] = @original_Country) OR ([Country] IS NULL AND @original_Country IS NULL)) AND (([HomePhone] = @original_HomePhone) OR ([HomePhone] IS NULL AND @original_HomePhone IS NULL)) AND (([Extension] = @original_Extension) OR ([Extension] IS NULL AND @original_Extension IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL)) AND (([ReportsTo] = @original_ReportsTo) OR ([ReportsTo] IS NULL AND @original_ReportsTo IS NULL)) AND (([PhotoPath] = @original_PhotoPath) OR ([PhotoPath] IS NULL AND @original_PhotoPath IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_EmployeeID" Type="Int32" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_TitleOfCourtesy" Type="String" />
            <asp:Parameter Name="original_BirthDate" Type="DateTime" />
            <asp:Parameter Name="original_HireDate" Type="DateTime" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_Region" Type="String" />
            <asp:Parameter Name="original_PostalCode" Type="String" />
            <asp:Parameter Name="original_Country" Type="String" />
            <asp:Parameter Name="original_HomePhone" Type="String" />
            <asp:Parameter Name="original_Extension" Type="String" />
            <asp:Parameter Name="original_Notes" Type="String" />
            <asp:Parameter Name="original_ReportsTo" Type="Int32" />
            <asp:Parameter Name="original_PhotoPath" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="TitleOfCourtesy" Type="String" />
            <asp:Parameter Name="BirthDate" Type="DateTime" />
            <asp:Parameter Name="HireDate" Type="DateTime" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Region" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="HomePhone" Type="String" />
            <asp:Parameter Name="Extension" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="ReportsTo" Type="Int32" />
            <asp:Parameter Name="PhotoPath" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="EmployeeID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="TitleOfCourtesy" Type="String" />
            <asp:Parameter Name="BirthDate" Type="DateTime" />
            <asp:Parameter Name="HireDate" Type="DateTime" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Region" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="HomePhone" Type="String" />
            <asp:Parameter Name="Extension" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="ReportsTo" Type="Int32" />
            <asp:Parameter Name="PhotoPath" Type="String" />
            <asp:Parameter Name="original_EmployeeID" Type="Int32" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_TitleOfCourtesy" Type="String" />
            <asp:Parameter Name="original_BirthDate" Type="DateTime" />
            <asp:Parameter Name="original_HireDate" Type="DateTime" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_Region" Type="String" />
            <asp:Parameter Name="original_PostalCode" Type="String" />
            <asp:Parameter Name="original_Country" Type="String" />
            <asp:Parameter Name="original_HomePhone" Type="String" />
            <asp:Parameter Name="original_Extension" Type="String" />
            <asp:Parameter Name="original_Notes" Type="String" />
            <asp:Parameter Name="original_ReportsTo" Type="Int32" />
            <asp:Parameter Name="original_PhotoPath" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceEmployeesWithReportsTo" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:SimpactDBConnectionString %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @original_EmployeeID AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([TitleOfCourtesy] = @original_TitleOfCourtesy) OR ([TitleOfCourtesy] IS NULL AND @original_TitleOfCourtesy IS NULL)) AND (([BirthDate] = @original_BirthDate) OR ([BirthDate] IS NULL AND @original_BirthDate IS NULL)) AND (([HireDate] = @original_HireDate) OR ([HireDate] IS NULL AND @original_HireDate IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([Region] = @original_Region) OR ([Region] IS NULL AND @original_Region IS NULL)) AND (([PostalCode] = @original_PostalCode) OR ([PostalCode] IS NULL AND @original_PostalCode IS NULL)) AND (([Country] = @original_Country) OR ([Country] IS NULL AND @original_Country IS NULL)) AND (([HomePhone] = @original_HomePhone) OR ([HomePhone] IS NULL AND @original_HomePhone IS NULL)) AND (([Extension] = @original_Extension) OR ([Extension] IS NULL AND @original_Extension IS NULL)) AND (([Photo] = @original_Photo) OR ([Photo] IS NULL AND @original_Photo IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL)) AND (([ReportsTo] = @original_ReportsTo) OR ([ReportsTo] IS NULL AND @original_ReportsTo IS NULL)) AND (([PhotoPath] = @original_PhotoPath) OR ([PhotoPath] IS NULL AND @original_PhotoPath IS NULL))" InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Extension], [Photo], [Notes], [ReportsTo], [PhotoPath]) VALUES (@LastName, @FirstName, @Title, @TitleOfCourtesy, @BirthDate, @HireDate, @Address, @City, @Region, @PostalCode, @Country, @HomePhone, @Extension, @Photo, @Notes, @ReportsTo, @PhotoPath)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Employees.EmployeeID, Employees.LastName, Employees.FirstName, Employees.Title, Employees.TitleOfCourtesy, Employees.BirthDate, Employees.HireDate, Employees.Address, Employees.City, Employees.Region, Employees.PostalCode, Employees.Country, Employees.HomePhone, Employees.Extension, Employees.Photo, Employees.Notes, Employees.ReportsTo, Employees.PhotoPath, Employees_1.LastName AS Expr1 FROM Employees LEFT OUTER JOIN Employees AS Employees_1 ON Employees.ReportsTo = Employees_1.EmployeeID WHERE (Employees.EmployeeID = @EmployeeID)" UpdateCommand="UPDATE [Employees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Title] = @Title, [TitleOfCourtesy] = @TitleOfCourtesy, [BirthDate] = @BirthDate, [HireDate] = @HireDate, [Address] = @Address, [City] = @City, [Region] = @Region, [PostalCode] = @PostalCode, [Country] = @Country, [HomePhone] = @HomePhone, [Extension] = @Extension, [Photo] = @Photo, [Notes] = @Notes, [ReportsTo] = @ReportsTo, [PhotoPath] = @PhotoPath WHERE [EmployeeID] = @original_EmployeeID AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([TitleOfCourtesy] = @original_TitleOfCourtesy) OR ([TitleOfCourtesy] IS NULL AND @original_TitleOfCourtesy IS NULL)) AND (([BirthDate] = @original_BirthDate) OR ([BirthDate] IS NULL AND @original_BirthDate IS NULL)) AND (([HireDate] = @original_HireDate) OR ([HireDate] IS NULL AND @original_HireDate IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([Region] = @original_Region) OR ([Region] IS NULL AND @original_Region IS NULL)) AND (([PostalCode] = @original_PostalCode) OR ([PostalCode] IS NULL AND @original_PostalCode IS NULL)) AND (([Country] = @original_Country) OR ([Country] IS NULL AND @original_Country IS NULL)) AND (([HomePhone] = @original_HomePhone) OR ([HomePhone] IS NULL AND @original_HomePhone IS NULL)) AND (([Extension] = @original_Extension) OR ([Extension] IS NULL AND @original_Extension IS NULL)) AND (([Photo] = @original_Photo) OR ([Photo] IS NULL AND @original_Photo IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL)) AND (([ReportsTo] = @original_ReportsTo) OR ([ReportsTo] IS NULL AND @original_ReportsTo IS NULL)) AND (([PhotoPath] = @original_PhotoPath) OR ([PhotoPath] IS NULL AND @original_PhotoPath IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_EmployeeID" Type="Int32" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_TitleOfCourtesy" Type="String" />
            <asp:Parameter Name="original_BirthDate" Type="DateTime" />
            <asp:Parameter Name="original_HireDate" Type="DateTime" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_Region" Type="String" />
            <asp:Parameter Name="original_PostalCode" Type="String" />
            <asp:Parameter Name="original_Country" Type="String" />
            <asp:Parameter Name="original_HomePhone" Type="String" />
            <asp:Parameter Name="original_Extension" Type="String" />
            <asp:Parameter Name="original_Photo" Type="Object" />
            <asp:Parameter Name="original_Notes" Type="String" />
            <asp:Parameter Name="original_ReportsTo" Type="Int32" />
            <asp:Parameter Name="original_PhotoPath" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="TitleOfCourtesy" Type="String" />
            <asp:Parameter Name="BirthDate" Type="DateTime" />
            <asp:Parameter Name="HireDate" Type="DateTime" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Region" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="HomePhone" Type="String" />
            <asp:Parameter Name="Extension" Type="String" />
            <asp:Parameter Name="Photo" Type="Object" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="ReportsTo" Type="Int32" />
            <asp:Parameter Name="PhotoPath" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="EmployeeID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="TitleOfCourtesy" Type="String" />
            <asp:Parameter Name="BirthDate" Type="DateTime" />
            <asp:Parameter Name="HireDate" Type="DateTime" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Region" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="HomePhone" Type="String" />
            <asp:Parameter Name="Extension" Type="String" />
            <asp:Parameter Name="Photo" Type="Object" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="ReportsTo" Type="Int32" />
            <asp:Parameter Name="PhotoPath" Type="String" />
            <asp:Parameter Name="original_EmployeeID" Type="Int32" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_Title" Type="String" />
            <asp:Parameter Name="original_TitleOfCourtesy" Type="String" />
            <asp:Parameter Name="original_BirthDate" Type="DateTime" />
            <asp:Parameter Name="original_HireDate" Type="DateTime" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_Region" Type="String" />
            <asp:Parameter Name="original_PostalCode" Type="String" />
            <asp:Parameter Name="original_Country" Type="String" />
            <asp:Parameter Name="original_HomePhone" Type="String" />
            <asp:Parameter Name="original_Extension" Type="String" />
            <asp:Parameter Name="original_Photo" Type="Object" />
            <asp:Parameter Name="original_Notes" Type="String" />
            <asp:Parameter Name="original_ReportsTo" Type="Int32" />
            <asp:Parameter Name="original_PhotoPath" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAllEmployeesForDropdown" runat="server" ConnectionString="<%$ ConnectionStrings:SimpactDBConnectionString %>" SelectCommand="SELECT [EmployeeID], CONCAT_WS(' ', [LastName], [FirstName]) Full_name 
FROM [Employees]"></asp:SqlDataSource>
    <asp:FormView ID="FormView2" runat="server" DataKeyNames="EmployeeID" DataSourceID="SqlDataSourceOneEmployee" CssClass="form-view-table mt-3" Width="100%">
        <EditItemTemplate>
           <div class="form">
               <div>
                            <span class="form-field-label">EmployeeID:</span>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("EmployeeID") %>' />
                </div>
               <div class="form-layout">
                    <div class="form-layout-column">
                        <div>
                            <span class="form-field-label">LastName:</span>
                            <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">FirstName:</span>
                            <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Title:</span>
                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">TitleOfCourtesy:</span>
                            <asp:TextBox ID="TitleOfCourtesyTextBox" runat="server" Text='<%# Bind("TitleOfCourtesy") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">BirthDate:</span>
                            <asp:TextBox ID="BirthDateTextBox" runat="server" Text='<%# Bind("BirthDate") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">HireDate:</span>
                            <asp:TextBox ID="HireDateTextBox" runat="server" Text='<%# Bind("HireDate") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Address:</span>
                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">City:</span>
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                        </div>
                   </div>
                   <div class="form-layout-column">
                        <div>
                            <span class="form-field-label">Region:</span>
                            <asp:TextBox ID="RegionTextBox" runat="server" Text='<%# Bind("Region") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">PostalCode:</span>
                            <asp:TextBox ID="PostalCodeTextBox" runat="server" Text='<%# Bind("PostalCode") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Country:</span>
                            <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">HomePhone:</span>
                            <asp:TextBox ID="HomePhoneTextBox" runat="server" Text='<%# Bind("HomePhone") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Extension:</span>
                            <asp:TextBox ID="ExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Photo:</span>
                            <asp:TextBox ID="PhotoTextBox" runat="server" Text='<%# Bind("Photo") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Notes:</span>
                            <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">ReportsTo:</span>
                            <asp:TextBox ID="ReportsToTextBox" runat="server" Text='<%# Bind("ReportsTo") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">PhotoPath:</span>
                            <asp:TextBox ID="PhotoPathTextBox" runat="server" Text='<%# Bind("PhotoPath") %>' />
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
                            <span class="form-field-label">LastName:</span>
                            <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">FirstName:</span>
                            <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Title:</span>
                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">TitleOfCourtesy:</span>
                            <asp:TextBox ID="TitleOfCourtesyTextBox" runat="server" Text='<%# Bind("TitleOfCourtesy") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">BirthDate:</span>
                            <asp:TextBox ID="BirthDateTextBox" runat="server" Text='<%# Bind("BirthDate") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">HireDate:</span>
                            <asp:TextBox ID="HireDateTextBox" runat="server" Text='<%# Bind("HireDate") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Address:</span>
                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">City:</span>
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                        </div>
                    </div>
                    <div class="form-layout-column">
                        <div>
                            <span class="form-field-label">Region:</span>
                            <asp:TextBox ID="RegionTextBox" runat="server" Text='<%# Bind("Region") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">PostalCode:</span>
                            <asp:TextBox ID="PostalCodeTextBox" runat="server" Text='<%# Bind("PostalCode") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Country:</span>
                            <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">HomePhone:</span>
                            <asp:TextBox ID="HomePhoneTextBox" runat="server" Text='<%# Bind("HomePhone") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Extension:</span>
                            <asp:TextBox ID="ExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Photo:</span>
                            <asp:TextBox ID="PhotoTextBox" runat="server" Text='<%# Bind("Photo") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Notes:</span>
                            <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">ReportsTo:</span>
                            <asp:TextBox ID="ReportsToTextBox" runat="server" Text='<%# Bind("ReportsTo") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">PhotoPath:</span>
                            <asp:TextBox ID="PhotoPathTextBox" runat="server" Text='<%# Bind("PhotoPath") %>' />
                        </div>
                    </div>
                   </div>
                   <hr />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert"  CssClass="btn btn-primary"/>
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"  CssClass="btn btn-secondary"/>
               </div>
           </InsertItemTemplate>
        <ItemTemplate>
           <div class="form form-item-template">
                <div>           
                    <span class="form-field-label">EmployeeID:</span>                   
                    <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>' />
                </div>
                <hr/>
                <div class="form-layout">
                    <div class="form-layout-column">
                        <div>
                            <span class="form-field-label">LastName:</span> 
                            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">FirstName:</span> 
                             <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Title</span> 
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">TitleOfCourtesy</span> 
                            <asp:Label ID="TitleOfCourtesyLabel" runat="server" Text='<%# Bind("TitleOfCourtesy") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">BirthDate:</span> 
                            <asp:Label ID="BirthDateLabel" runat="server" Text='<%# Bind("BirthDate") %>' />
                        </div>
                        <div>
                           <span class="form-field-label">HireDate:</span> 
                           <asp:Label ID="HireDateLabel" runat="server" Text='<%# Bind("HireDate") %>' />
                        </div>
                        <div>
                           <span class="form-field-label">Address:</span> 
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                        </div>
                        <div>
                           <span class="form-field-label">City:</span> 
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                        </div>
                        <div>
                           <span class="form-field-label">Region:</span> 
                           <asp:Label ID="RegionLabel" runat="server" Text='<%# Bind("Region") %>' />
                        </div>

                    </div>
                    <div class="form-layout-column">
                        <div>
                            <span class="form-field-label">PostalCode:</span>
                            <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Bind("PostalCode") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Country:</span>
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Bind("Country") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">HomePhone:</span>
                            <asp:Label ID="HomePhoneLabel" runat="server" Text='<%# Bind("HomePhone") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Extension:</span>
                            <asp:Label ID="ExtensionLabel" runat="server" Text='<%# Bind("Extension") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Photo:</span>
                            <asp:Label ID="PhotoLabel" runat="server" Text='<%# Bind("Photo") %>' />
                        </div>
                        <div>
                            <span class="form-field-label">Notes:</span>
                            <asp:Label ID="NotesLabel" runat="server" Text='<%# Bind("Notes") %>' />

                        </div>
                        <div>
                            <span class="form-field-label">ReportsTo:</span>
                            <asp:Label ID="ReportsToLabel" runat="server" Text='<%# Bind("ReportsTo") %>' />
                        </div>
                        <div>
                            <span class="form-field-label"> PhotoPath:</span>
                            <asp:Label ID="PhotoPathLabel" runat="server" Text='<%# Bind("PhotoPath") %>' />
                        </div>
                        <div>
                            <span class="form-field-label"></span>
                        </div>
                    </div>
                </div>
                <hr/>
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-primary" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"  CssClass="btn btn-danger" OnClientClick="return deleteConfirmation();" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New"  CssClass="btn btn-success"/>
                <hr/>
             </div> 

        </ItemTemplate>
    </asp:FormView>
    </asp:Content>
