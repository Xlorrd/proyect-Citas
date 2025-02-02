﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDatos;
using CapaNegocio;

namespace CapaVista
{
    public partial class Sesion : System.Web.UI.Page
    {
        int contador = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["con"] = Session["ConAntiguo"];
        
        }



        public void Ingresar()
        {

          //  lblMensaje.Visible = false;
            if (string.IsNullOrEmpty(txt_usu.Text))
            {
                intento.Text = (contador + (Convert.ToInt32(Session["con"]))).ToString();
                Session["ConAntiguo"] = intento.Text.ToString();
                if (Convert.ToInt32(intento.Text) == 3)
                {
                    btn_iniciar.Enabled = false;
                    Session["con"] = null;
                    Session["ConAntiguo"] = null;
                }
               // lblMensaje.Visible = true;
              
                txt_usu.Attributes.Add("placeholder", "Escribe un usuario");
                // txt_usu.BorderColor=System.Drawing.Color.FromArgb(255,0,0) ;
               // txt_usu.BorderStyle = BorderStyle.Solid;
                return;
            }

            if (string.IsNullOrEmpty(txt_pas.Text))
            {
                intento.Text = (contador + (Convert.ToInt32(Session["con"]))).ToString();
                Session["ConAntiguo"] = intento.Text.ToString();
                if (Convert.ToInt32(intento.Text) == 3)
                {
                    btn_iniciar.Enabled = false;
                    Session["con"] = null;
                    Session["ConAntiguo"] = null;
                }

              //  lblMensaje.Visible = true;
                txt_pas.Attributes.Add("placeholder", "Ingrese  una clave");
                return;
            }

            bool existe = UsuarioLogica.Autentificar(txt_usu.Text, txt_pas.Text);
            {
                if (existe)
                {
                    Tbl_Usuario usuario = new Tbl_Usuario();
                    usuario = UsuarioLogica.Autentificarlogin(txt_usu.Text, txt_pas.Text);
                   
                    int tipousuario = usuario.Tusu_id;

                    if (tipousuario == 1)
                    {
                        Session["New"] = txt_usu.Text;
                        Response.Redirect("~/MenuAdministrador.aspx");

                    }
                    if (tipousuario == 2)
                    {
                        Session["New"] = txt_usu.Text;
                        Response.Redirect("~/Menuusuario.aspx");

                    }


                }
                else
                {
                  //  lblMensaje.Visible = true;
                    txt_pas.Attributes.Add("placeholder", "Contraseña o usuario incorrecto");
                    return;
                }
                

            }

           
        }

        protected void btn_iniciar_Click(object sender, EventArgs e)
        {
            Ingresar();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }


}