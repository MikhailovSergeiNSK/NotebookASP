<%@ Page Title="Главная" Language="C#" MasterPageFile="~/SiteTemplate.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NotebookASP.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="DefaultRepeater" runat="server" DataSourceID="ContactsSqlDataSource">
        <HeaderTemplate>
            <H3>Список контактов</H3>
        </HeaderTemplate>
        <ItemTemplate>
            <a href="Details.aspx?Id=<%#Eval("Id")%>" style="color:black"><%#Eval("Name")%></a>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <div>
            <a href="Details.aspx?Id=<%#Eval("Id")%>" style="color:navy"><%#Eval("Name")%></a>
            </div>
        </AlternatingItemTemplate>
    </asp:Repeater>

<asp:SqlDataSource ID="ContactsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Contacts] ORDER BY [Name]"></asp:SqlDataSource>
</asp:Content>
