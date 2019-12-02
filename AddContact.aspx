<%@ Page Title="Добавить запись" Language="C#" MasterPageFile="~/SiteTemplate.Master" AutoEventWireup="true" CodeBehind="AddContact.aspx.cs" Inherits="NotebookASP.AddContact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 69px;
        }
        .auto-style3 {
            width: 110px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Имя</td>
            <td class="auto-style3">
                <asp:TextBox ID="NameTextBox" runat="server" MaxLength="50"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="NameValidator" runat="server" ErrorMessage="Это поле не может быть пустым" ControlToValidate="NameTextBox" ForeColor="Red" ValidationGroup="AddContact"></asp:RequiredFieldValidator>
            </td>            
        </tr>
        <tr>
            <td class="auto-style2">Телефон</td>
            <td class="auto-style3">
                <asp:TextBox ID="PhoneTextBox" runat="server" MaxLength="20"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="PhoneValidator" runat="server" ErrorMessage="Введите корректный номер телефона" ValidationExpression="^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$" ControlToValidate="PhoneTextBox" ForeColor="Red" ValidationGroup="AddContact"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Email</td>
            <td class="auto-style3">
                <asp:TextBox ID="EmailTextBox" runat="server" MaxLength="255"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ErrorMessage="Введите корректный Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="EmailTextBox" ForeColor="Red" ValidationGroup="AddContact"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="AddButton" runat="server" Text="Добавить"  ValidationGroup="AddContact" OnClick="AddButton_Click"/>
                <asp:Label ID="ErrorOutput" runat="server" EnableViewState="false"></asp:Label>
            </td>
        </tr>
    </table>
    
</asp:Content>
