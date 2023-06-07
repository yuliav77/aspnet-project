<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Simpact10._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">SIMPACT 10</h1>
            <p class="lead">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                Building great Web applications using HTML, CSS, JavaScript, ASP.NET, MS SQL Server.</p>
        </section>
        <hr />
        <div class="row">
            <section class="col-md-4" aria-labelledby="gettingStartedTitle">
                <h2 id="gettingStartedTitle">Customers</h2>
                <p>
                    <i>Take a look on our Customers, you have possibility to add new ones, delete and change information about existing customers.</i>
                </p>
                <p>
                    <a class="btn btn-default btn-primary" href="/Customers">Learn more about Customers &raquo;</a>
                </p>

            </section>
            <section class="col-md-4" aria-labelledby="librariesTitle">
                <h2 id="librariesTitle">Employees</h2>
                <p>
                   <i> Look into information about our Employees, you can add new ones, edit and delete existing ones. </i>
                </p>
                <p>
                    <a class="btn btn-default btn-primary" href="/Employees">Learn more about Employees &raquo;</a>
                </p>
                <p>
                    <a class="btn btn-default btn-primary" href="/Supervisors">Learn more about Supervisors &raquo;</a>
                </p>

            </section>
            <section class="col-md-4" aria-labelledby="hostingTitle">
                <h2 id="hostingTitle">Orders</h2>
                <p>
                   <i> You can go through the list of Orders, find and edit the details of each order</i>
                </p>
                <p>
                    <a class="btn btn-default btn-primary" href="/Orders">Learn more about Orders &raquo;</a>
                </p>
            </section>
        </div>
    </main>

</asp:Content>
