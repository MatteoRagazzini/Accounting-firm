using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace DBproject
{
    public partial class Form1 : Form
    {
        DBDataClassesDataContext db = new DBDataClassesDataContext();
        String codDipendente;
        public Form1()
        {
           
            InitializeComponent();
        }
        private void StartComponentsOff()
        {
            accessoDipPanel.Visible = false;
            dipQueryPanel.Visible = false;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            StartComponentsOff();
            FillCombo();
        }

        private void LogInButtonOff()
        {
            dipButton.Visible = false;
            titolareButton.Visible = false;
            sceltaAccLabel.Visible = false;
        }

        private void DipButton_Click(object sender, EventArgs e)
        {
            LogInButtonOff();
            accessoDipPanel.Visible = true;
            accessoDipPanel.BringToFront();
        }
        private void AllOffDip()
        {
            dataGridViewDIP.Visible = false;
            insCliPanel.Visible = false;
            insImprPanel.Visible = false;
        }
        private void AccessoButton_Click(object sender, EventArgs e)
        {
            codDipendente = textBox1.Text;
            accessoDipPanel.Visible = false;
            dipQueryPanel.Visible = true;
            dipQueryPanel.BringToFront();
            label1.Text = "Dipendente" + codDipendente;
            insCliPanel.Visible = false;
            insImprPanel.Visible = false;
            dataGridViewDIP.Visible = false;
        }
        private int IdCliente()
        {
            var query = ((from cs in db.CLIENTIs
                         orderby cs.cod_cliente descending
                         select new {cs.cod_cliente}).Take(1));
            
            return query.First().cod_cliente;
        }
        private void InsClienteBt_Click(object sender, EventArgs e)
        {
            AllOffDip();
            insCliPanel.Visible = true;
            insCliPanel.BringToFront();
            codCliente.Text = (IdCliente()+1).ToString();
        }

        private void SalvaBt_Click(object sender, EventArgs e)
        {
            CLIENTI cl = new CLIENTI
            {
                cod_cliente = IdCliente() + 1,
                nome = nome.Text,
                cognome = cognome.Text,
                cod_fiscale = codFiscale.Text,
                data_nascita = dataNascita.Value.Date,
                luogo_nascita = luogoNascita.Text,
                nazionalita = nazionalita.Text,
                domicilio_fiscale = domFiscale.Text,
                numero_telefono = long.Parse(numTel.Text)
            };
            db.CLIENTIs.InsertOnSubmit(cl);
            db.SubmitChanges();
            insCliPanel.Visible = false;
            dataGridViewDIP.DataSource = db.CLIENTIs;
            dataGridViewDIP.Visible = true; 


        }
        private String IdImpr()
        {
            var query = ((from i in db.IMPRESEs
                          orderby i.cod_identificativo descending
                          select new { i.cod_identificativo }).Take(1));

            return query.First().cod_identificativo;
        }
        private void FillCombo()
        {
            var regimi = from r in db.REGIME_CONTABILEs
                      select r;
            foreach (var rg in regimi)
            {
                RegCont.Items.Add(rg.cod_tipologia_regime_contabile + " " + rg.descizione);
            }

        }

        private void InsImprBt_Click(object sender, EventArgs e)
        {
            AllOffDip();
            insImprPanel.Visible = true;
            insImprPanel.BringToFront();
            codId.Text = (int.Parse(IdImpr())+1).ToString();
            

        }

        private void SalvaBt2_Click(object sender, EventArgs e)
        {
            
            IMPRESE i = new IMPRESE { cod_identificativo = codId.Text,
                codice_fiscale_impresa = codFiscaleImpr.Text,
                cod_attivita = codAttivita.Text,
                data_inizio_attivita = dateInizioAttività.Value.Date,
                domicilio_fiscale = domFiscaleImpr.Text,
                metodo_conteggio = metodContIva.Text,
                nazionalita = nazionalitaImpr.Text,
                metodo_gestione_fatturazione = metodoGestione.Text,
                periodicità_iva = periodIva.Text,
                cod_tipologia_regime_contabile = RegCont.SelectedItem.ToString()[0].ToString(),
                sede = sede.Text,
                sigla = sigla.Text,
                regime_contabile = RegCont.SelectedItem.ToString()[0].ToString()
            };
            db.IMPRESEs.InsertOnSubmit(i);
            db.SubmitChanges();
            insImprPanel.Visible = false;
            dataGridViewDIP.DataSource = db.IMPRESEs;
            dataGridViewDIP.Visible = true;



        }

        private void cercaImprBt_Click(object sender, EventArgs e)
        {
            AllOffDip();
            var query = from i in db.IMPRESE_SEGUITEs
                        from imp in db.IMPRESEs
                        where i.cod_dipendente == codDipendente
                        where imp.codice_fiscale_impresa == i.codice_fiscale_impresa
                        where imp.sigla.StartsWith(cercaTextBox.Text)
                        select imp;
            dataGridViewDIP.Visible = true;
            dataGridViewDIP.BringToFront();
            dataGridViewDIP.DataSource = query;

        }

        private void cercaCliBt_Click(object sender, EventArgs e)
        {
            AllOffDip();
            var query = from c in db.CLIENTI_SEGUITIs
                        from cliente in db.CLIENTIs
                        where c.cod_dipendente == codDipendente
                        where cliente.cod_cliente == c.cod_cliente
                        where cliente.cognome.StartsWith(cercaTextBox.Text)
                        select cliente;
            dataGridViewDIP.Visible = true;
            dataGridViewDIP.BringToFront();
            dataGridViewDIP.DataSource = query;
        }
    }
}
