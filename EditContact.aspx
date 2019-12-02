<%@ Page Title="Редактирование записи" Language="C#" MasterPageFile="~/SiteTemplate.Master" AutoEventWireup="true" CodeBehind="EditContact.aspx.cs" Inherits="NotebookASP.EditContact" %>
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
                <asp:RequiredFieldValidator ID="NameValidator" runat="server" ControlToValidate="NameTextBox" ErrorMessage="Это поле не может быть пустым" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Телефон</td>
            <td class="auto-style3">
                <asp:TextBox ID="PhoneTextBox" runat="server" MaxLength="20"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="PhoneValidator" runat="server" ControlToValidate="PhoneTextBox" ErrorMessage="Введите корректный номер телефона" ValidationExpression="^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Email</td>
            <td class="auto-style3">
                <asp:TextBox ID="EmailTextBox" runat="server" MaxLength="255"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="Введите корректный Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="UpdateButton" runat="server" Text="Сохранить" OnClick="UpdateButton_Click" />
                <asp:Button ID="CancelButton" runat="server"  Text="Отмена " causesvalidation="false" OnClick="CancelButton_Click"/>
                <asp:Label ID="ErrorOutput" runat="server" EnableViewState="false"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>
