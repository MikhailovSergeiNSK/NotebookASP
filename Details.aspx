<%@ Page Title="Просмотр записи" Language="C#" MasterPageFile="~/SiteTemplate.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="NotebookASP.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" OnItemCommand="detailsview1_ItemCommand" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="SqlDataSource1" DataKeyNames="Id" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="Name" HeaderText="Имя" SortExpression="Name" />
            <asp:BoundField DataField="Phone" HeaderText="Телефон" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />            
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />            
        </Fields>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [Name], [Phone], [Email], [Id] FROM [Contacts] WHERE ([Id] = @Id)" ConflictDetection="CompareAllValues" 
        DeleteCommand="DELETE FROM [Contacts] WHERE [Id] = @original_Id" 
        InsertCommand="INSERT INTO [Contacts] ([Name], [Phone], [Email]) VALUES (@Name, @Phone, @Email)" OldValuesParameterFormatString="original_{0}" 
        UpdateCommand="UPDATE Contacts SET Name=@Name, Phone=@Phone, Email=@Email  WHERE Id=@Id">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="Id" QueryStringField="Id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>
