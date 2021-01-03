using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace studioCommerciale
{
    public partial class StudioCommercialeManagement : Form
    {
        StudioCommercialeDataClassesDataContext db = new StudioCommercialeDataClassesDataContext();
        String codDipendente;
        public StudioCommercialeManagement()
        {

            InitializeComponent();
        }
        private void StartComponentsOff()
        {
            accessoDipPanel.Visible = false;
            dipQueryPanel.Visible = false;
            titolareQueryPanel.Visible = false;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            StartComponentsOff();
            AllOffDip();
            FillCombo();
            AllOffTit();
            initPanel.Visible = true;
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
            PropPanel.Visible = false;
            vsPropSociPanel.Visible = false;
            vsSocietaPanel.Visible = false;
            fatturazionePanel.Visible = false;
            bilancioPanel.Visible = false;
        }
        private void AllOffTit()
        {
            societaPanel.Visible = false;
            dipQueryTitPanel.Visible = false;
            cercaDelegheBt.Visible = false;
            delegheTextBox.Visible = false;
        }
        private String IdDipendente()
        {
            var query = ((from d in db.DIPENDENTI_STUDIO
                          orderby d.cod_dipendente descending
                          select new { d.cod_dipendente}).Take(1));

            return query.First().cod_dipendente;
        }
        private void AccessoButton_Click(object sender, EventArgs e)
        {
            codDipendente = textBox1.Text;
            if (int.Parse(codDipendente) <= 0 || int.Parse(codDipendente) > int.Parse(IdDipendente()))
            {
                MessageBox.Show("codice dipendente inesistente", "", MessageBoxButtons.OK);
                return;
            }
            accessoDipPanel.Visible = false;
            dipQueryPanel.Visible = true;
            dipQueryPanel.BringToFront();
            label1.Text = "Dipendente" + codDipendente;
            AllOffDip();
        }
        private int IdCliente()
        {
            var query = ((from cs in db.CLIENTI
                          orderby cs.cod_cliente descending
                          select new { cs.cod_cliente }).Take(1));

            return query.First().cod_cliente;
        }
        private void InsClienteBt_Click(object sender, EventArgs e)
        {
            AllOffDip();
            insCliPanel.Visible = true;
            insCliPanel.BringToFront();
            codCliente.Text = (IdCliente() + 1).ToString();
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
            db.CLIENTI.InsertOnSubmit(cl);
            db.SubmitChanges();
            insCliPanel.Visible = false;
            dataGridViewDIP.DataSource = db.CLIENTI;
            dataGridViewDIP.Visible = true;


        }
        private String IdImpr()
        {
            var query = ((from i in db.IMPRESE
                          orderby i.cod_identificativo descending
                          select new { i.cod_identificativo }).Take(1));

            return query.First().cod_identificativo.ToString();
        }
        private void FillCombo()
        {
            var regimi = from r in db.REGIMI_CONTABILE
                         select r;
            foreach (var rg in regimi)
            {
                RegCont.Items.Add(rg.cod_tipologia + " " + rg.descizione);
            }

        }

        private void InsImprBt_Click(object sender, EventArgs e)
        {
            AllOffDip();
            insImprPanel.Visible = true;
            insImprPanel.BringToFront();
            codId.Text = (int.Parse(IdImpr()) + 1).ToString();


        }

        private void SalvaBt2_Click(object sender, EventArgs e)
        {

            IMPRESE i = new IMPRESE
            {
                cod_identificativo = int.Parse(codId.Text),
                codice_fiscale_impresa = codFiscaleImpr.Text,
                cod_attivita = codAttivita.Text,
                data_inizio_attività= dateInizioAttività.Value.Date,
                domicilio_fiscale = domFiscaleImpr.Text,
                metodo_conteggio = metodContIva.Text,
                nazionalita = nazionalitaImpr.Text,
                metodo_gestione_fatturazione = metodoGestione.Text,
                periodicita_iva = periodIva.Text,
                cod_tipologia = RegCont.SelectedItem.ToString()[0],
                sede = sede.Text,
                sigla = sigla.Text,
            };
            db.IMPRESE.InsertOnSubmit(i);
            db.SubmitChanges();
            insImprPanel.Visible = false;
            dataGridViewDIP.DataSource = db.IMPRESE;
            dataGridViewDIP.Visible = true;



        }

        private void CercaImprBt_Click(object sender, EventArgs e)
        {
            AllOffDip();
            var query = from i in db.IMPRESE_SEGUITE
                        from imp in db.IMPRESE
                        where i.cod_dipendente == codDipendente
                        where imp.codice_fiscale_impresa == i.codice_fiscale_impresa
                        where imp.sigla.StartsWith(cercaTextBox.Text)
                        select imp;
            dataGridViewDIP.Visible = true;
            dataGridViewDIP.BringToFront();
            dataGridViewDIP.DataSource = query;

        }

        private void CercaCliBt_Click(object sender, EventArgs e)
        {
            AllOffDip();
            var query = from c in db.CLIENTI_SEGUITI
                        from cliente in db.CLIENTI
                        where c.cod_dipendente == codDipendente
                        where cliente.cod_cliente == c.cod_cliente
                        where cliente.cognome.StartsWith(cercaTextBox.Text)
                        select cliente;
            dataGridViewDIP.Visible = true;
            dataGridViewDIP.BringToFront();
            dataGridViewDIP.DataSource = query;
        }

        private void VsPropQuery()
        {
            var queryF = from p in db.PROPRIETA
                         from f in db.FABBRICATI
                         from c in db.CLIENTI
                         from tf in db.TIPI_FABBRICATI
                         where c.cod_cliente == int.Parse(codClienteProp.Text)
                         where p.cod_cliente == int.Parse(codClienteProp.Text)
                         where f.cod_propieta == p.cod_propieta
                         where f.cod_tipologia_fabbricato == tf.cod_tipologia_fabbricato
                         select new { c.nome, c.cognome, p.cod_propieta, tf.tipologia_fabbricato, p.foglio, p.sezione, p.subalterno,
                             p.particella, f.rendita_catastale, f.rendita_rivalutata, };
            dataGridViewFabb.DataSource = queryF;

            var queryT = from p in db.PROPRIETA
                         from t in db.TERRENI
                         from c in db.CLIENTI
                         from tt in db.TIPI_TERRENI
                         where c.cod_cliente == int.Parse(codClienteProp.Text)
                         where p.cod_cliente == int.Parse(codClienteProp.Text)
                         where t.cod_propieta == p.cod_propieta
                         where t.cod_tipologia_terreno == tt.cod_tipologia_terreno
                         select new
                         {
                             c.nome,
                             c.cognome,
                             p.cod_propieta,
                             tt.tipologia_terreno,
                             p.foglio,
                             p.sezione,
                             p.subalterno,
                             p.particella,
                             t.rendita_agraria_catastale,
                             t.rendita_agraria_rivalutata,
                             t.rendita_dominicale_catastale,
                             t.rendita_dominicale_rivalutata
                         };
            dataGridViewTerr.DataSource = queryT;
        }


        private void VsPropBt_Click(object sender, EventArgs e)
        {
            AllOffDip();
            PropPanel.Visible = true;
            PropPanel.BringToFront();
        }

        private void CercaProp_Click(object sender, EventArgs e)
        {
            VsPropQuery();
        }

        private void VsPropSociQuery()
        {
            var query = from ass in db.ASSOCIAZIONE_SOCI
                        from c in db.CLIENTI
                        where String.Compare(ass.codice_fiscale_impresa, codSocieta.Text) == 0
                        where c.cod_cliente == ass.cod_cliente
                        select new { c.nome, c.cognome, QtaProprieta=c.PROPRIETA.Count };
            dataGridViewPropSoci.DataSource = query;

  
        }

        private void PropSociBt_Click(object sender, EventArgs e)
        {
            AllOffDip();
            vsPropSociPanel.Visible = true;
            vsPropSociPanel.BringToFront();
        }

        private void CercaPropSociBt_Click(object sender, EventArgs e)
        {
            VsPropSociQuery();
        }

        private void EsciBt_Click(object sender, EventArgs e)
        {
            AllOffDip();
            dipQueryPanel.Visible = true;
            dipQueryPanel.BringToFront();
        }

       
        private void CercaSocietaBt_Click(object sender, EventArgs e)
        {
            var query = from i in db.IMPRESE
                        from s in db.SOCIETA
                        from rg in db.REGIMI_CONTABILE
                        from b in db.BILANCI
                        where i.cod_identificativo == int.Parse(codIdImpresa.Text)
                        where i.codice_fiscale_impresa.Equals(s.codice_fiscale_impresa)
                        where i.cod_tipologia == rg.cod_tipologia
                        where i.codice_fiscale_impresa.Equals(b.codice_fiscale_impresa)
                        select new { i.sigla,
                                    i.sede,
                                    s.numero_reg_imprese,
                                    NumeroSoci = s.ASSOCIAZIONE_SOCI.Count,
                                    NumeroUnitaLocali = i.UNITA_LOCALI.Count,
                                    s.descrizione_tipologia,
                                    b.data_approvazione,
                                    b.data_chiusura,
                                    b.periodicita,
                                    rg.descizione,
                                    i.metodo_gestione_fatturazione,
                                    i.periodicita_iva};
            if (query.Count() != 0)
            {
                SiglaSoc.Text = query.First().sigla;
                SedeSoc.Text = query.First().sede;
                NumRegImpr.Text = query.First().numero_reg_imprese;
                NumeroSoci.Text = query.First().NumeroSoci.ToString();
                NumUnita.Text = query.First().NumeroUnitaLocali.ToString();
                TipoSocietà.Text = query.First().descrizione_tipologia;
                DataApprovBil.Text = query.First().data_approvazione.Date.ToString();
                DataChiusuraBil.Text = query.First().data_chiusura.Date.ToString();
                PeriodBilancio.Text = query.First().periodicita;
                RegContabileImpr.Text = query.First().descizione;
                MetGestFatt.Text = query.First().metodo_gestione_fatturazione;
                periodIvaImpr.Text = query.First().periodicita_iva;
            }
            else
            {
                MessageBox.Show("il codice non è associato ad una società","",MessageBoxButtons.OK);
            }
            

        }

        private void VsSocBt_Click(object sender, EventArgs e)
        {
            AllOffDip();
            vsSocietaPanel.Visible = true;
            vsSocietaPanel.BringToFront();
        }
        private void FattImpr()
        {
            var query = from iseg in db.IMPRESE_SEGUITE
                        from impr in db.IMPRESE
                        from rg in db.REGIMI_CONTABILE
                        where iseg.cod_dipendente.Equals(codDipendente)
                        where impr.codice_fiscale_impresa.Equals(iseg.codice_fiscale_impresa)
                        where impr.cod_tipologia == rg.cod_tipologia
                        join dpi in db.DATI_PIATTAFORMA_IMPRESE on impr.codice_fiscale_impresa equals dpi.codice_fiscale_impresa into dp
                        from dati in dp.DefaultIfEmpty()
                        select new { impr.sigla, impr.codice_fiscale_impresa, RegimeContabile = rg.descizione, impr.metodo_gestione_fatturazione, Piattaforma=dati.cod_piattaforma, dati.nome_utente, dati.password};
            fattDataGridIMpr.DataSource = query;
        }
        private void FattLibProf()
        {
            var query = from cs in db.CLIENTI_SEGUITI
                        from lp in db.LIBERI_PROFESSIONISTI
                        from rg in db.REGIMI_CONTABILE
                        where cs.cod_dipendente.Equals(codDipendente)
                        where lp.cod_cliente == cs.cod_cliente
                        where lp.cod_tipologia == rg.cod_tipologia
                        join dpl in db.DATI_PIATTAFORMA_LIB_PROF on lp.cod_cliente equals dpl.cod_cliente into dp
                        from dati in dp.DefaultIfEmpty()
                        select new {lp.CLIENTI.nome, lp.CLIENTI.cognome, lp.CLIENTI.cod_fiscale, RegimeContabile = rg.descizione, lp.metodo_gestione_fatturazione, Piattaforma = dati.cod_piattaforma, dati.nome_utente, dati.password };
            LibProfDataGrid.DataSource = query;
        }

        private void FattBt_Click(object sender, EventArgs e)
        {
            AllOffDip();
            fatturazionePanel.Visible = true;
            FattImpr();
            FattLibProf();
        }

        private void BilancioBt_Click(object sender, EventArgs e)
        {
            AllOffDip();
            bilancioPanel.Visible = true;
            var query = from iseg in db.IMPRESE_SEGUITE
                        from s in db.SOCIETA
                        from b in db.BILANCI
                        where iseg.cod_dipendente.Equals(codDipendente)
                        where s.codice_fiscale_impresa.Equals(iseg.codice_fiscale_impresa)
                        where b.codice_fiscale_impresa.Equals(s.codice_fiscale_impresa)
                        where b.data_chiusura.Equals(new DateTime(DateTime.Now.Year, 12, 31))
                        select new { iseg.IMPRESE.sigla, s.codice_fiscale_impresa, s.capitale_sociale, s.descrizione_tipologia, b.data_approvazione };
            bilDataGridView.DataSource = query;


        }

        private void TitolareButton_Click(object sender, EventArgs e)
        {
            titolareQueryPanel.Visible = true;
            initPanel.Visible = false;

        }

        private void SocietaTitBt_Click(object sender, EventArgs e)
        {
            AllOffTit();
            societaPanel.Visible = true;
            societaPanel.BringToFront();
        }


        private void CercaSocBt_Click(object sender, EventArgs e)
        {

            var query = from i in db.IMPRESE
                        from s in db.SOCIETA
                        from ass in db.ASSOCIAZIONE_SOCI
                        where i.cod_identificativo == int.Parse(codIdSoc.Text)
                        where i.codice_fiscale_impresa == s.codice_fiscale_impresa
                        where ass.codice_fiscale_impresa == s.codice_fiscale_impresa
                        select new { ass.SOCI.CLIENTI.nome, ass.SOCI.CLIENTI.cognome, ass.SOCI.tipologia_socio };
            sociDataGridView.DataSource = query;
            var query2 = from i in db.IMPRESE
                        from s in db.SOCIETA
                        from iseg in db.IMPRESE_SEGUITE
                        where i.cod_identificativo == int.Parse(codIdSoc.Text)
                        where i.codice_fiscale_impresa.Equals(iseg.codice_fiscale_impresa)
                        where i.codice_fiscale_impresa.Equals(s.codice_fiscale_impresa)
                        select new { i.sigla, iseg.DIPENDENTI_STUDIO.nome, iseg.DIPENDENTI_STUDIO.cognome};
            if (query2.Count() == 0)
            {
                MessageBox.Show("codice società inesistente", "", MessageBoxButtons.OK);
                return;
            }
            dipendenteTextBox.Text = query2.First().nome + " " + query2.First().cognome;
            SiglatextBox.Text = query2.First().sigla;

            var query3 = (from i in db.IMPRESE
                          from amm in db.AMMINISTRATORI
                          from c in db.CLIENTI
                          where i.cod_identificativo == int.Parse(codIdSoc.Text)
                          where i.codice_fiscale_impresa.Equals(amm.codice_fiscale_impresa)
                          where c.cod_cliente == amm.cod_cliente
                          orderby amm.data_inizio_incarico descending
                          select new { c.nome, c.cognome }).Take(1);
            if (query3.Count() != 0)
            {
                ammTextBox.Text = query3.First().nome + " " + query3.First().cognome;
            }



        }

        private void VsDipTitBt_Click(object sender, EventArgs e)
        {
            AllOffTit();
            dipQueryTitPanel.Visible = true;

            var query = from dip in db.DIPENDENTI_STUDIO
                        select new
                        {
                            dip.nome,
                            dip.cognome,
                            dip.cod_dipendente,
                            dip.settore,
                            numeroImprese = dip.IMPRESE_SEGUITE.Count,
                            numeroClienti = dip.CLIENTI_SEGUITI.Count
                        };
            DipDelDataGrid.DataSource = query;

        }

        private void DelegheBt_Click(object sender, EventArgs e)
        {
            AllOffTit(); 
            dipQueryTitPanel.Visible = true;
            cercaDelegheBt.Visible = true;
            delegheTextBox.Visible = true;
            DipDelDataGrid.DataSource = null;


        }

        private void cercaDelegheBt_Click(object sender, EventArgs e)
        {
            var query = from d in db.DELEGHE_ANNUE_CLIENTI
                        where d.cod_cliente == int.Parse(delegheTextBox.Text)
                        select new { d.CLIENTI.nome, d.CLIENTI.cognome, d.anno_sottoscrizione, d.data_scadenza, d.tipologia };
            DipDelDataGrid.DataSource = query; 

        }

        private void MenuBt_Click(object sender, EventArgs e)
        {
            AllOffTit();
            titolareQueryPanel.Visible = false;
            initPanel.Visible = true;
            initPanel.BringToFront();
        }

        private void menu2Bt_Click(object sender, EventArgs e)
        {
            AllOffDip();
            dipQueryPanel.Visible = false;
            initPanel.Visible = true;
            titolareButton.Visible = true;
            dipButton.Visible = true;
            sceltaAccLabel.Visible = true;

        }


    }
}
