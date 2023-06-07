<%@ Page Title="Supervisors"  MasterPageFile="~/Site.Master" Language="vb" AutoEventWireup="true" CodeBehind="Supervisors.aspx.vb" Inherits="Simpact10.Supervisors" %>

<asp:Content ID="SupervisorsBodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <main aria-labelledby="title" class="supervisors-area">
            <h2>SIMPACT Supervisors</h2>
            <hr />
            <h4>Supervisors list:</h4>
            <p></p>
            <asp:SqlDataSource ID="SupervisorsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SimpactDBConnectionString %>" SelectCommand="SELECT * FROM [Supervisors]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="MenteesDataSource" runat="server" OnSelected="MenteesDataSource_Selected" ConnectionString="<%$ ConnectionStrings:SimpactDBConnectionString %>" SelectCommand="SELECT EmployeeID, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension, ReportsTo FROM Employees WHERE (ReportsTo = @ReportsTo)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListView1" Name="ReportsTo" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
        </asp:SqlDataSource>
            <asp:ListView ID="ListView1" runat="server" SelectedIndex="0" DataKeyNames="EmployeeID" DataSourceID="SupervisorsDataSource">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFF8DC;">
                    <td>
                        <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Eval("EmployeeID") %>' CommandName="Select" />
                    </td>
                    <td>
                        <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleOfCourtesyLabel" runat="server" Text='<%# Eval("TitleOfCourtesy") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BirthDateLabel" runat="server" Text='<%# Eval("BirthDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HireDateLabel" runat="server" Text='<%# Eval("HireDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                    <td>
                        <asp:Label ID="RegionLabel" runat="server" Text='<%# Eval("Region") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Eval("PostalCode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HomePhoneLabel" runat="server" Text='<%# Eval("HomePhone") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ExtensionLabel" runat="server" Text='<%# Eval("Extension") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ReportsToLabel" runat="server" Text='<%# Eval("ReportsTo") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #FFF8DC; color: #000000;">
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("EmployeeID") %>' CommandName="Select" />
                    </td>
                    <td>
                        <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleOfCourtesyLabel" runat="server" Text='<%# Eval("TitleOfCourtesy") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BirthDateLabel" runat="server" Text='<%# Eval("BirthDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HireDateLabel" runat="server" Text='<%# Eval("HireDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                    <td>
                        <asp:Label ID="RegionLabel" runat="server" Text='<%# Eval("Region") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Eval("PostalCode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HomePhoneLabel" runat="server" Text='<%# Eval("HomePhone") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ExtensionLabel" runat="server" Text='<%# Eval("Extension") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ReportsToLabel" runat="server" Text='<%# Eval("ReportsTo") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                    <th runat="server">Employee ID</th>
                                    <th runat="server">Last Name</th>
                                    <th runat="server">Firs tName</th>
                                    <th runat="server">Title</th>
                                    <th runat="server">Title Of Courtesy</th>
                                    <th runat="server">Birth Date</th>
                                    <th runat="server">Hire Date</th>
                                    <th runat="server">Address</th>
                                    <th runat="server">City</th>
                                    <th runat="server">Region</th>
                                    <th runat="server">Postal Code</th>
                                    <th runat="server">Country</th>
                                    <th runat="server">Home Phone</th>
                                    <th runat="server">Extension</th>
                                    <th runat="server">Reports To</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #008A8C; font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TitleOfCourtesyLabel" runat="server" Text='<%# Eval("TitleOfCourtesy") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BirthDateLabel" runat="server" Text='<%# Eval("BirthDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HireDateLabel" runat="server" Text='<%# Eval("HireDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                    </td>
                    <td>
                        <asp:Label ID="RegionLabel" runat="server" Text='<%# Eval("Region") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Eval("PostalCode") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HomePhoneLabel" runat="server" Text='<%# Eval("HomePhone") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ExtensionLabel" runat="server" Text='<%# Eval("Extension") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ReportsToLabel" runat="server" Text='<%# Eval("ReportsTo") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
</asp:ListView>
            <p></p>
            <h4>
                Mentees of the chosen supervisor: <asp:Label ID="SupervisorNameLabel" runat="server" Text=""></asp:Label>
            </h4>
            <p>
                Total count is <b><asp:Label ID="TotalCountMenteesLabel" runat="server" Text=""></asp:Label></b>
            </p>

            <asp:ListView ID="ListView2" runat="server" DataKeyNames="EmployeeID" DataSourceID="MenteesDataSource">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFFFFF;color: #284775;">
                        <td>
                            <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TitleOfCourtesyLabel" runat="server" Text='<%# Eval("TitleOfCourtesy") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BirthDateLabel" runat="server" Text='<%# Eval("BirthDate") %>' />
                        </td>
                        <td>
                            <asp:Label ID="HireDateLabel" runat="server" Text='<%# Eval("HireDate") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                        </td>
                        <td>
                            <asp:Label ID="RegionLabel" runat="server" Text='<%# Eval("Region") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Eval("PostalCode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                        </td>
                        <td>
                            <asp:Label ID="HomePhoneLabel" runat="server" Text='<%# Eval("HomePhone") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExtensionLabel" runat="server" Text='<%# Eval("Extension") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ReportsToLabel" runat="server" Text='<%# Eval("ReportsTo") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #999999;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="EmployeeIDLabel1" runat="server" Text='<%# Eval("EmployeeID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TitleOfCourtesyTextBox" runat="server" Text='<%# Bind("TitleOfCourtesy") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="BirthDateTextBox" runat="server" Text='<%# Bind("BirthDate") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="HireDateTextBox" runat="server" Text='<%# Bind("HireDate") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="RegionTextBox" runat="server" Text='<%# Bind("Region") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PostalCodeTextBox" runat="server" Text='<%# Bind("PostalCode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="HomePhoneTextBox" runat="server" Text='<%# Bind("HomePhone") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ReportsToTextBox" runat="server" Text='<%# Bind("ReportsTo") %>' />
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
                            <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TitleOfCourtesyTextBox" runat="server" Text='<%# Bind("TitleOfCourtesy") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="BirthDateTextBox" runat="server" Text='<%# Bind("BirthDate") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="HireDateTextBox" runat="server" Text='<%# Bind("HireDate") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="RegionTextBox" runat="server" Text='<%# Bind("Region") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PostalCodeTextBox" runat="server" Text='<%# Bind("PostalCode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="HomePhoneTextBox" runat="server" Text='<%# Bind("HomePhone") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ReportsToTextBox" runat="server" Text='<%# Bind("ReportsTo") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #E0FFFF;color: #333333;">
                        <td>
                            <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TitleOfCourtesyLabel" runat="server" Text='<%# Eval("TitleOfCourtesy") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BirthDateLabel" runat="server" Text='<%# Eval("BirthDate") %>' />
                        </td>
                        <td>
                            <asp:Label ID="HireDateLabel" runat="server" Text='<%# Eval("HireDate") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                        </td>
                        <td>
                            <asp:Label ID="RegionLabel" runat="server" Text='<%# Eval("Region") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Eval("PostalCode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                        </td>
                        <td>
                            <asp:Label ID="HomePhoneLabel" runat="server" Text='<%# Eval("HomePhone") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExtensionLabel" runat="server" Text='<%# Eval("Extension") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ReportsToLabel" runat="server" Text='<%# Eval("ReportsTo") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                        <th runat="server">EmployeeID</th>
                                        <th runat="server">Last Name</th>
                                        <th runat="server">First Name</th>
                                        <th runat="server">Title</th>
                                        <th runat="server">Title Of Courtesy</th>
                                        <th runat="server">Birth Date</th>
                                        <th runat="server">Hire Date</th>
                                        <th runat="server">Address</th>
                                        <th runat="server">City</th>
                                        <th runat="server">Region</th>
                                        <th runat="server">Postal Code</th>
                                        <th runat="server">Country</th>
                                        <th runat="server">Home Phone</th>
                                        <th runat="server">Extension</th>
                                        <th runat="server">Reports To</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                        <td>
                            <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TitleOfCourtesyLabel" runat="server" Text='<%# Eval("TitleOfCourtesy") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BirthDateLabel" runat="server" Text='<%# Eval("BirthDate") %>' />
                        </td>
                        <td>
                            <asp:Label ID="HireDateLabel" runat="server" Text='<%# Eval("HireDate") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                        </td>
                        <td>
                            <asp:Label ID="RegionLabel" runat="server" Text='<%# Eval("Region") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Eval("PostalCode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                        </td>
                        <td>
                            <asp:Label ID="HomePhoneLabel" runat="server" Text='<%# Eval("HomePhone") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExtensionLabel" runat="server" Text='<%# Eval("Extension") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ReportsToLabel" runat="server" Text='<%# Eval("ReportsTo") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
        </asp:ListView>
        </main>
</asp:Content>