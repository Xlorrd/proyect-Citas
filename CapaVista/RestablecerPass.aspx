﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Formulario.Master" AutoEventWireup="true" CodeBehind="RestablecerPass.aspx.cs" Inherits="CapaVista.RestablecerPass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 224px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_login" runat="server">

    <center>
    <table class="alt">
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lbl_ing" runat="server" Text="Ingrese el usuario"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
               
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" CssClass="button alt" Height="35px" Width="92px" />
                <br />
               
            </td>
        </tr>
    </table>
        </center>

    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_contenido" runat="server">
</asp:Content>
