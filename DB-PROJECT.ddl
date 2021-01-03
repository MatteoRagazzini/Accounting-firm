-- *********************************************
-- * SQL MySQL generation                      
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.1              
-- * Generator date: Dec  4 2018              
-- * Generation date: Mon Jul  8 16:51:37 2019 
-- * LUN file: C:\Users\matte\Documents\Basi di dati\laboratorio\progetto\DB-PROJECT.lun 
-- * Schema: logico 
-- ********************************************* 


-- Database Section
-- ________________ 

create database logico;
use logico;


-- Tables Section
-- _____________ 

create table AMMINISTRATORI (
     codice_fiscale_impresa varchar(16) not null,
     data_inizio_incarico date not null,
     cod_cliente int not null,
     data_fine_incarico date,
     constraint IDAMMINISTRATORE_1_1 unique (cod_cliente, data_inizio_incarico),
     constraint IDAMMINISTRATORE primary key (codice_fiscale_impresa, data_inizio_incarico));

create table ASSOCIAZIONE_SOCI (
     codice_fiscale_impresa varchar(16) not null,
     cod_cliente int not null,
     quota float(12),
     precentuale float(4),
     constraint IDASSOCIAZIONE_SOCI primary key (cod_cliente, codice_fiscale_impresa));

create table BILANCI (
     data_approvazione date not null,
     cod_bilancio varchar(4) not null,
     codice_fiscale_impresa varchar(16) not null,
     data_chiusura date not null,
     periodicita varchar(20) not null,
     constraint IDBILANCIO primary key (cod_bilancio),
     constraint FKREDAZIONE_ID unique (codice_fiscale_impresa));

create table CLIENTI (
     nome varchar(20) not null,
     cognome varchar(20) not null,
     nazionalita varchar(20) not null,
     cod_cliente int not null,
     cod_fiscale char(16) not null,
     data_nascita date not null,
     luogo_nascita varchar(20) not null,
     numero_telefono bigint not null,
     domicilio_fiscale varchar(20) not null,
     constraint IDCLIENTE primary key (cod_cliente),
     constraint IDCLIENTE_1 unique (cod_fiscale));

create table CLIENTI_SEGUITI (
     cod_cliente int not null,
     data_inizio_gestione date not null,
     data_fine_gestione date,
     cod_dipendente varchar(4) not null,
     constraint IDCLIENTE_SEGUITO primary key (cod_cliente, data_inizio_gestione));

create table DATI_PIATTAFORMA_IMPRESE (
     codice_fiscale_impresa varchar(16) not null,
     nome_utente varchar(20) not null,
     password varchar(8) not null,
     cod_piattaforma varchar(6) not null,
     constraint FKADO_IMP_ID primary key (codice_fiscale_impresa));

create table DATI_PIATTAFORMA_LIB_PROF (
     cod_cliente int not null,
     nome_utente varchar(20) not null,
     password varchar(8) not null,
     cod_piattaforma varchar(6) not null,
     constraint FKSCE_LIB_ID primary key (cod_cliente));

create table DELEGHE_ANNUE_CLIENTI (
     cod_cliente int not null,
     data_scadenza date not null,
     tipologia varchar(20) not null,
     anno_sottoscrizione date not null,
     constraint IDDELEGA_ANNUA_CLIENTI primary key (cod_cliente, anno_sottoscrizione));

create table DELEGHE_ANNUE_IMPRESE (
     codice_fiscale_impresa varchar(16) not null,
     data_scadenza date not null,
     tipologia varchar(20) not null,
     anno_sottoscrizione date not null,
     constraint IDDELEGA_ANNUA_IMPRESE primary key (codice_fiscale_impresa, anno_sottoscrizione));

create table DIPENDENTI_STUDIO (
     nome varchar(20) not null,
     cognome varchar(20) not null,
     cod_dipendente varchar(4) not null,
     settore varchar(20) not null,
     constraint IDADDETTO primary key (cod_dipendente));

create table DIRIGENZA_DITTE (
     codice_fiscale_impresa varchar(16) not null,
     cod_cliente int not null,
     constraint FKDIR_IMP_ID primary key (codice_fiscale_impresa));

create table FABBRICATI (
     cod_propieta varchar(4) not null,
     rendita_catastale float(12) not null,
     rendita_rivalutata float(12) not null,
     cod_tipologia_fabbricato varchar(4) not null,
     constraint FKREGISTRAZIONE_FABBRICATO_ID primary key (cod_propieta));

create table IMPRESE (
     cod_identificativo int not null,
     sigla varchar(20) not null,
     nazionalita varchar(20) not null,
     sede varchar(20) not null,
     domicilio_fiscale varchar(20) not null,
     data_inizio_attività date not null,
     codice_fiscale_impresa varchar(16) not null,
     cod_attivita varchar(20) not null,
     metodo_gestione_fatturazione varchar(20),
     periodicita_iva varchar(20),
     metodo_conteggio varchar(20),
     cod_tipologia char(1) not null,
     constraint IDRAGIONE_SOCIALE primary key (codice_fiscale_impresa),
     constraint IDIMPRESA unique (cod_identificativo));

create table IMPRESE_SEGUITE (
     codice_fiscale_impresa varchar(16) not null,
     data_inizio_gestione date not null,
     data_fine_gestione date,
     cod_dipendente varchar(4) not null,
     constraint IDIMPRESA_SEGUITA primary key (codice_fiscale_impresa, data_inizio_gestione));

create table LIBERI_PROFESSIONISTI (
     cod_cliente int not null,
     professione varchar(20) not null,
     tipologia_gestione_contribuzione varchar(20) not null,
     tipo_contribuzione varchar(20) not null,
     metodo_gestione_fatturazione varchar(20),
     periodicita_iva varchar(20),
     metodo_conteggio_iva varchar(20),
     cod_tipologia char(1) not null,
     constraint FKREGISTRAZIONE_LIBERO_PROF_ID primary key (cod_cliente));

create table PIATTAFORME (
     cod_piattaforma varchar(6) not null,
     constraint IDDATI_PIATTAFORMA primary key (cod_piattaforma));

create table PROPRIETA (
     via  varchar(20) not null,
     civico int not null,
     comune varchar(20) not null,
     CAP int not null,
     valore_IMU float(12),
     cod_propieta varchar(4) not null,
     sezione varchar(4) not null,
     foglio varchar(4) not null,
     particella varchar(4) not null,
     subalterno varchar(4) not null,
     classe varchar(4) not null,
     cod_cliente int not null,
     constraint IDPROPRIETÀ_ID primary key (cod_propieta),
     constraint FKIDENTIFICAZIONE  unique (sezione, foglio, particella, subalterno, classe));

create table REGIMI_CONTABILE (
     descizione varchar(20) not null,
     cod_tipologia char(1) not null,
     constraint IDREGIME_CONTABILE primary key (cod_tipologia));

create table SOCI (
     cod_cliente int not null,
     data_affiliazione date not null,
     tipologia_socio varchar(20) not null,
     constraint FKREGISTRAZIONE_SOCIO_ID primary key (cod_cliente));

create table SOCIETA (
     codice_fiscale_impresa varchar(16) not null,
     sigla_tipologia varchar(20) not null,
     capitale_sociale float(12) not null,
     numero_reg_imprese varchar(20) not null,
     descrizione_tipologia varchar(20) not null,
     constraint IDSOCIETÀ unique (numero_reg_imprese),
     constraint FKPUO_ESSERE_ID primary key (codice_fiscale_impresa));

create table TERRENI (
     cod_propieta varchar(4) not null,
     qualita varchar(20) not null,
     rendita_dominicale_catastale float(12) not null,
     rendita_dominicale_rivalutata varchar(12) not null,
     rendita_agraria_catastale varchar(12) not null,
     rendita_agraria_rivalutata varchar(12) not null,
     cod_tipologia_terreno varchar(4) not null,
     constraint FKREGISTRAZIONE_TERRENO_ID primary key (cod_propieta));

create table TIPI_FABBRICATI (
     tipologia_fabbricato varchar(20) not null,
     cod_tipologia_fabbricato varchar(4) not null,
     constraint IDTIPO_FABBRICATI primary key (cod_tipologia_fabbricato));

create table TIPI_TERRENI (
     tipologia_terreno varchar(20) not null,
     cod_tipologia_terreno varchar(4) not null,
     constraint IDTIPO_TERRENO primary key (cod_tipologia_terreno));

create table TITOLARI (
     cod_cliente int not null,
     partita_iva varchar(16) not null,
     constraint IDTITOLARE unique (partita_iva),
     constraint FKREGISTRAZIONE_TITOLARE_ID primary key (cod_cliente));

create table UNITA_LOCALI (
     codice_fiscale_impresa varchar(16) not null,
     cod_unita_locale int not null,
     via  varchar(20) not null,
     civico int not null,
     comune varchar(20) not null,
     CAP int not null,
     constraint IDUNITÀ_LOCALE primary key (codice_fiscale_impresa, cod_unita_locale));


-- Constraints Section
-- ___________________ 

alter table AMMINISTRATORI add constraint FKINCARICO
     foreign key (cod_cliente)
     references CLIENTI (cod_cliente);

alter table AMMINISTRATORI add constraint FKAMMINISTRA
     foreign key (codice_fiscale_impresa)
     references SOCIETA (codice_fiscale_impresa);

alter table ASSOCIAZIONE_SOCI add constraint FKASS_SOC_1
     foreign key (cod_cliente)
     references SOCI (cod_cliente);

alter table ASSOCIAZIONE_SOCI add constraint FKASS_SOC
     foreign key (codice_fiscale_impresa)
     references SOCIETA (codice_fiscale_impresa);

alter table BILANCI add constraint FKREDAZIONE_FK
     foreign key (codice_fiscale_impresa)
     references SOCIETA (codice_fiscale_impresa);

alter table CLIENTI_SEGUITI add constraint FKRICHIESTA_GESTIONE
     foreign key (cod_cliente)
     references CLIENTI (cod_cliente);

alter table CLIENTI_SEGUITI add constraint FKGESTIONE_CLIENTE
     foreign key (cod_dipendente)
     references DIPENDENTI_STUDIO (cod_dipendente);

alter table DATI_PIATTAFORMA_IMPRESE add constraint FKADO_DAT
     foreign key (cod_piattaforma)
     references PIATTAFORME (cod_piattaforma);

alter table DATI_PIATTAFORMA_IMPRESE add constraint FKADO_IMP_FK
     foreign key (codice_fiscale_impresa)
     references IMPRESE (codice_fiscale_impresa);

alter table DATI_PIATTAFORMA_LIB_PROF add constraint FKSCE_LIB_FK
     foreign key (cod_cliente)
     references LIBERI_PROFESSIONISTI (cod_cliente);

alter table DATI_PIATTAFORMA_LIB_PROF add constraint FKSCE_PIA
     foreign key (cod_piattaforma)
     references PIATTAFORME (cod_piattaforma);

alter table DELEGHE_ANNUE_CLIENTI add constraint FKCONCESSIONE
     foreign key (cod_cliente)
     references CLIENTI (cod_cliente);

alter table DELEGHE_ANNUE_IMPRESE add constraint FKSOTTOSCRIZIONE
     foreign key (codice_fiscale_impresa)
     references IMPRESE (codice_fiscale_impresa);

alter table DIRIGENZA_DITTE add constraint FKDIR_TIT
     foreign key (cod_cliente)
     references TITOLARI (cod_cliente);

alter table DIRIGENZA_DITTE add constraint FKDIR_IMP_FK
     foreign key (codice_fiscale_impresa)
     references IMPRESE (codice_fiscale_impresa);

alter table FABBRICATI add constraint FKREGISTRAZIONE_FABBRICATO_FK
     foreign key (cod_propieta)
     references PROPRIETA (cod_propieta);

alter table FABBRICATI add constraint FKATTINENZA
     foreign key (cod_tipologia_fabbricato)
     references TIPI_FABBRICATI (cod_tipologia_fabbricato);

alter table IMPRESE add constraint FKSELEZIONE
     foreign key (cod_tipologia)
     references REGIMI_CONTABILE (cod_tipologia);

alter table IMPRESE_SEGUITE add constraint FKRICHIESTA_GESTIONE_IMPRESE
     foreign key (codice_fiscale_impresa)
     references IMPRESE (codice_fiscale_impresa);

alter table IMPRESE_SEGUITE add constraint FKGESTIONE_IMPRESA
     foreign key (cod_dipendente)
     references DIPENDENTI_STUDIO (cod_dipendente);

alter table LIBERI_PROFESSIONISTI add constraint FKREGISTRAZIONE_LIBERO_PROF_FK
     foreign key (cod_cliente)
     references CLIENTI (cod_cliente);

alter table LIBERI_PROFESSIONISTI add constraint FKDECISIONE
     foreign key (cod_tipologia)
     references REGIMI_CONTABILE (cod_tipologia);

-- Not implemented
-- alter table PROPRIETA add constraint IDPROPRIETÀ_CHK
--     check(exists(select * from TERRENI
--                  where TERRENI.cod_propieta = cod_propieta)); 

-- Not implemented
-- alter table PROPRIETA add constraint IDPROPRIETÀ_CHK
--     check(exists(select * from FABBRICATI
--                  where FABBRICATI.cod_propieta = cod_propieta)); 

alter table PROPRIETA add constraint FKPOSSESSO
     foreign key (cod_cliente)
     references CLIENTI (cod_cliente);

alter table SOCI add constraint FKREGISTRAZIONE_SOCIO_FK
     foreign key (cod_cliente)
     references CLIENTI (cod_cliente);

-- Not implemented
-- alter table SOCIETA add constraint FKPUO_ESSERE_CHK
--     check(exists(select * from AMMINISTRATORI
--                  where AMMINISTRATORI.codice_fiscale_impresa = codice_fiscale_impresa)); 

-- Not implemented
-- alter table SOCIETA add constraint FKPUO_ESSERE_CHK
--     check(exists(select * from BILANCI
--                  where BILANCI.codice_fiscale_impresa = codice_fiscale_impresa)); 

alter table SOCIETA add constraint FKPUO_ESSERE_FK
     foreign key (codice_fiscale_impresa)
     references IMPRESE (codice_fiscale_impresa);

alter table TERRENI add constraint FKREGISTRAZIONE_TERRENO_FK
     foreign key (cod_propieta)
     references PROPRIETA (cod_propieta);

alter table TERRENI add constraint FKAPPARTENENZA
     foreign key (cod_tipologia_terreno)
     references TIPI_TERRENI (cod_tipologia_terreno);

-- Not implemented
-- alter table TITOLARI add constraint FKREGISTRAZIONE_TITOLARE_CHK
--     check(exists(select * from DIRIGENZA_DITTE
--                  where DIRIGENZA_DITTE.cod_cliente = cod_cliente)); 

alter table TITOLARI add constraint FKREGISTRAZIONE_TITOLARE_FK
     foreign key (cod_cliente)
     references CLIENTI (cod_cliente);

alter table UNITA_LOCALI add constraint FKDISLOCAZIONE
     foreign key (codice_fiscale_impresa)
     references IMPRESE (codice_fiscale_impresa);


-- Index Section
-- _____________ 

