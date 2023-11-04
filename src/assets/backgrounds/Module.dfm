object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 324
  Top = 168
  Height = 788
  Width = 1038
  object Con: TsmConexao
    ConnectionName = 'CPR_FB_40'
    DriverName = 'DevartFirebird'
    GetDriverFunc = 'getSQLDriverFirebird'
    LibraryName = 'dbexpida.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DevartInterBase'
      
        'DataBase=127.0.0.1/3044:D:\dev\04\bin\db\tnceletrikacomercio2070' +
        '.fdb'
      'RoleName='
      'User_Name=DEVUSER'
      'Password=u@v2.dv'
      'SQLDialect=3'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'DevartInterBase TransIsolation=ReadCommited'
      'WaitOnLocks=False'
      'Charset=ISO8859_1'
      'CharLength=1'
      'EnableBCD=False'
      'OptimizedNumerics=False'
      'LongStrings=True'
      'UseQuoteChar=True'
      'FetchAll=False')
    TableScope = []
    VendorLib = 'fbclient50.dll'
    AfterConnect = ConAfterConnect
    Connected = True
    ConexaoLog = Con
    Left = 358
    Top = 8
  end
  object dtsPessoa: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado'#13#10'      ,p.id_pessoa'#13#10'      ,p.id_cidad' +
      'e'#13#10'      ,p.nm_pessoa'#13#10'      ,p.tp_pessoa'#13#10'      ,p.fl_ativo'#13#10'  ' +
      '    ,p.id_cpf_cnpj'#13#10'      ,p.id_rg_insc'#13#10'      ,p.nm_fantasia'#13#10' ' +
      '     ,p.ds_endereco'#13#10'      ,p.ds_complemento'#13#10'      ,p.id_cep_pe' +
      'ssoa'#13#10'      ,p.ds_bairro'#13#10'      ,p.nr_telefone'#13#10'      ,p.nr_celu' +
      'lar'#13#10'      ,p.fl_telefoneespecial'#13#10'      ,p.nr_fax'#13#10'      ,p.ds_' +
      'email'#13#10'      ,p.ds_url'#13#10'      ,p.vl_limite_credito'#13#10'      ,p.dt_' +
      'cadastro'#13#10'      ,p.dt_nascimento'#13#10'      ,p.nm_contato'#13#10'      ,p.' +
      'nr_insc_municipal'#13#10'      ,p.id_pessoa_mtz'#13#10'      ,p.pe_comissaop' +
      'adraovendedor'#13#10'      ,p.dt_ultimocontato'#13#10'      ,p.id_vendedorpa' +
      'drao'#13#10'      ,p.nr_diasultimocontato'#13#10'      ,p.nr_inscricaomunici' +
      'pal'#13#10'      ,p.id_sistemaantigo'#13#10'      ,p.ds_endereco_numero'#13#10'   ' +
      '   ,p.ds_caixapostal'#13#10'      ,p.ds_observacao'#13#10'      ,p.nr_ramal'#13 +
      #10'      ,c.nm_cidade as nmcidade'#13#10'      ,c.uf_estado'#13#10'      ,pm.n' +
      'm_pessoa as nomematriz'#13#10'      ,cast((select substring(nm_vendedo' +
      'r from 1 for 100) from proc_nomevendedores_documento(p.id_pessoa' +
      ', '#39'P'#39', 6)) as varchar(100)) as nomevendedor'#13#10'      ,p.ds_empresa' +
      's'#13#10'      ,pescom.fl_sexo'#13#10'      ,case pescom.fl_sexo when '#39'M'#39' th' +
      'en '#39'Masculino'#39#13#10'                           when '#39'F'#39' then '#39'Femini' +
      'no '#39#13#10'       end as fl_sexoextenso'#13#10'      ,ra.ds_ramoatividade'#13#10 +
      '      ,case p.fl_receitaantecipada when '#39'S'#39' then '#39'Sim'#39#13#10'        ' +
      '                           else '#39'N'#227'o'#39#13#10'       end as fl_receitaa' +
      'ntecipadaextenso'#13#10'      ,extract (day from p.dt_nascimento) as d' +
      'ia_nascimento'#13#10'      ,pescom.ds_numerotitulo'#13#10'      ,pescom.ds_z' +
      'onatitulo'#13#10'      ,pescom.ds_secaotitulo'#13#10'      ,p.id_codigo_mobi' +
      'le'#13#10'      ,p.id_tabelapreco'#13#10'      ,s.ds_subnivel'#13#10'      ,o.ds_c' +
      'bo_ocupacao'#13#10'      ,iif(exists(select 1 from pessoa_impressao_di' +
      'gital pid where pid.id_pessoa = p.id_pessoa),'#39'SIM'#39','#39'N'#195'O'#39') as fl_' +
      'impressaodigitalsimnao'#13#10'      ,p.fl_bloqueado'#13#10'      ,p.dt_bloqu' +
      'eadoliberado'#13#10'      ,case when (select first 1 1'#13#10'              ' +
      '    from RECEBERPAGAR rp'#13#10'                  where rp.id_pessoa =' +
      ' p.id_pessoa'#13#10'                  and   rp.dt_vencimento < current' +
      '_date'#13#10'                  and   rp.fl_status in ('#39'ABR'#39','#39'APP'#39','#39'APZ' +
      #39')) > 0 then '#39'S'#39#13#10'            else '#39'N'#39#13#10'       end as fl_parcela' +
      '_vencida'#13#10'      ,rg.ds_regiao'#13#10'      ,m.dt_validadeseguro'#13#10'     ' +
      ' ,rh.dt_admissao'#13#10'      ,rh.dt_demissao'#13#10'      ,cc.nm_cidade || ' +
      #39'/'#39' || cc.uf_estado as ds_cidade_uf_cobranca'#13#10'      ,coalesce(rh' +
      '.ds_profissao,pescom.ds_profissao) as ds_profissao'#13#10'      ,p.vl_' +
      'frete_tonelada'#13#10'      ,p.id_pessoa_ecommerce'#13#10'      ,p.dt_contra' +
      'to'#13#10'      ,uf.nm_uf'#13#10'      ,p.fl_classificacaocliente'#13#10'      ,p.' +
      'ds_email_doce'#13#10'      ,iif(p.qt_expositor is not null and p.qt_ex' +
      'positor > 0,'#39'Sim'#39','#39'N'#227'o'#39') as fl_expositor'#13#10'      ,p.qt_expositor'#13 +
      #10'      ,cast(null as do_valor_null) as vl_limite_saldo'#13#10'from PES' +
      'SOA p'#13#10'     join CIDADE c on(c.id_cidade = p.id_cidade)'#13#10'     le' +
      'ft join RAMOATIVIDADE ra on(ra.id_ramoatividade = p.id_ramoativi' +
      'dade)'#13#10'     left join PESSOA pm on (pm.id_pessoa = p.id_pessoa_m' +
      'tz)'#13#10'     left join PESSOACOMPLEMENTO pescom on (pescom.id_pesso' +
      'a = p.id_pessoa and pescom.fl_tipo_pessoacomplemento = '#39'PESS'#39')'#13#10 +
      '     left join PESSOA_RH pRH on (pRH.id_pessoa = p.id_pessoa)'#13#10' ' +
      '    left join SUBNIVEL s on (s.id_subnivel = prh.id_setor and s.' +
      'ds_tiposubnivel ='#39'S'#39')'#13#10'     left join CBO_OCUPACAO o on (o.id_cb' +
      'o_ocupacao = prh.id_cbo)'#13#10'     left join regiao rg on (rg.id_reg' +
      'iao = p.id_regiao)'#13#10'     left join pessoamotoristaseguro m on (m' +
      '.id_pessoa = p.id_pessoa)'#13#10'     left join pessoa_rh rh on (rh.id' +
      '_pessoa = p.id_pessoa)'#13#10'     left join PROC_ENDERECOPESSOA (p.id' +
      '_pessoa, '#39'C'#39') proc on (1=1)'#13#10'     left join CIDADE cc on (cc.id_' +
      'cidade = coalesce(proc.id_cidade, p.id_cidade))'#13#10'     left join ' +
      'UF on (uf.id_uf = cc.id_uf)'#13#10
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 285
    Top = 150
    object dtsPessoaID_PESSOA: TcprIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInKey]
    end
    object dtsPessoaID_CIDADE: TcprIntegerField
      FieldName = 'ID_CIDADE'
      ProviderFlags = []
    end
    object dtsPessoaNM_PESSOA: TcprStringField
      FieldName = 'NM_PESSOA'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaTP_PESSOA: TcprStringField
      FieldName = 'TP_PESSOA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaID_CPF_CNPJ: TcprStringField
      FieldName = 'ID_CPF_CNPJ'
      ProviderFlags = []
      Size = 18
    end
    object dtsPessoaID_RG_INSC: TcprStringField
      FieldName = 'ID_RG_INSC'
      ProviderFlags = []
      Size = 15
    end
    object dtsPessoaNM_FANTASIA: TcprStringField
      FieldName = 'NM_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaDS_ENDERECO: TcprStringField
      FieldName = 'DS_ENDERECO'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaDS_COMPLEMENTO: TcprStringField
      FieldName = 'DS_COMPLEMENTO'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaID_CEP_PESSOA: TcprIntegerField
      FieldName = 'ID_CEP_PESSOA'
      ProviderFlags = []
    end
    object dtsPessoaDS_BAIRRO: TcprStringField
      FieldName = 'DS_BAIRRO'
      ProviderFlags = []
    end
    object dtsPessoaNR_TELEFONE: TcprStringField
      FieldName = 'NR_TELEFONE'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object dtsPessoaNR_CELULAR: TcprStringField
      FieldName = 'NR_CELULAR'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object dtsPessoaNR_FAX: TcprStringField
      FieldName = 'NR_FAX'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object dtsPessoaVL_LIMITE_CREDITO: TcprFloatField
      FieldName = 'VL_LIMITE_CREDITO'
      ProviderFlags = []
      cprNroCasaDecimal = 0
    end
    object dtsPessoaDT_CADASTRO: TcprDateField
      FieldName = 'DT_CADASTRO'
      ProviderFlags = []
    end
    object dtsPessoaDT_NASCIMENTO: TcprDateField
      FieldName = 'DT_NASCIMENTO'
      ProviderFlags = []
    end
    object dtsPessoaNM_CONTATO: TcprStringField
      FieldName = 'NM_CONTATO'
      ProviderFlags = []
      Size = 50
    end
    object dtsPessoaNR_INSC_MUNICIPAL: TcprStringField
      FieldName = 'NR_INSC_MUNICIPAL'
      ProviderFlags = []
    end
    object dtsPessoaID_PESSOA_MTZ: TcprIntegerField
      FieldName = 'ID_PESSOA_MTZ'
      ProviderFlags = []
    end
    object dtsPessoaFL_TELEFONEESPECIAL: TcprStringField
      FieldName = 'FL_TELEFONEESPECIAL'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaNMCIDADE: TcprStringField
      FieldName = 'NMCIDADE'
      ProviderFlags = []
      Size = 50
    end
    object dtsPessoaNOMEMATRIZ: TcprStringField
      FieldName = 'NOMEMATRIZ'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaDS_URL: TcprStringField
      FieldName = 'DS_URL'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaPE_COMISSAOPADRAOVENDEDOR: TcprFMTBcdField
      FieldName = 'PE_COMISSAOPADRAOVENDEDOR'
      ProviderFlags = []
      Precision = 15
      Size = 3
      cprNroCasaDecimal = 0
    end
    object dtsPessoaID_VENDEDORPADRAO: TcprIntegerField
      FieldName = 'ID_VENDEDORPADRAO'
      ProviderFlags = []
    end
    object dtsPessoaDT_ULTIMOCONTATO: TcprSQLTimeStampField
      FieldName = 'DT_ULTIMOCONTATO'
      ProviderFlags = []
    end
    object dtsPessoaNR_DIASULTIMOCONTATO: TcprIntegerField
      FieldName = 'NR_DIASULTIMOCONTATO'
      ProviderFlags = []
    end
    object dtsPessoaSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaNR_INSCRICAOMUNICIPAL: TcprStringField
      FieldName = 'NR_INSCRICAOMUNICIPAL'
      ProviderFlags = []
    end
    object dtsPessoaID_SISTEMAANTIGO: TcprIntegerField
      FieldName = 'ID_SISTEMAANTIGO'
      ProviderFlags = []
    end
    object dtsPessoaDS_ENDERECO_NUMERO: TcprStringField
      FieldName = 'DS_ENDERECO_NUMERO'
      ProviderFlags = []
      Size = 10
    end
    object dtsPessoaDS_CAIXAPOSTAL: TcprStringField
      FieldName = 'DS_CAIXAPOSTAL'
      ProviderFlags = []
      Size = 10
    end
    object dtsPessoaDS_OBSERVACAO: TcprStringField
      FieldName = 'DS_OBSERVACAO'
      ProviderFlags = []
      Size = 500
    end
    object dtsPessoaNOMEVENDEDOR: TcprStringField
      FieldName = 'NOMEVENDEDOR'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaDS_EMPRESAS: TcprStringField
      FieldName = 'DS_EMPRESAS'
      ProviderFlags = []
    end
    object dtsPessoaUF_ESTADO: TcprStringField
      FieldName = 'UF_ESTADO'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object dtsPessoaFL_SEXO: TcprStringField
      FieldName = 'FL_SEXO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaFL_SEXOEXTENSO: TcprStringField
      FieldName = 'FL_SEXOEXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 9
    end
    object dtsPessoaNR_RAMAL: TcprIntegerField
      FieldName = 'NR_RAMAL'
      ProviderFlags = []
    end
    object dtsPessoaDS_RAMOATIVIDADE: TcprStringField
      FieldName = 'DS_RAMOATIVIDADE'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaFL_RECEITAANTECIPADAEXTENSO: TStringField
      FieldName = 'FL_RECEITAANTECIPADAEXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsPessoaDIA_NASCIMENTO: TSmallintField
      FieldName = 'DIA_NASCIMENTO'
      ProviderFlags = []
    end
    object dtsPessoaDS_NUMEROTITULO: TStringField
      FieldName = 'DS_NUMEROTITULO'
      ProviderFlags = []
      Size = 30
    end
    object dtsPessoaDS_ZONATITULO: TStringField
      FieldName = 'DS_ZONATITULO'
      ProviderFlags = []
      Size = 10
    end
    object dtsPessoaDS_SECAOTITULO: TStringField
      FieldName = 'DS_SECAOTITULO'
      ProviderFlags = []
      Size = 10
    end
    object dtsPessoaID_CODIGO_MOBILE: TStringField
      FieldName = 'ID_CODIGO_MOBILE'
      ProviderFlags = []
      Size = 30
    end
    object dtsPessoaID_TABELAPRECO: TIntegerField
      FieldName = 'ID_TABELAPRECO'
      ProviderFlags = []
    end
    object dtsPessoaDS_SUBNIVEL: TStringField
      FieldName = 'DS_SUBNIVEL'
      ProviderFlags = []
      Size = 120
    end
    object dtsPessoaDS_CBO_OCUPACAO: TStringField
      FieldName = 'DS_CBO_OCUPACAO'
      ProviderFlags = []
      Size = 200
    end
    object dtsPessoaFL_IMPRESSAODIGITALSIMNAO: TStringField
      FieldName = 'FL_IMPRESSAODIGITALSIMNAO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsPessoaFL_BLOQUEADO: TStringField
      FieldName = 'FL_BLOQUEADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaDT_BLOQUEADOLIBERADO: TSQLTimeStampField
      FieldName = 'DT_BLOQUEADOLIBERADO'
      ProviderFlags = []
    end
    object dtsPessoaFL_PARCELA_VENCIDA: TStringField
      FieldName = 'FL_PARCELA_VENCIDA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaDS_REGIAO: TStringField
      FieldName = 'DS_REGIAO'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaDT_VALIDADESEGURO: TDateField
      FieldName = 'DT_VALIDADESEGURO'
      ProviderFlags = []
    end
    object dtsPessoaDT_ADMISSAO: TDateField
      FieldName = 'DT_ADMISSAO'
      ProviderFlags = []
    end
    object dtsPessoaDT_DEMISSAO: TDateField
      FieldName = 'DT_DEMISSAO'
      ProviderFlags = []
    end
    object dtsPessoaDS_CIDADE_UF_COBRANCA: TStringField
      FieldName = 'DS_CIDADE_UF_COBRANCA'
      ProviderFlags = []
      Size = 103
    end
    object dtsPessoaDS_EMAIL: TStringField
      FieldName = 'DS_EMAIL'
      ProviderFlags = []
      Size = 5000
    end
    object dtsPessoaDS_PROFISSAO: TStringField
      FieldName = 'DS_PROFISSAO'
      ProviderFlags = []
      Size = 50
    end
    object dtsPessoaVL_FRETE_TONELADA: TFloatField
      FieldName = 'VL_FRETE_TONELADA'
      ProviderFlags = []
    end
    object dtsPessoaID_PESSOA_ECOMMERCE: TStringField
      FieldName = 'ID_PESSOA_ECOMMERCE'
      Size = 50
    end
    object dtsPessoaDT_CONTRATO: TDateField
      FieldName = 'DT_CONTRATO'
    end
    object dtsPessoaNM_UF: TStringField
      FieldName = 'NM_UF'
      Size = 100
    end
    object dtsPessoaFL_CLASSIFICACAOCLIENTE: TStringField
      FieldName = 'FL_CLASSIFICACAOCLIENTE'
      FixedChar = True
      Size = 1
    end
    object dtsPessoaDS_EMAIL_DOCE: TStringField
      FieldName = 'DS_EMAIL_DOCE'
      Size = 5000
    end
    object dtsPessoaFL_EXPOSITOR: TStringField
      FieldName = 'FL_EXPOSITOR'
      Size = 3
    end
    object dtsPessoaQT_EXPOSITOR: TIntegerField
      FieldName = 'QT_EXPOSITOR'
    end
    object dtsPessoaVL_LIMITE_SALDO: TcprFloatField
      FieldName = 'VL_LIMITE_SALDO'
      ProviderFlags = []
      cprNroCasaDecimal = 0
    end
  end
  object pvdPessoa: TsmProvider
    DataSet = dtsPessoa
    Options = [poAutoRefresh]
    OnGetTableName = pvdPessoaGetTableName
    Left = 357
    Top = 152
  end
  object cltPessoa: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdPessoa'
    OnReconcileError = cltPessoaReconcileError
    TabelaPrincipal = 'PESSOA'
    Left = 428
    Top = 152
    object cltPessoaID_PESSOA: TcprIntegerField
      Tag = 1
      Alignment = taCenter
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInKey]
      DisplayFormat = '00000'
    end
    object cltPessoaID_CIDADE: TcprIntegerField
      Alignment = taCenter
      FieldName = 'ID_CIDADE'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltPessoaNM_PESSOA: TcprStringField
      FieldName = 'NM_PESSOA'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaTP_PESSOA: TcprStringField
      FieldName = 'TP_PESSOA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaID_CPF_CNPJ: TcprStringField
      Alignment = taCenter
      FieldName = 'ID_CPF_CNPJ'
      ProviderFlags = []
      Size = 18
    end
    object cltPessoaID_RG_INSC: TcprStringField
      Alignment = taCenter
      FieldName = 'ID_RG_INSC'
      ProviderFlags = []
      Size = 15
    end
    object cltPessoaNM_FANTASIA: TcprStringField
      FieldName = 'NM_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaDS_ENDERECO: TcprStringField
      FieldName = 'DS_ENDERECO'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaDS_COMPLEMENTO: TcprStringField
      FieldName = 'DS_COMPLEMENTO'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaID_CEP_PESSOA: TcprIntegerField
      Alignment = taCenter
      FieldName = 'ID_CEP_PESSOA'
      ProviderFlags = []
      OnGetText = cltPessoaID_CEP_PESSOAGetText
      EditFormat = '##########'
    end
    object cltPessoaDS_BAIRRO: TcprStringField
      FieldName = 'DS_BAIRRO'
      ProviderFlags = []
    end
    object cltPessoaNR_TELEFONE: TcprStringField
      Alignment = taCenter
      FieldName = 'NR_TELEFONE'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object cltPessoaNR_CELULAR: TcprStringField
      Alignment = taCenter
      FieldName = 'NR_CELULAR'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object cltPessoaNR_FAX: TcprStringField
      Alignment = taCenter
      FieldName = 'NR_FAX'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object cltPessoaVL_LIMITE_CREDITO: TcprFloatField
      FieldName = 'VL_LIMITE_CREDITO'
      ProviderFlags = []
      DisplayFormat = '###0.00'
      cprNroCasaDecimal = 0
    end
    object cltPessoaDT_CADASTRO: TcprDateField
      Alignment = taCenter
      FieldName = 'DT_CADASTRO'
      ProviderFlags = []
    end
    object cltPessoaDT_NASCIMENTO: TcprDateField
      Alignment = taCenter
      FieldName = 'DT_NASCIMENTO'
      ProviderFlags = []
    end
    object cltPessoaNM_CONTATO: TcprStringField
      FieldName = 'NM_CONTATO'
      ProviderFlags = []
      Size = 50
    end
    object cltPessoaNR_INSC_MUNICIPAL: TcprStringField
      Alignment = taCenter
      FieldName = 'NR_INSC_MUNICIPAL'
      ProviderFlags = []
    end
    object cltPessoaID_PESSOA_MTZ: TcprIntegerField
      Alignment = taCenter
      FieldName = 'ID_PESSOA_MTZ'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltPessoaFL_TELEFONEESPECIAL: TcprStringField
      FieldName = 'FL_TELEFONEESPECIAL'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaNMCIDADE: TcprStringField
      FieldName = 'NMCIDADE'
      ProviderFlags = []
      Size = 50
    end
    object cltPessoaNOMEMATRIZ: TcprStringField
      FieldName = 'NOMEMATRIZ'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaDS_URL: TcprStringField
      FieldName = 'DS_URL'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaPE_COMISSAOPADRAOVENDEDOR: TcprFMTBcdField
      FieldName = 'PE_COMISSAOPADRAOVENDEDOR'
      ProviderFlags = []
      Precision = 15
      Size = 3
      cprNroCasaDecimal = 0
    end
    object cltPessoaID_VENDEDORPADRAO: TcprIntegerField
      FieldName = 'ID_VENDEDORPADRAO'
      ProviderFlags = []
    end
    object cltPessoaDT_ULTIMOCONTATO: TcprSQLTimeStampField
      FieldName = 'DT_ULTIMOCONTATO'
      ProviderFlags = []
      DisplayFormat = 'dd/MM/yyyy hh:mm'
    end
    object cltPessoaNR_DIASULTIMOCONTATO: TcprIntegerField
      FieldName = 'NR_DIASULTIMOCONTATO'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object cltPessoaSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaNR_INSCRICAOMUNICIPAL: TcprStringField
      FieldName = 'NR_INSCRICAOMUNICIPAL'
      ProviderFlags = []
    end
    object cltPessoaID_SISTEMAANTIGO: TcprIntegerField
      FieldName = 'ID_SISTEMAANTIGO'
      ProviderFlags = []
    end
    object cltPessoaDS_ENDERECO_NUMERO: TcprStringField
      FieldName = 'DS_ENDERECO_NUMERO'
      ProviderFlags = []
      Size = 10
    end
    object cltPessoaDS_CAIXAPOSTAL: TcprStringField
      FieldName = 'DS_CAIXAPOSTAL'
      ProviderFlags = []
      Size = 10
    end
    object cltPessoaDS_OBSERVACAO: TcprStringField
      FieldName = 'DS_OBSERVACAO'
      ProviderFlags = []
      Size = 500
    end
    object cltPessoaNOMEVENDEDOR: TcprStringField
      FieldName = 'NOMEVENDEDOR'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaDS_EMPRESAS: TcprStringField
      FieldName = 'DS_EMPRESAS'
      ProviderFlags = []
    end
    object cltPessoaUF_ESTADO: TcprStringField
      FieldName = 'UF_ESTADO'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object cltPessoaFL_SEXO: TcprStringField
      FieldName = 'FL_SEXO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaFL_SEXOEXTENSO: TcprStringField
      FieldName = 'FL_SEXOEXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 9
    end
    object cltPessoaNR_RAMAL: TcprIntegerField
      FieldName = 'NR_RAMAL'
      ProviderFlags = []
    end
    object cltPessoaDS_RAMOATIVIDADE: TcprStringField
      FieldName = 'DS_RAMOATIVIDADE'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaFL_RECEITAANTECIPADAEXTENSO: TcprStringField
      FieldName = 'FL_RECEITAANTECIPADAEXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltPessoaDIA_NASCIMENTO: TcprSmallintField
      FieldName = 'DIA_NASCIMENTO'
      ProviderFlags = []
    end
    object cltPessoaDS_NUMEROTITULO: TcprStringField
      FieldName = 'DS_NUMEROTITULO'
      ProviderFlags = []
      Size = 30
    end
    object cltPessoaDS_ZONATITULO: TcprStringField
      FieldName = 'DS_ZONATITULO'
      ProviderFlags = []
      Size = 10
    end
    object cltPessoaDS_SECAOTITULO: TcprStringField
      FieldName = 'DS_SECAOTITULO'
      ProviderFlags = []
      Size = 10
    end
    object cltPessoaID_CODIGO_MOBILE: TcprStringField
      FieldName = 'ID_CODIGO_MOBILE'
      ProviderFlags = []
      Size = 30
    end
    object cltPessoaID_TABELAPRECO: TcprIntegerField
      FieldName = 'ID_TABELAPRECO'
      ProviderFlags = []
    end
    object cltPessoaDS_SUBNIVEL: TcprStringField
      FieldName = 'DS_SUBNIVEL'
      ProviderFlags = []
      Size = 120
    end
    object cltPessoaDS_CBO_OCUPACAO: TcprStringField
      FieldName = 'DS_CBO_OCUPACAO'
      ProviderFlags = []
      Size = 200
    end
    object cltPessoaFL_IMPRESSAODIGITALSIMNAO: TcprStringField
      FieldName = 'FL_IMPRESSAODIGITALSIMNAO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltPessoaFL_BLOQUEADO: TcprStringField
      FieldName = 'FL_BLOQUEADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaDT_BLOQUEADOLIBERADO: TcprSQLTimeStampField
      FieldName = 'DT_BLOQUEADOLIBERADO'
      ProviderFlags = []
      DisplayFormat = 'dd/MM/yyyy hh:mm'
    end
    object cltPessoaFL_PARCELA_VENCIDA: TcprStringField
      FieldName = 'FL_PARCELA_VENCIDA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaDS_REGIAO: TcprStringField
      FieldName = 'DS_REGIAO'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaDT_VALIDADESEGURO: TcprDateField
      FieldName = 'DT_VALIDADESEGURO'
      ProviderFlags = []
    end
    object cltPessoaDT_ADMISSAO: TcprDateField
      FieldName = 'DT_ADMISSAO'
      ProviderFlags = []
    end
    object cltPessoaDT_DEMISSAO: TcprDateField
      FieldName = 'DT_DEMISSAO'
      ProviderFlags = []
    end
    object cltPessoaDS_CIDADE_UF_COBRANCA: TcprStringField
      FieldName = 'DS_CIDADE_UF_COBRANCA'
      ProviderFlags = []
      Size = 103
    end
    object cltPessoaDS_EMAIL: TcprStringField
      FieldName = 'DS_EMAIL'
      ProviderFlags = []
      Size = 5000
    end
    object cltPessoaDS_PROFISSAO: TcprStringField
      FieldName = 'DS_PROFISSAO'
      ProviderFlags = []
      Size = 50
    end
    object cltPessoaVL_FRETE_TONELADA: TcprFloatField
      FieldName = 'VL_FRETE_TONELADA'
      ProviderFlags = []
      DisplayFormat = '##0.00'
    end
    object cltPessoaID_PESSOA_ECOMMERCE: TcprStringField
      FieldName = 'ID_PESSOA_ECOMMERCE'
      Size = 50
    end
    object cltPessoaDT_CONTRATO: TcprDateField
      FieldName = 'DT_CONTRATO'
    end
    object cltPessoaNM_UF: TcprStringField
      FieldName = 'NM_UF'
      Size = 100
    end
    object cltPessoaFL_CLASSIFICACAOCLIENTE: TcprStringField
      FieldName = 'FL_CLASSIFICACAOCLIENTE'
      FixedChar = True
      Size = 1
    end
    object cltPessoaDS_EMAIL_DOCE: TcprStringField
      FieldName = 'DS_EMAIL_DOCE'
      Size = 5000
    end
    object cltPessoaFL_EXPOSITOR: TcprStringField
      FieldName = 'FL_EXPOSITOR'
      ProviderFlags = []
      Size = 3
    end
    object cltPessoaQT_EXPOSITOR: TcprIntegerField
      FieldName = 'QT_EXPOSITOR'
      ProviderFlags = []
    end
    object cltPessoaVL_LIMITE_SALDO: TcprFloatField
      FieldName = 'VL_LIMITE_SALDO'
      ProviderFlags = []
      DisplayFormat = '#,##0.00'
      cprNroCasaDecimal = 0
    end
  end
  object dtsCidade: TsmDataset
    CommandText = 
      'select c.id_cidade,'#13#10'       c.nm_cidade,'#13#10'       c.id_uf,'#13#10'     ' +
      '  c.id_ibge,'#13#10'       c.id_federal,'#13#10'       c.id_estadual,'#13#10'     ' +
      '  uf.ds_sigla as siglauf,'#13#10'       uf.nm_uf,'#13#10'       p.id_pais,'#13#10 +
      '       p.ds_sigla as siglapais,'#13#10'       p.nm_pais'#13#10'from CIDADE c' +
      #13#10'join UF on (uf.id_uf = c.id_uf)'#13#10'join PAIS p on (p.id_pais = u' +
      'f.id_pais)'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 40
    Top = 109
    object dtsCidadeID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Required = True
    end
    object dtsCidadeNM_CIDADE: TStringField
      FieldName = 'NM_CIDADE'
      Required = True
      Size = 50
    end
    object dtsCidadeID_UF: TSmallintField
      FieldName = 'ID_UF'
      Required = True
    end
    object dtsCidadeSIGLAUF: TStringField
      FieldName = 'SIGLAUF'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object dtsCidadeNM_UF: TStringField
      FieldName = 'NM_UF'
      ProviderFlags = []
      Size = 100
    end
    object dtsCidadeID_PAIS: TSmallintField
      FieldName = 'ID_PAIS'
      ProviderFlags = []
    end
    object dtsCidadeSIGLAPAIS: TStringField
      FieldName = 'SIGLAPAIS'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsCidadeNM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      ProviderFlags = []
      Size = 50
    end
    object dtsCidadeID_IBGE: TIntegerField
      FieldName = 'ID_IBGE'
    end
    object dtsCidadeID_FEDERAL: TIntegerField
      FieldName = 'ID_FEDERAL'
    end
    object dtsCidadeID_ESTADUAL: TIntegerField
      FieldName = 'ID_ESTADUAL'
    end
  end
  object pvdCidade: TsmProvider
    DataSet = dtsCidade
    Options = [poAutoRefresh]
    Left = 105
    Top = 109
  end
  object cltCidade: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdCidade'
    TabelaPrincipal = 'CIDADE'
    Left = 174
    Top = 109
    object cltCidadeID_CIDADE: TcprIntegerField
      Tag = 1
      FieldName = 'ID_CIDADE'
      Required = True
      DisplayFormat = '00000'
    end
    object cltCidadeNM_CIDADE: TcprStringField
      FieldName = 'NM_CIDADE'
      Required = True
      Size = 50
    end
    object cltCidadeID_UF: TcprSmallintField
      FieldName = 'ID_UF'
      Required = True
      DisplayFormat = '0000'
    end
    object cltCidadeSIGLAUF: TcprStringField
      FieldName = 'SIGLAUF'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object cltCidadeNM_UF: TcprStringField
      FieldName = 'NM_UF'
      ProviderFlags = []
      Size = 100
    end
    object cltCidadeID_PAIS: TcprSmallintField
      FieldName = 'ID_PAIS'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object cltCidadeSIGLAPAIS: TcprStringField
      FieldName = 'SIGLAPAIS'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltCidadeNM_PAIS: TcprStringField
      FieldName = 'NM_PAIS'
      ProviderFlags = []
      Size = 50
    end
    object cltCidadeID_IBGE: TcprIntegerField
      FieldName = 'ID_IBGE'
    end
    object cltCidadeID_FEDERAL: TcprIntegerField
      FieldName = 'ID_FEDERAL'
    end
    object cltCidadeID_ESTADUAL: TcprIntegerField
      FieldName = 'ID_ESTADUAL'
    end
  end
  object dtsEmpresa: TsmDataset
    CommandText = 
      'select e.id_empresa, '#13#10'       e.ds_empresa, '#13#10'       e.id_pessoa' +
      ', '#13#10'       p.nm_pessoa as nmpessoa, '#13#10'       e.id_empresa_pai,'#13#10 +
      '       pm.nm_pessoa as nomematriz,'#13#10'       e.fl_ativo,'#13#10'       e' +
      '.id_usuarioempresaeditando'#13#10'from EMPRESA e'#13#10'left join PESSOA pm ' +
      'on(pm.id_pessoa = e.id_empresa_pai)'#13#10'join PESSOA p on(p.id_pesso' +
      'a = e.id_pessoa)'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 40
    Top = 242
    object dtsEmpresaID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Required = True
    end
    object dtsEmpresaDS_EMPRESA: TStringField
      FieldName = 'DS_EMPRESA'
      Required = True
      Size = 30
    end
    object dtsEmpresaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object dtsEmpresaNMPESSOA: TStringField
      FieldName = 'NMPESSOA'
      ProviderFlags = []
      Size = 100
    end
    object dtsEmpresaID_EMPRESA_PAI: TIntegerField
      FieldName = 'ID_EMPRESA_PAI'
      Required = True
    end
    object dtsEmpresaNOMEMATRIZ: TStringField
      FieldName = 'NOMEMATRIZ'
      ProviderFlags = []
      Size = 100
    end
    object dtsEmpresaFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object dtsEmpresaID_USUARIOEMPRESAEDITANDO: TSmallintField
      FieldName = 'ID_USUARIOEMPRESAEDITANDO'
    end
  end
  object pvdEmpresa: TsmProvider
    DataSet = dtsEmpresa
    Options = [poAutoRefresh]
    OnGetTableName = pvdEmpresaGetTableName
    Left = 105
    Top = 242
  end
  object dtsCEP: TsmDataset
    CommandText = 
      'select c.nr_cep,'#13#10'       c.id_cidade,'#13#10'       c.ds_endereco,'#13#10'  ' +
      '     c.ds_bairro,'#13#10'       c.ds_complemento,'#13#10'       ci.nm_cidade' +
      ','#13#10'       uf.nm_uf,'#13#10'       ci.uf_estado'#13#10'from CEP c'#13#10'join CIDAD' +
      'E ci on (ci.id_cidade = c.id_cidade)'#13#10'join UF on (uf.id_uf = ci.' +
      'id_uf)'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 40
    Top = 63
    object dtsCEPNR_CEP: TcprIntegerField
      FieldName = 'NR_CEP'
      Required = True
    end
    object dtsCEPID_CIDADE: TcprIntegerField
      FieldName = 'ID_CIDADE'
      Required = True
    end
    object dtsCEPDS_ENDERECO: TcprStringField
      FieldName = 'DS_ENDERECO'
      Size = 100
    end
    object dtsCEPDS_BAIRRO: TcprStringField
      FieldName = 'DS_BAIRRO'
      Size = 100
    end
    object dtsCEPDS_COMPLEMENTO: TcprStringField
      FieldName = 'DS_COMPLEMENTO'
      Size = 100
    end
    object dtsCEPNM_CIDADE: TcprStringField
      FieldName = 'NM_CIDADE'
      ProviderFlags = []
      Size = 50
    end
    object dtsCEPNM_UF: TStringField
      FieldName = 'NM_UF'
      ProviderFlags = []
      Size = 100
    end
    object dtsCEPUF_ESTADO: TStringField
      FieldName = 'UF_ESTADO'
      ProviderFlags = []
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object pvdCEP: TsmProvider
    DataSet = dtsCEP
    Options = [poAutoRefresh]
    OnGetTableName = pvdCEPGetTableName
    Left = 105
    Top = 63
  end
  object cltCEP: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'NR_CEP'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_CIDADE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DS_ENDERECO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DS_BAIRRO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DS_COMPLEMENTO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NM_CIDADE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NM_UF'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'UF_ESTADO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'pvdCEP'
    StoreDefs = True
    TabelaPrincipal = 'CEP'
    Left = 174
    Top = 63
    object cltCEPNR_CEP: TcprIntegerField
      Tag = 1
      Alignment = taCenter
      FieldName = 'NR_CEP'
      Required = True
      OnGetText = cltCEPNR_CEPGetText
      EditFormat = '##########'
    end
    object cltCEPID_CIDADE: TcprIntegerField
      Alignment = taCenter
      FieldName = 'ID_CIDADE'
      Required = True
      DisplayFormat = '00000'
    end
    object cltCEPDS_ENDERECO: TcprStringField
      FieldName = 'DS_ENDERECO'
      Size = 100
    end
    object cltCEPDS_BAIRRO: TcprStringField
      FieldName = 'DS_BAIRRO'
      Size = 100
    end
    object cltCEPDS_COMPLEMENTO: TcprStringField
      FieldName = 'DS_COMPLEMENTO'
      Size = 100
    end
    object cltCEPNM_CIDADE: TcprStringField
      FieldName = 'NM_CIDADE'
      ProviderFlags = []
      Size = 50
    end
    object cltCEPNM_UF: TcprStringField
      FieldName = 'NM_UF'
      ProviderFlags = []
      Size = 100
    end
    object cltCEPUF_ESTADO: TcprStringField
      FieldName = 'UF_ESTADO'
      ProviderFlags = []
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object dtsUnidade: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado'#13#10'      ,vw.id_unidademedida'#13#10'      ,vw' +
      '.sg_medida'#13#10'      ,vw.nm_medida'#13#10'      ,vw.fl_temcomposicao'#13#10'   ' +
      '   ,vw.sg_medida_rel'#13#10'from VW_LST_UNIDADE_MEDIDA vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 528
    Top = 107
    object dtsUnidadeSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsUnidadeID_UNIDADEMEDIDA: TSmallintField
      FieldName = 'ID_UNIDADEMEDIDA'
      ProviderFlags = []
    end
    object dtsUnidadeSG_MEDIDA: TStringField
      FieldName = 'SG_MEDIDA'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object dtsUnidadeNM_MEDIDA: TStringField
      FieldName = 'NM_MEDIDA'
      ProviderFlags = []
      Size = 80
    end
    object dtsUnidadeFL_TEMCOMPOSICAO: TStringField
      FieldName = 'FL_TEMCOMPOSICAO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsUnidadeSG_MEDIDA_REL: TStringField
      FieldName = 'SG_MEDIDA_REL'
      FixedChar = True
      Size = 10
    end
  end
  object pvdUnidade: TsmProvider
    DataSet = dtsUnidade
    Options = [poAutoRefresh]
    Left = 597
    Top = 107
  end
  object cltUnidade: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdUnidade'
    TabelaPrincipal = 'UNIDADE_MEDIDA'
    Left = 663
    Top = 107
    object cltUnidadeID_UNIDADEMEDIDA: TcprSmallintField
      Tag = 1
      FieldName = 'ID_UNIDADEMEDIDA'
      ProviderFlags = [pfInKey]
      DisplayFormat = '0000'
    end
    object cltUnidadeSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltUnidadeSG_MEDIDA: TcprStringField
      FieldName = 'SG_MEDIDA'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object cltUnidadeNM_MEDIDA: TcprStringField
      FieldName = 'NM_MEDIDA'
      ProviderFlags = []
      Size = 80
    end
    object cltUnidadeFL_TEMCOMPOSICAO: TcprStringField
      FieldName = 'FL_TEMCOMPOSICAO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltUnidadeSG_MEDIDA_REL: TcprStringField
      FieldName = 'SG_MEDIDA_REL'
      FixedChar = True
      Size = 10
    end
  end
  object dtsFeriado: TsmDataset
    CommandText = 
      'select vw.ID_FERIADO'#13#10'        ,vw.DS_DESCRICAO'#13#10'        ,vw.NR_D' +
      'IA'#13#10'        ,vw.NR_MES'#13#10'        ,vw.NR_ANO'#13#10'        ,vw.DS_ABRAN' +
      'GENCIA'#13#10'        ,vw.ID_CIDADE'#13#10'        ,vw.NM_CIDADE'#13#10'        ,v' +
      'w.ID_REGIAO'#13#10'        ,vw.DS_REGIAO'#13#10'        ,vw.ID_UF'#13#10'        ,' +
      'vw.NM_UF'#13#10'        ,vw.ID_PAIS'#13#10'        ,vw.NM_PAIS'#13#10'        ,vw.' +
      'DS_PONTO_FACULTATIVO'#13#10'    from VW_LST_FERIADO vw'#13#10'order by vw.id' +
      '_feriado asc'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 40
    Top = 331
    object dtsFeriadoID_FERIADO: TcprSmallintField
      FieldName = 'ID_FERIADO'
      Required = True
    end
    object dtsFeriadoDS_DESCRICAO: TcprStringField
      FieldName = 'DS_DESCRICAO'
      Required = True
      Size = 30
    end
    object dtsFeriadoNR_DIA: TcprSmallintField
      FieldName = 'NR_DIA'
      Required = True
    end
    object dtsFeriadoNR_MES: TcprSmallintField
      FieldName = 'NR_MES'
      Required = True
    end
    object dtsFeriadoDS_ABRANGENCIA: TStringField
      FieldName = 'DS_ABRANGENCIA'
      ProviderFlags = []
      FixedChar = True
      Size = 9
    end
    object dtsFeriadoID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      ProviderFlags = []
    end
    object dtsFeriadoNM_CIDADE: TStringField
      FieldName = 'NM_CIDADE'
      ProviderFlags = []
      Size = 100
    end
    object dtsFeriadoID_UF: TSmallintField
      FieldName = 'ID_UF'
      ProviderFlags = []
    end
    object dtsFeriadoNM_UF: TStringField
      FieldName = 'NM_UF'
      ProviderFlags = []
      Size = 100
    end
    object dtsFeriadoID_PAIS: TSmallintField
      FieldName = 'ID_PAIS'
      ProviderFlags = []
    end
    object dtsFeriadoNM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      ProviderFlags = []
      Size = 50
    end
    object dtsFeriadoDS_PONTO_FACULTATIVO: TStringField
      FieldName = 'DS_PONTO_FACULTATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsFeriadoID_REGIAO: TSmallintField
      FieldName = 'ID_REGIAO'
      ProviderFlags = []
    end
    object dtsFeriadoDS_REGIAO: TStringField
      FieldName = 'DS_REGIAO'
      ProviderFlags = []
      Size = 100
    end
    object dtsFeriadoNR_ANO: TSmallintField
      FieldName = 'NR_ANO'
    end
  end
  object pvdFeriado: TsmProvider
    DataSet = dtsFeriado
    Options = [poAutoRefresh]
    OnGetTableName = pvdUsuarioGetTableName
    Left = 105
    Top = 331
  end
  object cltFeriado: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdFeriado'
    TabelaPrincipal = 'FERIADO'
    Left = 174
    Top = 331
    object cltFeriadoID_FERIADO: TcprSmallintField
      Tag = 1
      FieldName = 'ID_FERIADO'
      Required = True
    end
    object cltFeriadoDS_DESCRICAO: TcprStringField
      FieldName = 'DS_DESCRICAO'
      Required = True
      Size = 30
    end
    object cltFeriadoNR_DIA: TcprSmallintField
      FieldName = 'NR_DIA'
      Required = True
    end
    object cltFeriadoNR_MES: TcprSmallintField
      FieldName = 'NR_MES'
      Required = True
    end
    object cltFeriadoDS_ABRANGENCIA: TcprStringField
      FieldName = 'DS_ABRANGENCIA'
      ProviderFlags = []
      FixedChar = True
      Size = 9
    end
    object cltFeriadoID_CIDADE: TcprIntegerField
      FieldName = 'ID_CIDADE'
      ProviderFlags = []
    end
    object cltFeriadoNM_CIDADE: TcprStringField
      FieldName = 'NM_CIDADE'
      ProviderFlags = []
      Size = 100
    end
    object cltFeriadoID_UF: TcprSmallintField
      FieldName = 'ID_UF'
      ProviderFlags = []
    end
    object cltFeriadoNM_UF: TcprStringField
      FieldName = 'NM_UF'
      ProviderFlags = []
      Size = 100
    end
    object cltFeriadoID_PAIS: TcprSmallintField
      FieldName = 'ID_PAIS'
      ProviderFlags = []
    end
    object cltFeriadoNM_PAIS: TcprStringField
      FieldName = 'NM_PAIS'
      ProviderFlags = []
      Size = 50
    end
    object cltFeriadoDS_PONTO_FACULTATIVO: TcprStringField
      FieldName = 'DS_PONTO_FACULTATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltFeriadoID_REGIAO: TcprSmallintField
      FieldName = 'ID_REGIAO'
      ProviderFlags = []
    end
    object cltFeriadoDS_REGIAO: TcprStringField
      FieldName = 'DS_REGIAO'
      ProviderFlags = []
      Size = 100
    end
    object cltFeriadoNR_ANO: TcprSmallintField
      FieldName = 'NR_ANO'
    end
  end
  object dtsCompromisso: TsmDataset
    GetMetadata = False
    CommandText = 
      'select '#39'N'#39' as selecionado'#13#10'      ,vw.fl_prioridade'#13#10'      ,vw.fl' +
      '_somenteadmmodifica'#13#10'      ,vw.fl_status'#13#10'      ,vw.fl_statusext' +
      'enso'#13#10'      ,vw.id_compromisso'#13#10'      ,vw.dt_cadastro'#13#10'      ,vw' +
      '.id_empresa'#13#10'      ,vw.fl_privado'#13#10'      ,vw.dt_compromisso'#13#10'   ' +
      '   ,vw.tm_compromisso'#13#10'      ,vw.id_usuariolancamento'#13#10'      ,vw' +
      '.id_usuarioresponsavel'#13#10'      ,vw.id_pessoa'#13#10'      ,vw.tm_previs' +
      'aosolucao'#13#10'      ,vw.ds_observacaoencerramento'#13#10'      ,vw.ds_ass' +
      'unto'#13#10'      ,vw.dt_encerramento'#13#10'      ,vw.usuariolancamento'#13#10'  ' +
      '    ,vw.usuarioresponsavel'#13#10'      ,vw.interessado'#13#10'      ,vw.tip' +
      'opessoa'#13#10'      ,vw.ds_bairro'#13#10'      ,vw.nm_cidade'#13#10'      ,vw.nr_' +
      'telefone'#13#10'      ,vw.id_pessoa_bem'#13#10'      ,vw.nm_pessoa_bem'#13#10'    ' +
      '  ,vw.id_pessoabem'#13#10'      ,vw.ds_setor'#13#10'      ,vw.id_usuario'#13#10'  ' +
      '    ,vw.id_documento'#13#10'      ,vw.fl_documento_ext'#13#10'      ,vw.ds_m' +
      'odelo'#13#10'      ,vw.ds_tipo_ext'#13#10'      ,vw.ds_regiao'#13#10'      ,vw.id_' +
      'documentostatus'#13#10'      ,vw.ds_statuspersonalizado'#13#10'      ,vw.nr_' +
      'cor'#13#10'      ,vw.id_documentostatus2'#13#10'      ,vw.ds_statuspersonali' +
      'zado2'#13#10'      ,vw.nr_cor2'#13#10'      ,vw.ds_email'#13#10'      ,vw.hr_sla'#13#10 +
      '      ,vw.fl_enviaemail'#13#10'      ,vw.hr_sla_regressiva'#13#10'      ,vw.' +
      'fl_documento'#13#10'      ,vw.fl_horario_ext'#13#10'      ,vw.fl_horario'#13#10'  ' +
      '    ,vw.ds_bairro_entrega'#13#10'      ,vw.ds_endereco_entrega'#13#10'      ' +
      ',vw.nm_cidade_entrega'#13#10'      ,vw.ds_entrega'#13#10'      ,vw.nm_pessoa' +
      'vendedor'#13#10'      ,vw.dt_hr'#13#10'      ,vw.ds_tipo_compromisso'#13#10'from v' +
      'w_lst_compromisso vw'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Con
    Left = 39
    Top = 198
    object dtsCompromissoSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtsCompromissoFL_PRIORIDADE: TcprStringField
      FieldName = 'FL_PRIORIDADE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtsCompromissoFL_SOMENTEADMMODIFICA: TcprStringField
      FieldName = 'FL_SOMENTEADMMODIFICA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtsCompromissoFL_STATUS: TcprStringField
      FieldName = 'FL_STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtsCompromissoFL_STATUSEXTENSO: TcprStringField
      FieldName = 'FL_STATUSEXTENSO'
      FixedChar = True
      Size = 10
    end
    object dtsCompromissoID_COMPROMISSO: TcprIntegerField
      Tag = 1
      FieldName = 'ID_COMPROMISSO'
      Required = True
    end
    object dtsCompromissoDT_CADASTRO: TcprSQLTimeStampField
      FieldName = 'DT_CADASTRO'
      Required = True
    end
    object dtsCompromissoID_EMPRESA: TcprIntegerField
      FieldName = 'ID_EMPRESA'
      Required = True
    end
    object dtsCompromissoFL_PRIVADO: TcprStringField
      FieldName = 'FL_PRIVADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtsCompromissoDT_COMPROMISSO: TcprDateField
      FieldName = 'DT_COMPROMISSO'
      Required = True
    end
    object dtsCompromissoTM_COMPROMISSO: TcprTimeField
      FieldName = 'TM_COMPROMISSO'
      Required = True
    end
    object dtsCompromissoID_USUARIOLANCAMENTO: TcprIntegerField
      FieldName = 'ID_USUARIOLANCAMENTO'
      Required = True
    end
    object dtsCompromissoID_USUARIORESPONSAVEL: TcprIntegerField
      FieldName = 'ID_USUARIORESPONSAVEL'
      Required = True
    end
    object dtsCompromissoID_PESSOA: TcprIntegerField
      FieldName = 'ID_PESSOA'
    end
    object dtsCompromissoTM_PREVISAOSOLUCAO: TcprTimeField
      FieldName = 'TM_PREVISAOSOLUCAO'
    end
    object dtsCompromissoDS_OBSERVACAOENCERRAMENTO: TcprStringField
      FieldName = 'DS_OBSERVACAOENCERRAMENTO'
      Size = 1000
    end
    object dtsCompromissoDS_ASSUNTO: TcprStringField
      FieldName = 'DS_ASSUNTO'
      Size = 150
    end
    object dtsCompromissoDT_ENCERRAMENTO: TcprSQLTimeStampField
      FieldName = 'DT_ENCERRAMENTO'
    end
    object dtsCompromissoUSUARIOLANCAMENTO: TcprStringField
      FieldName = 'USUARIOLANCAMENTO'
      Required = True
      Size = 100
    end
    object dtsCompromissoUSUARIORESPONSAVEL: TcprStringField
      FieldName = 'USUARIORESPONSAVEL'
      Required = True
      Size = 100
    end
    object dtsCompromissoINTERESSADO: TcprStringField
      FieldName = 'INTERESSADO'
      Size = 100
    end
    object dtsCompromissoTIPOPESSOA: TcprStringField
      FieldName = 'TIPOPESSOA'
      FixedChar = True
      Size = 1
    end
    object dtsCompromissoDS_BAIRRO: TcprStringField
      FieldName = 'DS_BAIRRO'
      Size = 100
    end
    object dtsCompromissoNM_CIDADE: TcprStringField
      FieldName = 'NM_CIDADE'
      Size = 50
    end
    object dtsCompromissoNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object dtsCompromissoID_PESSOA_BEM: TIntegerField
      FieldName = 'ID_PESSOA_BEM'
    end
    object dtsCompromissoNM_PESSOA_BEM: TStringField
      FieldName = 'NM_PESSOA_BEM'
      Size = 100
    end
    object dtsCompromissoID_PESSOABEM: TIntegerField
      FieldName = 'ID_PESSOABEM'
    end
    object dtsCompromissoDS_SETOR: TStringField
      FieldName = 'DS_SETOR'
      Size = 50
    end
    object dtsCompromissoID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
    end
    object dtsCompromissoID_DOCUMENTO: TIntegerField
      FieldName = 'ID_DOCUMENTO'
    end
    object dtsCompromissoFL_DOCUMENTO_EXT: TStringField
      FieldName = 'FL_DOCUMENTO_EXT'
      FixedChar = True
      Size = 16
    end
    object dtsCompromissoDS_MODELO: TStringField
      FieldName = 'DS_MODELO'
      Size = 120
    end
    object dtsCompromissoDS_TIPO_EXT: TStringField
      FieldName = 'DS_TIPO_EXT'
      FixedChar = True
      Size = 19
    end
    object dtsCompromissoDS_REGIAO: TStringField
      FieldName = 'DS_REGIAO'
      Size = 100
    end
    object dtsCompromissoID_DOCUMENTOSTATUS: TIntegerField
      FieldName = 'ID_DOCUMENTOSTATUS'
    end
    object dtsCompromissoDS_STATUSPERSONALIZADO: TStringField
      FieldName = 'DS_STATUSPERSONALIZADO'
      Size = 100
    end
    object dtsCompromissoNR_COR: TIntegerField
      FieldName = 'NR_COR'
    end
    object dtsCompromissoID_DOCUMENTOSTATUS2: TIntegerField
      FieldName = 'ID_DOCUMENTOSTATUS2'
    end
    object dtsCompromissoDS_STATUSPERSONALIZADO2: TStringField
      FieldName = 'DS_STATUSPERSONALIZADO2'
      Size = 100
    end
    object dtsCompromissoNR_COR2: TIntegerField
      FieldName = 'NR_COR2'
    end
    object dtsCompromissoDS_EMAIL: TStringField
      FieldName = 'DS_EMAIL'
      Size = 100
    end
    object dtsCompromissoHR_SLA: TStringField
      FieldName = 'HR_SLA'
      Size = 11
    end
    object dtsCompromissoFL_ENVIAEMAIL: TStringField
      FieldName = 'FL_ENVIAEMAIL'
      FixedChar = True
      Size = 1
    end
    object dtsCompromissoHR_SLA_REGRESSIVA: TStringField
      FieldName = 'HR_SLA_REGRESSIVA'
      Size = 11
    end
    object dtsCompromissoFL_DOCUMENTO: TStringField
      FieldName = 'FL_DOCUMENTO'
      FixedChar = True
      Size = 1
    end
    object dtsCompromissoFL_HORARIO_EXT: TStringField
      FieldName = 'FL_HORARIO_EXT'
      FixedChar = True
      Size = 5
    end
    object dtsCompromissoFL_HORARIO: TStringField
      FieldName = 'FL_HORARIO'
      FixedChar = True
      Size = 1
    end
    object dtsCompromissoDS_BAIRRO_ENTREGA: TStringField
      FieldName = 'DS_BAIRRO_ENTREGA'
      Size = 100
    end
    object dtsCompromissoDS_ENDERECO_ENTREGA: TStringField
      FieldName = 'DS_ENDERECO_ENTREGA'
      Size = 120
    end
    object dtsCompromissoNM_CIDADE_ENTREGA: TStringField
      FieldName = 'NM_CIDADE_ENTREGA'
      Size = 100
    end
    object dtsCompromissoDS_ENTREGA: TStringField
      FieldName = 'DS_ENTREGA'
      Size = 100
    end
    object dtsCompromissoNM_PESSOAVENDEDOR: TStringField
      FieldName = 'NM_PESSOAVENDEDOR'
      Size = 100
    end
    object dtsCompromissoDT_HR: TSQLTimeStampField
      FieldName = 'DT_HR'
      ProviderFlags = []
    end
    object dtsCompromissoDS_TIPO_COMPROMISSO: TStringField
      FieldName = 'DS_TIPO_COMPROMISSO'
      ProviderFlags = []
      Size = 100
    end
  end
  object pvdCompromisso: TsmProvider
    DataSet = dtsCompromisso
    Options = [poAutoRefresh]
    Left = 105
    Top = 198
  end
  object cltCompromisso: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdCompromisso'
    TabelaPrincipal = 'COMPROMISSO'
    Left = 174
    Top = 198
    object cltCompromissoSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cltCompromissoFL_PRIORIDADE: TcprStringField
      FieldName = 'FL_PRIORIDADE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cltCompromissoFL_SOMENTEADMMODIFICA: TcprStringField
      FieldName = 'FL_SOMENTEADMMODIFICA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cltCompromissoFL_STATUS: TcprStringField
      FieldName = 'FL_STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cltCompromissoFL_STATUSEXTENSO: TcprStringField
      FieldName = 'FL_STATUSEXTENSO'
      FixedChar = True
      Size = 10
    end
    object cltCompromissoID_COMPROMISSO: TcprIntegerField
      Tag = 1
      FieldName = 'ID_COMPROMISSO'
      Required = True
    end
    object cltCompromissoDT_CADASTRO: TcprSQLTimeStampField
      FieldName = 'DT_CADASTRO'
      Required = True
    end
    object cltCompromissoID_EMPRESA: TcprIntegerField
      FieldName = 'ID_EMPRESA'
      Required = True
    end
    object cltCompromissoFL_PRIVADO: TcprStringField
      FieldName = 'FL_PRIVADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cltCompromissoDT_COMPROMISSO: TcprDateField
      FieldName = 'DT_COMPROMISSO'
      Required = True
    end
    object cltCompromissoTM_COMPROMISSO: TcprTimeField
      FieldName = 'TM_COMPROMISSO'
      Required = True
    end
    object cltCompromissoID_USUARIOLANCAMENTO: TcprIntegerField
      FieldName = 'ID_USUARIOLANCAMENTO'
      Required = True
    end
    object cltCompromissoID_USUARIORESPONSAVEL: TcprIntegerField
      FieldName = 'ID_USUARIORESPONSAVEL'
      Required = True
    end
    object cltCompromissoID_PESSOA: TcprIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cltCompromissoTM_PREVISAOSOLUCAO: TcprTimeField
      FieldName = 'TM_PREVISAOSOLUCAO'
    end
    object cltCompromissoDS_OBSERVACAOENCERRAMENTO: TcprStringField
      FieldName = 'DS_OBSERVACAOENCERRAMENTO'
      Size = 1000
    end
    object cltCompromissoDS_ASSUNTO: TcprStringField
      FieldName = 'DS_ASSUNTO'
      Size = 150
    end
    object cltCompromissoDT_ENCERRAMENTO: TcprSQLTimeStampField
      FieldName = 'DT_ENCERRAMENTO'
    end
    object cltCompromissoUSUARIOLANCAMENTO: TcprStringField
      FieldName = 'USUARIOLANCAMENTO'
      Required = True
      Size = 100
    end
    object cltCompromissoUSUARIORESPONSAVEL: TcprStringField
      FieldName = 'USUARIORESPONSAVEL'
      Required = True
      Size = 100
    end
    object cltCompromissoINTERESSADO: TcprStringField
      FieldName = 'INTERESSADO'
      Size = 100
    end
    object cltCompromissoTIPOPESSOA: TcprStringField
      FieldName = 'TIPOPESSOA'
      FixedChar = True
      Size = 1
    end
    object cltCompromissoDS_BAIRRO: TcprStringField
      FieldName = 'DS_BAIRRO'
      Size = 100
    end
    object cltCompromissoNM_CIDADE: TcprStringField
      FieldName = 'NM_CIDADE'
      Size = 50
    end
    object cltCompromissoNR_TELEFONE: TcprStringField
      FieldName = 'NR_TELEFONE'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object cltCompromissoID_PESSOA_BEM: TcprIntegerField
      FieldName = 'ID_PESSOA_BEM'
    end
    object cltCompromissoNM_PESSOA_BEM: TcprStringField
      FieldName = 'NM_PESSOA_BEM'
      Size = 100
    end
    object cltCompromissoID_PESSOABEM: TcprIntegerField
      FieldName = 'ID_PESSOABEM'
    end
    object cltCompromissoDS_SETOR: TcprStringField
      FieldName = 'DS_SETOR'
      Size = 50
    end
    object cltCompromissoID_USUARIO: TcprIntegerField
      FieldName = 'ID_USUARIO'
    end
    object cltCompromissoID_DOCUMENTO: TcprIntegerField
      FieldName = 'ID_DOCUMENTO'
    end
    object cltCompromissoFL_DOCUMENTO_EXT: TcprStringField
      FieldName = 'FL_DOCUMENTO_EXT'
      FixedChar = True
      Size = 16
    end
    object cltCompromissoDS_MODELO: TcprStringField
      FieldName = 'DS_MODELO'
      Size = 120
    end
    object cltCompromissoDS_TIPO_EXT: TcprStringField
      FieldName = 'DS_TIPO_EXT'
      FixedChar = True
      Size = 19
    end
    object cltCompromissoDS_REGIAO: TcprStringField
      FieldName = 'DS_REGIAO'
      Size = 100
    end
    object cltCompromissoDS_STATUSPERSONALIZADO: TcprStringField
      FieldName = 'DS_STATUSPERSONALIZADO'
      Size = 100
    end
    object cltCompromissoNR_COR: TcprIntegerField
      FieldName = 'NR_COR'
    end
    object cltCompromissoID_DOCUMENTOSTATUS2: TcprIntegerField
      FieldName = 'ID_DOCUMENTOSTATUS2'
    end
    object cltCompromissoDS_EMAIL: TcprStringField
      FieldName = 'DS_EMAIL'
      Size = 100
    end
    object cltCompromissoHR_SLA: TcprStringField
      FieldName = 'HR_SLA'
      Size = 11
    end
    object cltCompromissoFL_ENVIAEMAIL: TcprStringField
      FieldName = 'FL_ENVIAEMAIL'
      FixedChar = True
      Size = 1
    end
    object cltCompromissoHR_SLA_REGRESSIVA: TcprStringField
      FieldName = 'HR_SLA_REGRESSIVA'
      Size = 11
    end
    object cltCompromissoFL_DOCUMENTO: TcprStringField
      FieldName = 'FL_DOCUMENTO'
      FixedChar = True
      Size = 1
    end
    object cltCompromissoFL_HORARIO_EXT: TcprStringField
      FieldName = 'FL_HORARIO_EXT'
      FixedChar = True
      Size = 5
    end
    object cltCompromissoFL_HORARIO: TcprStringField
      FieldName = 'FL_HORARIO'
      FixedChar = True
      Size = 1
    end
    object cltCompromissoDS_BAIRRO_ENTREGA: TcprStringField
      FieldName = 'DS_BAIRRO_ENTREGA'
      Size = 100
    end
    object cltCompromissoDS_ENDERECO_ENTREGA: TcprStringField
      FieldName = 'DS_ENDERECO_ENTREGA'
      Size = 120
    end
    object cltCompromissoNM_CIDADE_ENTREGA: TcprStringField
      FieldName = 'NM_CIDADE_ENTREGA'
      Size = 100
    end
    object cltCompromissoDS_ENTREGA: TcprStringField
      FieldName = 'DS_ENTREGA'
      Size = 100
    end
    object cltCompromissoID_DOCUMENTOSTATUS: TcprIntegerField
      FieldName = 'ID_DOCUMENTOSTATUS'
    end
    object cltCompromissoDS_STATUSPERSONALIZADO2: TcprStringField
      FieldName = 'DS_STATUSPERSONALIZADO2'
      Size = 100
    end
    object cltCompromissoNR_COR2: TcprIntegerField
      FieldName = 'NR_COR2'
    end
    object cltCompromissoNM_PESSOAVENDEDOR: TcprStringField
      FieldName = 'NM_PESSOAVENDEDOR'
      Size = 100
    end
    object cltCompromissoDT_HR: TcprSQLTimeStampField
      FieldName = 'DT_HR'
      ProviderFlags = []
      DisplayFormat = 'dd/MM/yy hh:mm'
    end
    object cltCompromissoDS_TIPO_COMPROMISSO: TcprStringField
      FieldName = 'DS_TIPO_COMPROMISSO'
      ProviderFlags = []
      Size = 100
    end
  end
  object dtsMensagem: TsmDataset
    CommandText = 
      'select m.id_mensagem'#13#10'      ,m.ds_descricao'#13#10'      ,m.ds_mensage' +
      'm'#13#10'      ,m.fl_parametrizada'#13#10'      ,m.fl_ativo'#13#10'      ,m.fl_mul' +
      'tiplaslinhas'#13#10'      ,m.ds_sql'#13#10'      ,m.ds_sqlverificacao'#13#10'     ' +
      ' ,m.id_usuarioempresaeditando'#13#10'      ,m.fl_fixo'#13#10'      ,m.ds_doc' +
      'umentos'#13#10'      ,l.id_lei'#13#10'      ,l.ds_lei'#13#10'from MENSAGEM m'#13#10'  le' +
      'ft join LEI l on (l.id_lei = m.id_lei)'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 40
    Top = 373
    object dtsMensagemID_MENSAGEM: TSmallintField
      FieldName = 'ID_MENSAGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtsMensagemDS_DESCRICAO: TStringField
      FieldName = 'DS_DESCRICAO'
      Size = 250
    end
    object dtsMensagemDS_MENSAGEM: TStringField
      FieldName = 'DS_MENSAGEM'
      Required = True
      Size = 5000
    end
    object dtsMensagemFL_PARAMETRIZADA: TStringField
      FieldName = 'FL_PARAMETRIZADA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtsMensagemFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtsMensagemFL_MULTIPLASLINHAS: TStringField
      FieldName = 'FL_MULTIPLASLINHAS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtsMensagemDS_SQL: TMemoField
      FieldName = 'DS_SQL'
      BlobType = ftMemo
    end
    object dtsMensagemDS_SQLVERIFICACAO: TMemoField
      FieldName = 'DS_SQLVERIFICACAO'
      BlobType = ftMemo
    end
    object dtsMensagemID_USUARIOEMPRESAEDITANDO: TSmallintField
      FieldName = 'ID_USUARIOEMPRESAEDITANDO'
    end
    object dtsMensagemFL_FIXO: TStringField
      FieldName = 'FL_FIXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtsMensagemDS_DOCUMENTOS: TStringField
      FieldName = 'DS_DOCUMENTOS'
      Size = 1000
    end
    object dtsMensagemID_LEI: TIntegerField
      FieldName = 'ID_LEI'
    end
    object dtsMensagemDS_LEI: TStringField
      FieldName = 'DS_LEI'
      Size = 500
    end
  end
  object pvdMensagem: TsmProvider
    DataSet = dtsMensagem
    Options = [poAutoRefresh]
    UpdateMode = upWhereKeyOnly
    Left = 105
    Top = 373
  end
  object cltMensagem: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdMensagem'
    TabelaPrincipal = 'MENSAGEM'
    Left = 174
    Top = 373
    object cltMensagemID_MENSAGEM: TcprSmallintField
      FieldName = 'ID_MENSAGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cltMensagemDS_DESCRICAO: TcprStringField
      FieldName = 'DS_DESCRICAO'
      Size = 250
    end
    object cltMensagemDS_MENSAGEM: TcprStringField
      FieldName = 'DS_MENSAGEM'
      Required = True
      Size = 5000
    end
    object cltMensagemFL_PARAMETRIZADA: TcprStringField
      FieldName = 'FL_PARAMETRIZADA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cltMensagemFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cltMensagemFL_MULTIPLASLINHAS: TcprStringField
      FieldName = 'FL_MULTIPLASLINHAS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cltMensagemDS_SQL: TcprMemoField
      FieldName = 'DS_SQL'
      BlobType = ftMemo
    end
    object cltMensagemDS_SQLVERIFICACAO: TcprMemoField
      FieldName = 'DS_SQLVERIFICACAO'
      BlobType = ftMemo
    end
    object cltMensagemID_USUARIOEMPRESAEDITANDO: TcprSmallintField
      FieldName = 'ID_USUARIOEMPRESAEDITANDO'
    end
    object cltMensagemFL_FIXO: TcprStringField
      FieldName = 'FL_FIXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cltMensagemDS_DOCUMENTOS: TcprStringField
      FieldName = 'DS_DOCUMENTOS'
      Size = 1000
    end
    object cltMensagemID_LEI: TcprIntegerField
      Alignment = taCenter
      FieldName = 'ID_LEI'
      DisplayFormat = '000'
    end
    object cltMensagemDS_LEI: TcprStringField
      FieldName = 'DS_LEI'
      Size = 500
    end
  end
  object pvdUsuarioMemorando: TsmProvider
    DataSet = dtsUsuarioMemorando
    Options = [poAutoRefresh]
    OnGetTableName = pvdUsuarioMemorandoGetTableName
    Left = 597
    Top = 255
  end
  object cltUsuarioMemorando: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdUsuarioMemorando'
    TabelaPrincipal = 'USUARIO'
    Left = 663
    Top = 255
    object cltUsuarioMemorandoID_PESSOA: TcprIntegerField
      Tag = 1
      FieldName = 'ID_PESSOA'
      Required = True
      DisplayFormat = '00000'
    end
    object cltUsuarioMemorandoNM_LOGIN: TcprStringField
      FieldName = 'NM_LOGIN'
      Required = True
      FixedChar = True
    end
    object cltUsuarioMemorandoFL_LOGADO: TcprStringField
      FieldName = 'FL_LOGADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cltUsuarioMemorandoFL_LOGADOEXTENSO: TcprStringField
      FieldName = 'FL_LOGADOEXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltUsuarioMemorandoNM_PESSOA: TcprStringField
      FieldName = 'NM_PESSOA'
      ProviderFlags = []
      Size = 100
    end
    object cltUsuarioMemorandoSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltUsuarioMemorandoID_USUARIO: TcprIntegerField
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000'
    end
    object cltUsuarioMemorandoDS_SUBNIVEL: TcprStringField
      FieldName = 'DS_SUBNIVEL'
      ProviderFlags = []
      Size = 120
    end
    object cltUsuarioMemorandoFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cltUsuarioMemorandoFL_FRENTEDECAIXA: TcprStringField
      FieldName = 'FL_FRENTEDECAIXA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dtsUsuarioMemorando: TsmDataset
    CommandText = 
      'select  u.id_usuario,'#13#10'          u.id_pessoa,'#13#10'          u.nm_lo' +
      'gin,'#13#10'          u.fl_logado,'#13#10'          u.fl_ativo,'#13#10'          u' +
      '.fl_frentedecaixa,'#13#10'          case u.fl_logado'#13#10'                ' +
      ' when '#39'S'#39' then '#39'Sim'#39#13#10'                 when '#39'N'#39' then '#39'N'#227'o'#39#13#10'    ' +
      '      end as fl_logadoextenso,'#13#10'          p.nm_pessoa,'#13#10'        ' +
      '  s.ds_subnivel,'#13#10'          '#39'N'#39' as selecionado'#13#10'from USUARIO u'#13#10 +
      'join PESSOA p on (p.id_pessoa = u.id_pessoa)'#13#10'join SUBNIVEL s on' +
      ' (s.id_subnivel = u.id_subnivel_setor)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Con
    Left = 528
    Top = 255
    object dtsUsuarioMemorandoID_PESSOA: TcprIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object dtsUsuarioMemorandoNM_LOGIN: TcprStringField
      FieldName = 'NM_LOGIN'
      Required = True
      FixedChar = True
    end
    object dtsUsuarioMemorandoFL_LOGADO: TcprStringField
      FieldName = 'FL_LOGADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtsUsuarioMemorandoFL_LOGADOEXTENSO: TcprStringField
      FieldName = 'FL_LOGADOEXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsUsuarioMemorandoNM_PESSOA: TcprStringField
      FieldName = 'NM_PESSOA'
      ProviderFlags = []
      Size = 100
    end
    object dtsUsuarioMemorandoSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsUsuarioMemorandoID_USUARIO: TcprIntegerField
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtsUsuarioMemorandoDS_SUBNIVEL: TcprStringField
      FieldName = 'DS_SUBNIVEL'
      ProviderFlags = []
      Size = 120
    end
    object dtsUsuarioMemorandoFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtsUsuarioMemorandoFL_FRENTEDECAIXA: TcprStringField
      FieldName = 'FL_FRENTEDECAIXA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cltEmpresa: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdEmpresa'
    TabelaPrincipal = 'EMPRESA'
    Left = 174
    Top = 242
    object cltEmpresaID_EMPRESA: TcprIntegerField
      Tag = 1
      FieldName = 'ID_EMPRESA'
      Required = True
      DisplayFormat = '000'
    end
    object cltEmpresaDS_EMPRESA: TcprStringField
      FieldName = 'DS_EMPRESA'
      Required = True
      Size = 30
    end
    object cltEmpresaID_PESSOA: TcprIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
      DisplayFormat = '00000'
    end
    object cltEmpresaNMPESSOA: TcprStringField
      FieldName = 'NMPESSOA'
      ProviderFlags = []
      Size = 100
    end
    object cltEmpresaID_EMPRESA_PAI: TcprIntegerField
      FieldName = 'ID_EMPRESA_PAI'
      Required = True
      DisplayFormat = '00000'
    end
    object cltEmpresaNOMEMATRIZ: TcprStringField
      FieldName = 'NOMEMATRIZ'
      ProviderFlags = []
      Size = 100
    end
    object cltEmpresaFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object cltEmpresaID_USUARIOEMPRESAEDITANDO: TcprSmallintField
      FieldName = 'ID_USUARIOEMPRESAEDITANDO'
    end
  end
  object dtsUsuario: TsmDataset
    CommandText = 
      'select vw.id_usuario'#13#10'      ,vw.id_pessoa'#13#10'      ,vw.nm_login'#13#10' ' +
      '     ,vw.fl_ativo'#13#10'      ,vw.fl_frentedecaixa'#13#10'      ,vw.fl_fren' +
      'tedecaixaextendido'#13#10'      ,vw.nm_pessoa'#13#10'      ,vw.ds_subnivel'#13#10 +
      '      ,vw.id_caixa'#13#10'      ,vw.ds_caixa'#13#10'from VW_LST_USUARIO vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 528
    Top = 153
    object dtsUsuarioID_USUARIO: TIntegerField
      Tag = 1
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInKey]
    end
    object dtsUsuarioID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = []
    end
    object dtsUsuarioNM_LOGIN: TStringField
      FieldName = 'NM_LOGIN'
      ProviderFlags = []
      FixedChar = True
    end
    object dtsUsuarioFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsUsuarioFL_FRENTEDECAIXA: TStringField
      FieldName = 'FL_FRENTEDECAIXA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsUsuarioFL_FRENTEDECAIXAEXTENDIDO: TStringField
      FieldName = 'FL_FRENTEDECAIXAEXTENDIDO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsUsuarioNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      ProviderFlags = []
      Size = 100
    end
    object dtsUsuarioDS_SUBNIVEL: TStringField
      FieldName = 'DS_SUBNIVEL'
      ProviderFlags = []
      Size = 120
    end
    object dtsUsuarioID_CAIXA: TSmallintField
      FieldName = 'ID_CAIXA'
      ProviderFlags = []
    end
    object dtsUsuarioDS_CAIXA: TStringField
      FieldName = 'DS_CAIXA'
      ProviderFlags = []
      Size = 50
    end
  end
  object pvdUsuario: TsmProvider
    DataSet = dtsUsuario
    Options = [poAutoRefresh]
    OnGetTableName = pvdUsuarioGetTableName
    Left = 597
    Top = 153
  end
  object cltUsuario: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdUsuario'
    TabelaPrincipal = 'USUARIO'
    Left = 663
    Top = 153
    object cltUsuarioID_USUARIO: TcprIntegerField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInKey]
      DisplayFormat = '00000'
    end
    object cltUsuarioID_PESSOA: TcprIntegerField
      Alignment = taCenter
      FieldName = 'ID_PESSOA'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltUsuarioNM_LOGIN: TcprStringField
      FieldName = 'NM_LOGIN'
      ProviderFlags = []
      FixedChar = True
    end
    object cltUsuarioFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltUsuarioFL_FRENTEDECAIXA: TcprStringField
      FieldName = 'FL_FRENTEDECAIXA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltUsuarioFL_FRENTEDECAIXAEXTENDIDO: TcprStringField
      FieldName = 'FL_FRENTEDECAIXAEXTENDIDO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltUsuarioNM_PESSOA: TcprStringField
      FieldName = 'NM_PESSOA'
      ProviderFlags = []
      Size = 100
    end
    object cltUsuarioDS_SUBNIVEL: TcprStringField
      FieldName = 'DS_SUBNIVEL'
      ProviderFlags = []
      Size = 120
    end
    object cltUsuarioID_CAIXA: TcprSmallintField
      FieldName = 'ID_CAIXA'
      ProviderFlags = []
    end
    object cltUsuarioDS_CAIXA: TcprStringField
      FieldName = 'DS_CAIXA'
      ProviderFlags = []
      Size = 50
    end
  end
  object dtsTipoContrato: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado'#13#10'      ,tc.id_tipocontrato'#13#10'      ,tc.' +
      'ds_tipocontrato'#13#10'      ,case tc.fl_tipocontrato'#13#10'         when '#39 +
      'A'#39' then '#39'ALUGUEL'#39#13#10'         when '#39'M'#39' then '#39'MANUNTE'#199#195'O'#39#13#10'        ' +
      ' when '#39'E'#39' then '#39'EMPR'#201'STIMO'#39#13#10'         when '#39'P'#39' then '#39'PREST. SERV' +
      'I'#199'OS'#39#13#10'       end as fl_tipocontrato_extenso'#13#10'      ,case tc.fl_' +
      'tipovalor'#13#10'         when '#39'F'#39' then '#39'FIXO'#39#13#10'         when '#39'V'#39' then' +
      ' '#39'VARI'#193'VEL'#39#13#10'       end as fl_tipovalor_extenso'#13#10'      ,tc.id_su' +
      'bnivel_planoconta'#13#10'      ,s.ds_subnivel'#13#10'      ,tc.id_usuarioemp' +
      'resaeditando'#13#10'from TIPOCONTRATO tc'#13#10'join SUBNIVEL s on (s.id_sub' +
      'nivel = tc.id_subnivel_planoconta)'#13#10
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 528
    Top = 21
  end
  object pvdTipoContrato: TsmProvider
    DataSet = dtsTipoContrato
    Options = [poAutoRefresh]
    OnGetTableName = pvdTipoContratoGetTableName
    Left = 597
    Top = 21
  end
  object cltTipoContrato: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdTipoContrato'
    TabelaPrincipal = 'TIPOCONTRATO'
    Left = 663
    Top = 21
    object cltTipoContratoSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltTipoContratoID_TIPOCONTRATO: TcprSmallintField
      Tag = 1
      FieldName = 'ID_TIPOCONTRATO'
      ProviderFlags = []
      DisplayFormat = '000'
    end
    object cltTipoContratoDS_TIPOCONTRATO: TcprStringField
      FieldName = 'DS_TIPOCONTRATO'
      ProviderFlags = []
      Size = 80
    end
    object cltTipoContratoFL_TIPOCONTRATO_EXTENSO: TcprStringField
      FieldName = 'FL_TIPOCONTRATO_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 15
    end
    object cltTipoContratoFL_TIPOVALOR_EXTENSO: TcprStringField
      FieldName = 'FL_TIPOVALOR_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 8
    end
    object cltTipoContratoID_SUBNIVEL_PLANOCONTA: TcprIntegerField
      FieldName = 'ID_SUBNIVEL_PLANOCONTA'
      Required = True
      DisplayFormat = '00000'
    end
    object cltTipoContratoDS_SUBNIVEL: TcprStringField
      FieldName = 'DS_SUBNIVEL'
      ProviderFlags = []
      Size = 120
    end
    object cltTipoContratoID_USUARIOEMPRESAEDITANDO: TcprSmallintField
      FieldName = 'ID_USUARIOEMPRESAEDITANDO'
    end
  end
  object dtsNumerador: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado'#13#10'      ,cn.id_numerador'#13#10'      ,cn.ds_' +
      'numerador'#13#10'      ,cn.fl_principal'#13#10'from COPY_NUMERADOR cn'#13#10
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 40
    Top = 419
  end
  object pvdNumerador: TsmProvider
    DataSet = dtsNumerador
    Options = [poAutoRefresh]
    Left = 105
    Top = 419
  end
  object cltNumerador: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdNumerador'
    TabelaPrincipal = 'COPY_NUMERADOR'
    Left = 174
    Top = 419
    object cltNumeradorSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltNumeradorID_NUMERADOR: TcprSmallintField
      Tag = 1
      FieldName = 'ID_NUMERADOR'
      ProviderFlags = []
    end
    object cltNumeradorDS_NUMERADOR: TcprStringField
      FieldName = 'DS_NUMERADOR'
      ProviderFlags = []
      Size = 80
    end
    object cltNumeradorFL_PRINCIPAL: TcprStringField
      FieldName = 'FL_PRINCIPAL'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
  end
  object cltPessoaBens: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdPessoaBens'
    TabelaPrincipal = 'BEM'
    Left = 428
    Top = 61
    object cltPessoaBensSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaBensID_BEM: TcprIntegerField
      Tag = 1
      FieldName = 'ID_BEM'
      ProviderFlags = [pfInKey]
    end
    object cltPessoaBensID_EMPRESA: TcprSmallintField
      FieldName = 'ID_EMPRESA'
      ProviderFlags = []
    end
    object cltPessoaBensID_PESSOADONO: TcprIntegerField
      FieldName = 'ID_PESSOADONO'
      ProviderFlags = []
    end
    object cltPessoaBensID_SUBNIVEL: TcprSmallintField
      FieldName = 'ID_SUBNIVEL'
      ProviderFlags = []
    end
    object cltPessoaBensID_CONTRATO: TcprSmallintField
      FieldName = 'ID_CONTRATO'
      ProviderFlags = []
    end
    object cltPessoaBensFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaBensFL_ATIVO_EXTENSO: TcprStringField
      FieldName = 'FL_ATIVO_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 7
    end
    object cltPessoaBensFL_CONTRATADO: TcprStringField
      FieldName = 'FL_CONTRATADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaBensFL_CONTRATADO_EXTENSO: TcprStringField
      FieldName = 'FL_CONTRATADO_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltPessoaBensID_PESSOAMOTORISTA: TcprIntegerField
      FieldName = 'ID_PESSOAMOTORISTA'
      ProviderFlags = []
    end
    object cltPessoaBensNM_PESSOAMOTORISTA: TcprStringField
      FieldName = 'NM_PESSOAMOTORISTA'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaBensNR_ANOFABRICACAO: TcprSmallintField
      FieldName = 'NR_ANOFABRICACAO'
      ProviderFlags = []
    end
    object cltPessoaBensDS_COR: TcprStringField
      FieldName = 'DS_COR'
      ProviderFlags = []
    end
    object cltPessoaBensDS_PLACA: TcprStringField
      FieldName = 'DS_PLACA'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object cltPessoaBensDS_RENAVAM: TcprStringField
      FieldName = 'DS_RENAVAM'
      ProviderFlags = []
      Size = 30
    end
    object cltPessoaBensKM_COMPRA: TcprIntegerField
      FieldName = 'KM_COMPRA'
      ProviderFlags = []
    end
    object cltPessoaBensDS_CHASSI: TcprStringField
      FieldName = 'DS_CHASSI'
      ProviderFlags = []
      Size = 120
    end
    object cltPessoaBensNM_PESSOA: TcprStringField
      FieldName = 'NM_PESSOA'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaBensDS_EMPRESAS: TcprStringField
      FieldName = 'DS_EMPRESAS'
      ProviderFlags = []
      Size = 500
    end
    object cltPessoaBensDS_EMAIL: TcprStringField
      FieldName = 'DS_EMAIL'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaBensDONO: TcprStringField
      FieldName = 'DONO'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaBensDS_SUBNIVEL: TcprStringField
      FieldName = 'DS_SUBNIVEL'
      ProviderFlags = []
      Size = 120
    end
    object cltPessoaBensDS_TIPOCONTRATO_EXTENSO: TcprStringField
      FieldName = 'DS_TIPOCONTRATO_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 8
    end
    object cltPessoaBensTEMLIGACAO_ITEM_EXTENSO: TcprStringField
      FieldName = 'TEMLIGACAO_ITEM_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaBensDS_TIPOCONTRATO: TcprStringField
      FieldName = 'DS_TIPOCONTRATO'
      ProviderFlags = []
      Size = 80
    end
    object cltPessoaBensID_BEM_MOVEL_TIPO: TcprIntegerField
      FieldName = 'ID_BEM_MOVEL_TIPO'
      ProviderFlags = []
    end
    object cltPessoaBensDS_BEM_MOVEL_TIPO: TcprStringField
      FieldName = 'DS_BEM_MOVEL_TIPO'
      ProviderFlags = []
    end
    object cltPessoaBensDS_OBSERVACAO: TcprMemoField
      FieldName = 'DS_OBSERVACAO'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object cltPessoaBensDS_CARACTERISTICA: TcprStringField
      FieldName = 'DS_CARACTERISTICA'
      ProviderFlags = []
      Size = 250
    end
    object cltPessoaBensDS_SETOR: TcprStringField
      FieldName = 'DS_SETOR'
      ProviderFlags = []
      Size = 50
    end
    object cltPessoaBensNM_CONTATO: TcprStringField
      FieldName = 'NM_CONTATO'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaBensDT_CADASTRO: TcprSQLTimeStampField
      FieldName = 'DT_CADASTRO'
      ProviderFlags = []
    end
    object cltPessoaBensFL_TRANSFERE_PROPRIETARIO: TcprStringField
      FieldName = 'FL_TRANSFERE_PROPRIETARIO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
  end
  object pvdPessoaBens: TsmProvider
    DataSet = dtsPessoaBens
    Options = [poAutoRefresh]
    OnGetTableName = pvdPessoaBensGetTableName
    Left = 357
    Top = 61
  end
  object dtsPessoaBens: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado, vw.id_bem, vw.id_empresa, vw.id_pesso' +
      'adono, vw.id_subnivel, vw.id_contrato, vw.fl_ativo, vw.fl_ativo_' +
      'extenso,'#13#10'       vw.fl_contratado, vw.fl_contratado_extenso, vw.' +
      'id_pessoamotorista, vw.nm_pessoamotorista, vw.nr_anofabricacao,'#13 +
      #10'       vw.ds_cor, vw.ds_placa, vw.ds_renavam, vw.km_compra, vw.' +
      'ds_chassi, vw.nm_pessoa, vw.ds_empresas, vw.ds_email,'#13#10'       vw' +
      '.dono, vw.ds_subnivel, vw.ds_tipocontrato_extenso, vw.temligacao' +
      '_item_extenso, vw.ds_tipocontrato,'#13#10'       vw.id_bem_movel_tipo,' +
      ' vw.ds_bem_movel_tipo, vw.ds_observacao, vw.ds_caracteristica, v' +
      'w.ds_setor,'#13#10'       vw.nm_contato, vw.dt_cadastro, vw.fl_transfe' +
      're_proprietario'#13#10'from VW_LST_PESSOA_BENS vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'BEM'
    Left = 285
    Top = 61
    object dtsPessoaBensSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaBensID_BEM: TIntegerField
      FieldName = 'ID_BEM'
      ProviderFlags = []
    end
    object dtsPessoaBensID_EMPRESA: TSmallintField
      FieldName = 'ID_EMPRESA'
      ProviderFlags = []
    end
    object dtsPessoaBensID_PESSOADONO: TIntegerField
      FieldName = 'ID_PESSOADONO'
      ProviderFlags = []
    end
    object dtsPessoaBensID_SUBNIVEL: TSmallintField
      FieldName = 'ID_SUBNIVEL'
      ProviderFlags = []
    end
    object dtsPessoaBensID_CONTRATO: TSmallintField
      FieldName = 'ID_CONTRATO'
      ProviderFlags = []
    end
    object dtsPessoaBensFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaBensFL_ATIVO_EXTENSO: TStringField
      FieldName = 'FL_ATIVO_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 7
    end
    object dtsPessoaBensFL_CONTRATADO: TStringField
      FieldName = 'FL_CONTRATADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaBensFL_CONTRATADO_EXTENSO: TStringField
      FieldName = 'FL_CONTRATADO_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsPessoaBensID_PESSOAMOTORISTA: TIntegerField
      FieldName = 'ID_PESSOAMOTORISTA'
      ProviderFlags = []
    end
    object dtsPessoaBensNM_PESSOAMOTORISTA: TStringField
      FieldName = 'NM_PESSOAMOTORISTA'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaBensNR_ANOFABRICACAO: TSmallintField
      FieldName = 'NR_ANOFABRICACAO'
      ProviderFlags = []
    end
    object dtsPessoaBensDS_COR: TStringField
      FieldName = 'DS_COR'
      ProviderFlags = []
    end
    object dtsPessoaBensDS_PLACA: TStringField
      FieldName = 'DS_PLACA'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object dtsPessoaBensDS_RENAVAM: TStringField
      FieldName = 'DS_RENAVAM'
      ProviderFlags = []
      Size = 30
    end
    object dtsPessoaBensKM_COMPRA: TIntegerField
      FieldName = 'KM_COMPRA'
      ProviderFlags = []
    end
    object dtsPessoaBensDS_CHASSI: TStringField
      FieldName = 'DS_CHASSI'
      ProviderFlags = []
      Size = 120
    end
    object dtsPessoaBensNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaBensDS_EMPRESAS: TStringField
      FieldName = 'DS_EMPRESAS'
      ProviderFlags = []
      Size = 500
    end
    object dtsPessoaBensDS_EMAIL: TStringField
      FieldName = 'DS_EMAIL'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaBensDONO: TStringField
      FieldName = 'DONO'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaBensDS_SUBNIVEL: TStringField
      FieldName = 'DS_SUBNIVEL'
      ProviderFlags = []
      Size = 120
    end
    object dtsPessoaBensDS_TIPOCONTRATO_EXTENSO: TStringField
      FieldName = 'DS_TIPOCONTRATO_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 8
    end
    object dtsPessoaBensTEMLIGACAO_ITEM_EXTENSO: TStringField
      FieldName = 'TEMLIGACAO_ITEM_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaBensDS_TIPOCONTRATO: TStringField
      FieldName = 'DS_TIPOCONTRATO'
      ProviderFlags = []
      Size = 80
    end
    object dtsPessoaBensID_BEM_MOVEL_TIPO: TIntegerField
      FieldName = 'ID_BEM_MOVEL_TIPO'
      ProviderFlags = []
    end
    object dtsPessoaBensDS_BEM_MOVEL_TIPO: TStringField
      FieldName = 'DS_BEM_MOVEL_TIPO'
      ProviderFlags = []
    end
    object dtsPessoaBensDS_OBSERVACAO: TMemoField
      FieldName = 'DS_OBSERVACAO'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object dtsPessoaBensDS_CARACTERISTICA: TStringField
      FieldName = 'DS_CARACTERISTICA'
      ProviderFlags = []
      Size = 250
    end
    object dtsPessoaBensDS_SETOR: TStringField
      FieldName = 'DS_SETOR'
      ProviderFlags = []
      Size = 50
    end
    object dtsPessoaBensNM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaBensDT_CADASTRO: TSQLTimeStampField
      FieldName = 'DT_CADASTRO'
      ProviderFlags = []
    end
    object dtsPessoaBensFL_TRANSFERE_PROPRIETARIO: TStringField
      FieldName = 'FL_TRANSFERE_PROPRIETARIO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
  end
  object cltEmpresaConsulta: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdEmpresaConsulta'
    TabelaPrincipal = 'EMPRESA'
    Left = 174
    Top = 287
    object cltEmpresaConsultaID_EMPRESA: TcprIntegerField
      Tag = 1
      FieldName = 'ID_EMPRESA'
      Required = True
      DisplayFormat = '000'
    end
    object cltEmpresaConsultaDS_EMPRESA: TcprStringField
      FieldName = 'DS_EMPRESA'
      Required = True
      Size = 30
    end
    object cltEmpresaConsultaID_PESSOA: TcprIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
      DisplayFormat = '00000'
    end
    object cltEmpresaConsultaNMPESSOA: TcprStringField
      FieldName = 'NMPESSOA'
      ProviderFlags = []
      Size = 100
    end
    object cltEmpresaConsultaID_EMPRESA_PAI: TcprIntegerField
      FieldName = 'ID_EMPRESA_PAI'
      Required = True
      DisplayFormat = '00000'
    end
    object cltEmpresaConsultaNOMEMATRIZ: TcprStringField
      FieldName = 'NOMEMATRIZ'
      ProviderFlags = []
      Size = 100
    end
    object cltEmpresaConsultaFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object cltEmpresaConsultaID_USUARIOEMPRESAEDITANDO: TcprSmallintField
      FieldName = 'ID_USUARIOEMPRESAEDITANDO'
    end
  end
  object pvdEmpresaConsulta: TsmProvider
    DataSet = dtsEmpresaConsulta
    Options = [poAutoRefresh]
    Left = 105
    Top = 287
  end
  object dtsEmpresaConsulta: TsmDataset
    CommandText = 
      'select e.id_empresa, '#13#10'       e.ds_empresa, '#13#10'       e.id_pessoa' +
      ', '#13#10'       p.nm_pessoa as nmpessoa, '#13#10'       e.id_empresa_pai,'#13#10 +
      '       pm.nm_pessoa as nomematriz,'#13#10'       e.fl_ativo,'#13#10'       e' +
      '.id_usuarioempresaeditando'#13#10'from EMPRESA e'#13#10'left join PESSOA pm ' +
      'on(pm.id_pessoa = e.id_empresa_pai)'#13#10'join PESSOA p on(p.id_pesso' +
      'a = e.id_pessoa)'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 40
    Top = 287
    object dtsEmpresaConsultaID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Required = True
    end
    object dtsEmpresaConsultaDS_EMPRESA: TStringField
      FieldName = 'DS_EMPRESA'
      Required = True
      Size = 30
    end
    object dtsEmpresaConsultaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object dtsEmpresaConsultaNMPESSOA: TStringField
      FieldName = 'NMPESSOA'
      ProviderFlags = []
      Size = 100
    end
    object dtsEmpresaConsultaID_EMPRESA_PAI: TIntegerField
      FieldName = 'ID_EMPRESA_PAI'
      Required = True
    end
    object dtsEmpresaConsultaNOMEMATRIZ: TStringField
      FieldName = 'NOMEMATRIZ'
      ProviderFlags = []
      Size = 100
    end
    object dtsEmpresaConsultaFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object dtsEmpresaConsultaID_USUARIOEMPRESAEDITANDO: TSmallintField
      FieldName = 'ID_USUARIOEMPRESAEDITANDO'
    end
  end
  object dtsRamoAtividade: TsmDataset
    CommandText = 
      'select'#13#10#39'N'#39' as selecionado,  '#13#10'ra.id_ramoatividade,'#13#10'ra.ds_ramoa' +
      'tividade'#13#10'from RAMOATIVIDADE ra'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Con
    Left = 285
    Top = 416
    object dtsRamoAtividadeSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object dtsRamoAtividadeID_RAMOATIVIDADE: TcprSmallintField
      Tag = 1
      FieldName = 'ID_RAMOATIVIDADE'
      Required = True
    end
    object dtsRamoAtividadeDS_RAMOATIVIDADE: TcprStringField
      FieldName = 'DS_RAMOATIVIDADE'
      Required = True
      Size = 100
    end
  end
  object pvdRamoAtividade: TsmProvider
    DataSet = dtsRamoAtividade
    Options = [poAutoRefresh]
    Left = 357
    Top = 416
  end
  object cltRamoAtividade: TsmClient
    Aggregates = <>
    Params = <>
    ProviderName = 'pvdRamoAtividade'
    TabelaPrincipal = 'RAMOATIVIDADE'
    Left = 428
    Top = 416
    object cltRamoAtividadeSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object cltRamoAtividadeID_RAMOATIVIDADE: TcprSmallintField
      Tag = 1
      FieldName = 'ID_RAMOATIVIDADE'
      Required = True
      DisplayFormat = '00000'
    end
    object cltRamoAtividadeDS_RAMOATIVIDADE: TcprStringField
      FieldName = 'DS_RAMOATIVIDADE'
      Required = True
      Size = 100
    end
  end
  object dtsQuadroMemorandos: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado'#13#10'      ,vw.id_memorando'#13#10'      ,vw.id_' +
      'usuarioenviou'#13#10'      ,vw.ds_memorando'#13#10'      ,vw.id_usuarioreceb' +
      'eu'#13#10'      ,vw.dt_envio'#13#10'      ,vw.dt_recebimento'#13#10'      ,vw.fl_r' +
      'ecebida'#13#10'      ,vw.fl_statusextenso'#13#10'      ,vw.ds_assunto'#13#10'     ' +
      ' ,vw.ip_maquinaenviou'#13#10'      ,vw.ip_maquinarecebeu'#13#10'      ,vw.fl' +
      '_deletado'#13#10'      ,vw.usuarioenviou'#13#10'      ,vw.usuariorecebeu'#13#10'  ' +
      '    ,vw.fl_deletadorecebeu'#13#10'from VW_LST_QUADROMEMORANDO vw'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Con
    Left = 285
    Top = 375
    object dtsQuadroMemorandosSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsQuadroMemorandosID_MEMORANDO: TIntegerField
      FieldName = 'ID_MEMORANDO'
      ProviderFlags = []
    end
    object dtsQuadroMemorandosID_USUARIOENVIOU: TSmallintField
      FieldName = 'ID_USUARIOENVIOU'
      ProviderFlags = []
    end
    object dtsQuadroMemorandosDS_MEMORANDO: TMemoField
      FieldName = 'DS_MEMORANDO'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object dtsQuadroMemorandosID_USUARIORECEBEU: TSmallintField
      FieldName = 'ID_USUARIORECEBEU'
      ProviderFlags = []
    end
    object dtsQuadroMemorandosDT_ENVIO: TSQLTimeStampField
      FieldName = 'DT_ENVIO'
      ProviderFlags = []
    end
    object dtsQuadroMemorandosDT_RECEBIMENTO: TSQLTimeStampField
      FieldName = 'DT_RECEBIMENTO'
      ProviderFlags = []
    end
    object dtsQuadroMemorandosFL_RECEBIDA: TStringField
      FieldName = 'FL_RECEBIDA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsQuadroMemorandosFL_STATUSEXTENSO: TStringField
      FieldName = 'FL_STATUSEXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsQuadroMemorandosDS_ASSUNTO: TStringField
      FieldName = 'DS_ASSUNTO'
      ProviderFlags = []
      Size = 100
    end
    object dtsQuadroMemorandosIP_MAQUINAENVIOU: TStringField
      FieldName = 'IP_MAQUINAENVIOU'
      ProviderFlags = []
    end
    object dtsQuadroMemorandosIP_MAQUINARECEBEU: TStringField
      FieldName = 'IP_MAQUINARECEBEU'
      ProviderFlags = []
    end
    object dtsQuadroMemorandosFL_DELETADO: TStringField
      FieldName = 'FL_DELETADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsQuadroMemorandosUSUARIOENVIOU: TStringField
      FieldName = 'USUARIOENVIOU'
      ProviderFlags = []
      Size = 100
    end
    object dtsQuadroMemorandosUSUARIORECEBEU: TStringField
      FieldName = 'USUARIORECEBEU'
      ProviderFlags = []
      Size = 100
    end
    object dtsQuadroMemorandosFL_DELETADORECEBEU: TStringField
      FieldName = 'FL_DELETADORECEBEU'
      FixedChar = True
      Size = 1
    end
  end
  object pvdQuadroMemorandos: TsmProvider
    DataSet = dtsQuadroMemorandos
    OnGetTableName = pvdQuadroMemorandosGetTableName
    Left = 357
    Top = 375
  end
  object cltQuadroMemorandos: TsmClient
    Aggregates = <>
    Params = <>
    ProviderName = 'pvdQuadroMemorandos'
    TabelaPrincipal = 'MEMORANDO'
    Left = 428
    Top = 373
    object cltQuadroMemorandosSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltQuadroMemorandosID_MEMORANDO: TcprIntegerField
      Tag = 1
      FieldName = 'ID_MEMORANDO'
      ProviderFlags = [pfInKey]
    end
    object cltQuadroMemorandosID_USUARIOENVIOU: TcprSmallintField
      FieldName = 'ID_USUARIOENVIOU'
      ProviderFlags = []
    end
    object cltQuadroMemorandosDS_MEMORANDO: TcprMemoField
      FieldName = 'DS_MEMORANDO'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object cltQuadroMemorandosID_USUARIORECEBEU: TcprSmallintField
      FieldName = 'ID_USUARIORECEBEU'
      ProviderFlags = []
    end
    object cltQuadroMemorandosDT_ENVIO: TcprSQLTimeStampField
      FieldName = 'DT_ENVIO'
      ProviderFlags = []
    end
    object cltQuadroMemorandosDT_RECEBIMENTO: TcprSQLTimeStampField
      FieldName = 'DT_RECEBIMENTO'
      ProviderFlags = []
    end
    object cltQuadroMemorandosFL_RECEBIDA: TcprStringField
      FieldName = 'FL_RECEBIDA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltQuadroMemorandosFL_STATUSEXTENSO: TcprStringField
      FieldName = 'FL_STATUSEXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltQuadroMemorandosDS_ASSUNTO: TcprStringField
      FieldName = 'DS_ASSUNTO'
      ProviderFlags = []
      Size = 100
    end
    object cltQuadroMemorandosIP_MAQUINAENVIOU: TcprStringField
      FieldName = 'IP_MAQUINAENVIOU'
      ProviderFlags = []
    end
    object cltQuadroMemorandosIP_MAQUINARECEBEU: TcprStringField
      FieldName = 'IP_MAQUINARECEBEU'
      ProviderFlags = []
    end
    object cltQuadroMemorandosFL_DELETADO: TcprStringField
      FieldName = 'FL_DELETADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltQuadroMemorandosUSUARIOENVIOU: TcprStringField
      FieldName = 'USUARIOENVIOU'
      ProviderFlags = []
      Size = 100
    end
    object cltQuadroMemorandosUSUARIORECEBEU: TcprStringField
      FieldName = 'USUARIORECEBEU'
      ProviderFlags = []
      Size = 100
    end
    object cltQuadroMemorandosFL_DELETADORECEBEU: TcprStringField
      FieldName = 'FL_DELETADORECEBEU'
      FixedChar = True
      Size = 1
    end
  end
  object cltPessoaMovimento: TsmClient
    Aggregates = <>
    Params = <>
    ProviderName = 'pvdPessoaMovimento'
    Left = 428
    Top = 288
    object cltPessoaMovimentoFL_TIPO: TcprStringField
      Alignment = taCenter
      FieldName = 'FL_TIPO'
      FixedChar = True
      Size = 1
    end
    object cltPessoaMovimentoFL_ORIGEM: TcprStringField
      Alignment = taCenter
      FieldName = 'FL_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object cltPessoaMovimentoNR_DOCUMENTO: TcprIntegerField
      Alignment = taCenter
      FieldName = 'NR_DOCUMENTO'
      DisplayFormat = '00000'
    end
    object cltPessoaMovimentoVL_TOTAL: TcprFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '#,##0.00'
      cprNroCasaDecimal = 0
    end
    object cltPessoaMovimentoFL_STATUS: TcprStringField
      FieldName = 'FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object cltPessoaMovimentoNM_VENDEDOR: TcprStringField
      FieldName = 'NM_VENDEDOR'
      Size = 100
    end
    object cltPessoaMovimentoFL_STATUS_EXTENSO: TcprStringField
      FieldName = 'FL_STATUS_EXTENSO'
      FixedChar = True
      Size = 10
    end
    object cltPessoaMovimentoDT_DOCUMENTO: TcprDateField
      FieldName = 'DT_DOCUMENTO'
    end
    object cltPessoaMovimentoEQUIPAMENTO: TcprStringField
      FieldName = 'EQUIPAMENTO'
      Size = 120
    end
    object cltPessoaMovimentoORIGEM: TcprStringField
      FieldName = 'ORIGEM'
      FixedChar = True
      Size = 3
    end
    object cltPessoaMovimentoCODIGOEMPRESA: TcprSmallintField
      FieldName = 'CODIGOEMPRESA'
      DisplayFormat = '000'
    end
    object cltPessoaMovimentoDS_EQUIPAMENTO: TcprStringField
      FieldName = 'DS_EQUIPAMENTO'
      Size = 100
    end
    object cltPessoaMovimentoNR_DOCUMENTO_DOC: TcprIntegerField
      FieldName = 'NR_DOCUMENTO_DOC'
    end
    object cltPessoaMovimentoID_SISTEMA_ANTIGO: TcprIntegerField
      FieldName = 'ID_SISTEMA_ANTIGO'
    end
  end
  object pvdPessoaMovimento: TsmProvider
    DataSet = dtsPessoaMovimento
    Options = [poAutoRefresh]
    Left = 357
    Top = 288
  end
  object dtsPessoaMovimento: TsmDataset
    CommandText = 'select * from proc_pessoamov(:codigopessoa, :codigoempresa)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codigopessoa'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigoempresa'
        ParamType = ptInput
      end>
    SQLConnection = Con
    Left = 285
    Top = 288
  end
  object dtsPessoaBensConsulta: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado'#13#10'      ,vw.id_bem'#13#10'      ,vw.ds_bem'#13#10' ' +
      '     ,vw.id_pessoa'#13#10'      ,vw.id_pessoadono'#13#10'      ,vw.id_subniv' +
      'el'#13#10'      ,vw.id_contrato'#13#10'      ,vw.fl_ativo'#13#10'      ,vw.fl_ativ' +
      'o_extenso'#13#10'      ,vw.fl_contratado'#13#10'      ,vw.fl_contratado_exte' +
      'nso'#13#10'      ,vw.id_pessoamotorista'#13#10'      ,vw.nm_pessoamotorista'#13 +
      #10'      ,vw.nr_anofabricacao'#13#10'      ,vw.ds_cor'#13#10'      ,vw.ds_plac' +
      'a'#13#10'      ,vw.ds_renavam'#13#10'      ,vw.km_compra'#13#10'      ,vw.ds_chass' +
      'i'#13#10'      ,vw.nm_pessoa'#13#10'      ,vw.ds_empresas'#13#10'      ,vw.ds_emai' +
      'l'#13#10'      ,vw.dono'#13#10'      ,vw.ds_subnivel'#13#10'      ,vw.ds_tipocontr' +
      'ato_extenso'#13#10'      ,vw.temligacao_item_extenso'#13#10'      ,vw.ds_tip' +
      'ocontrato'#13#10'      ,vw.id_tipoveiculo'#13#10'      ,vw.ds_tipoveiculo'#13#10' ' +
      '     ,vw.ds_observacao'#13#10'      ,vw.ds_computadorcaracteristica'#13#10' ' +
      '     ,vw.ds_setor'#13#10'      ,vw.nm_contato'#13#10'      ,vw.dt_cadastro'#13#10 +
      '      ,vw.fl_status'#13#10'      ,vw.ds_numero_serial'#13#10'      ,vw.ds_co' +
      'digo_barras'#13#10'      ,vw.ds_codigo_patrimonio'#13#10'from vw_lst_pessoa_' +
      'bens_consulta vw'#13#10
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'BEM'
    Left = 285
    Top = 108
    object dtsPessoaBensConsultaSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaBensConsultaID_BEM: TIntegerField
      FieldName = 'ID_BEM'
      ProviderFlags = []
    end
    object dtsPessoaBensConsultaDS_BEM: TStringField
      FieldName = 'DS_BEM'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaBensConsultaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = []
    end
    object dtsPessoaBensConsultaID_PESSOADONO: TIntegerField
      FieldName = 'ID_PESSOADONO'
      ProviderFlags = []
    end
    object dtsPessoaBensConsultaID_SUBNIVEL: TSmallintField
      FieldName = 'ID_SUBNIVEL'
      ProviderFlags = []
    end
    object dtsPessoaBensConsultaID_CONTRATO: TSmallintField
      FieldName = 'ID_CONTRATO'
      ProviderFlags = []
    end
    object dtsPessoaBensConsultaFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaBensConsultaFL_ATIVO_EXTENSO: TStringField
      FieldName = 'FL_ATIVO_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 7
    end
    object dtsPessoaBensConsultaFL_CONTRATADO: TStringField
      FieldName = 'FL_CONTRATADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaBensConsultaFL_CONTRATADO_EXTENSO: TStringField
      FieldName = 'FL_CONTRATADO_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsPessoaBensConsultaID_PESSOAMOTORISTA: TIntegerField
      FieldName = 'ID_PESSOAMOTORISTA'
      ProviderFlags = []
    end
    object dtsPessoaBensConsultaNM_PESSOAMOTORISTA: TStringField
      FieldName = 'NM_PESSOAMOTORISTA'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaBensConsultaNR_ANOFABRICACAO: TSmallintField
      FieldName = 'NR_ANOFABRICACAO'
      ProviderFlags = []
    end
    object dtsPessoaBensConsultaDS_COR: TStringField
      FieldName = 'DS_COR'
      ProviderFlags = []
    end
    object dtsPessoaBensConsultaDS_PLACA: TStringField
      FieldName = 'DS_PLACA'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object dtsPessoaBensConsultaDS_RENAVAM: TStringField
      FieldName = 'DS_RENAVAM'
      ProviderFlags = []
      Size = 30
    end
    object dtsPessoaBensConsultaKM_COMPRA: TIntegerField
      FieldName = 'KM_COMPRA'
      ProviderFlags = []
    end
    object dtsPessoaBensConsultaDS_CHASSI: TStringField
      FieldName = 'DS_CHASSI'
      ProviderFlags = []
      Size = 120
    end
    object dtsPessoaBensConsultaNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaBensConsultaDS_EMPRESAS: TStringField
      FieldName = 'DS_EMPRESAS'
      ProviderFlags = []
      Size = 500
    end
    object dtsPessoaBensConsultaDS_EMAIL: TStringField
      FieldName = 'DS_EMAIL'
      ProviderFlags = []
      Size = 5000
    end
    object dtsPessoaBensConsultaDONO: TStringField
      FieldName = 'DONO'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaBensConsultaDS_SUBNIVEL: TStringField
      FieldName = 'DS_SUBNIVEL'
      ProviderFlags = []
      Size = 120
    end
    object dtsPessoaBensConsultaDS_TIPOCONTRATO_EXTENSO: TStringField
      FieldName = 'DS_TIPOCONTRATO_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object dtsPessoaBensConsultaTEMLIGACAO_ITEM_EXTENSO: TStringField
      FieldName = 'TEMLIGACAO_ITEM_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaBensConsultaDS_TIPOCONTRATO: TStringField
      FieldName = 'DS_TIPOCONTRATO'
      ProviderFlags = []
      Size = 80
    end
    object dtsPessoaBensConsultaID_TIPOVEICULO: TIntegerField
      FieldName = 'ID_TIPOVEICULO'
      ProviderFlags = []
    end
    object dtsPessoaBensConsultaDS_TIPOVEICULO: TStringField
      FieldName = 'DS_TIPOVEICULO'
      ProviderFlags = []
    end
    object dtsPessoaBensConsultaDS_OBSERVACAO: TMemoField
      FieldName = 'DS_OBSERVACAO'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object dtsPessoaBensConsultaDS_COMPUTADORCARACTERISTICA: TStringField
      FieldName = 'DS_COMPUTADORCARACTERISTICA'
      ProviderFlags = []
      Size = 250
    end
    object dtsPessoaBensConsultaDS_SETOR: TStringField
      FieldName = 'DS_SETOR'
      ProviderFlags = []
      Size = 50
    end
    object dtsPessoaBensConsultaNM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaBensConsultaDT_CADASTRO: TSQLTimeStampField
      FieldName = 'DT_CADASTRO'
      ProviderFlags = []
    end
    object dtsPessoaBensConsultaFL_STATUS: TStringField
      FieldName = 'FL_STATUS'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaBensConsultaDS_NUMERO_SERIAL: TStringField
      FieldName = 'DS_NUMERO_SERIAL'
      ProviderFlags = []
      Size = 60
    end
    object dtsPessoaBensConsultaDS_CODIGO_BARRAS: TStringField
      FieldName = 'DS_CODIGO_BARRAS'
      ProviderFlags = []
      Size = 60
    end
    object dtsPessoaBensConsultaDS_CODIGO_PATRIMONIO: TStringField
      FieldName = 'DS_CODIGO_PATRIMONIO'
      ProviderFlags = []
      Size = 50
    end
  end
  object pvdPessoaBensConsulta: TsmProvider
    DataSet = dtsPessoaBensConsulta
    Options = [poAutoRefresh]
    UpdateMode = upWhereKeyOnly
    OnGetTableName = pvdPessoaBensConsultaGetTableName
    Left = 357
    Top = 108
  end
  object cltPessoaBensConsulta: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdPessoaBensConsulta'
    TabelaPrincipal = 'BEM'
    Left = 428
    Top = 108
    object cltPessoaBensConsultaSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaBensConsultaID_BEM: TcprIntegerField
      Tag = 1
      FieldName = 'ID_BEM'
      ProviderFlags = [pfInKey]
    end
    object cltPessoaBensConsultaDS_BEM: TcprStringField
      FieldName = 'DS_BEM'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaBensConsultaID_PESSOA: TcprIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = []
    end
    object cltPessoaBensConsultaID_PESSOADONO: TcprIntegerField
      FieldName = 'ID_PESSOADONO'
      ProviderFlags = []
    end
    object cltPessoaBensConsultaID_SUBNIVEL: TcprSmallintField
      FieldName = 'ID_SUBNIVEL'
      ProviderFlags = []
    end
    object cltPessoaBensConsultaID_CONTRATO: TcprSmallintField
      FieldName = 'ID_CONTRATO'
      ProviderFlags = []
    end
    object cltPessoaBensConsultaFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaBensConsultaFL_ATIVO_EXTENSO: TcprStringField
      FieldName = 'FL_ATIVO_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 7
    end
    object cltPessoaBensConsultaFL_CONTRATADO: TcprStringField
      FieldName = 'FL_CONTRATADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaBensConsultaFL_CONTRATADO_EXTENSO: TcprStringField
      FieldName = 'FL_CONTRATADO_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltPessoaBensConsultaID_PESSOAMOTORISTA: TcprIntegerField
      FieldName = 'ID_PESSOAMOTORISTA'
      ProviderFlags = []
    end
    object cltPessoaBensConsultaNM_PESSOAMOTORISTA: TcprStringField
      FieldName = 'NM_PESSOAMOTORISTA'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaBensConsultaNR_ANOFABRICACAO: TcprSmallintField
      FieldName = 'NR_ANOFABRICACAO'
      ProviderFlags = []
    end
    object cltPessoaBensConsultaDS_COR: TcprStringField
      FieldName = 'DS_COR'
      ProviderFlags = []
    end
    object cltPessoaBensConsultaDS_PLACA: TcprStringField
      FieldName = 'DS_PLACA'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object cltPessoaBensConsultaDS_RENAVAM: TcprStringField
      FieldName = 'DS_RENAVAM'
      ProviderFlags = []
      Size = 30
    end
    object cltPessoaBensConsultaKM_COMPRA: TcprIntegerField
      FieldName = 'KM_COMPRA'
      ProviderFlags = []
    end
    object cltPessoaBensConsultaDS_CHASSI: TcprStringField
      FieldName = 'DS_CHASSI'
      ProviderFlags = []
      Size = 120
    end
    object cltPessoaBensConsultaNM_PESSOA: TcprStringField
      FieldName = 'NM_PESSOA'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaBensConsultaDS_EMPRESAS: TcprStringField
      FieldName = 'DS_EMPRESAS'
      ProviderFlags = []
      Size = 500
    end
    object cltPessoaBensConsultaDS_EMAIL: TcprStringField
      FieldName = 'DS_EMAIL'
      ProviderFlags = []
      Size = 5000
    end
    object cltPessoaBensConsultaDONO: TcprStringField
      FieldName = 'DONO'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaBensConsultaDS_SUBNIVEL: TcprStringField
      FieldName = 'DS_SUBNIVEL'
      ProviderFlags = []
      Size = 120
    end
    object cltPessoaBensConsultaDS_TIPOCONTRATO_EXTENSO: TcprStringField
      FieldName = 'DS_TIPOCONTRATO_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object cltPessoaBensConsultaTEMLIGACAO_ITEM_EXTENSO: TcprStringField
      FieldName = 'TEMLIGACAO_ITEM_EXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaBensConsultaDS_TIPOCONTRATO: TcprStringField
      FieldName = 'DS_TIPOCONTRATO'
      ProviderFlags = []
      Size = 80
    end
    object cltPessoaBensConsultaID_TIPOVEICULO: TcprIntegerField
      FieldName = 'ID_TIPOVEICULO'
      ProviderFlags = []
    end
    object cltPessoaBensConsultaDS_TIPOVEICULO: TcprStringField
      FieldName = 'DS_TIPOVEICULO'
      ProviderFlags = []
    end
    object cltPessoaBensConsultaDS_OBSERVACAO: TcprMemoField
      FieldName = 'DS_OBSERVACAO'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object cltPessoaBensConsultaDS_COMPUTADORCARACTERISTICA: TcprStringField
      FieldName = 'DS_COMPUTADORCARACTERISTICA'
      ProviderFlags = []
      Size = 250
    end
    object cltPessoaBensConsultaDS_SETOR: TcprStringField
      FieldName = 'DS_SETOR'
      ProviderFlags = []
      Size = 50
    end
    object cltPessoaBensConsultaNM_CONTATO: TcprStringField
      FieldName = 'NM_CONTATO'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaBensConsultaDT_CADASTRO: TcprSQLTimeStampField
      FieldName = 'DT_CADASTRO'
      ProviderFlags = []
    end
    object cltPessoaBensConsultaFL_STATUS: TcprStringField
      FieldName = 'FL_STATUS'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaBensConsultaDS_NUMERO_SERIAL: TcprStringField
      FieldName = 'DS_NUMERO_SERIAL'
      ProviderFlags = []
      Size = 60
    end
    object cltPessoaBensConsultaDS_CODIGO_BARRAS: TcprStringField
      FieldName = 'DS_CODIGO_BARRAS'
      ProviderFlags = []
      Size = 60
    end
    object cltPessoaBensConsultaDS_CODIGO_PATRIMONIO: TcprStringField
      FieldName = 'DS_CODIGO_PATRIMONIO'
      ProviderFlags = []
      Size = 50
    end
  end
  object dtsUF: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado,'#13#10'       uf.id_uf,'#13#10'       uf.ds_sigla' +
      ','#13#10'       uf.nm_uf,'#13#10'       uf.id_pais,'#13#10'       p.ds_sigla as si' +
      'glapais,'#13#10'       p.nm_pais,'#13#10'       uf.id_usuarioempresaeditando' +
      #13#10'from UF'#13#10'join PAIS p on (p.id_pais = uf.id_pais)'#13#10
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 528
    Top = 65
    object dtsUFSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object dtsUFID_UF: TSmallintField
      FieldName = 'ID_UF'
      Required = True
    end
    object dtsUFDS_SIGLA: TStringField
      FieldName = 'DS_SIGLA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object dtsUFNM_UF: TStringField
      FieldName = 'NM_UF'
      Required = True
      Size = 100
    end
    object dtsUFID_PAIS: TSmallintField
      FieldName = 'ID_PAIS'
      Required = True
    end
    object dtsUFNM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      ProviderFlags = []
      Size = 50
    end
    object dtsUFID_USUARIOEMPRESAEDITANDO: TSmallintField
      FieldName = 'ID_USUARIOEMPRESAEDITANDO'
    end
    object dtsUFSIGLAPAIS: TStringField
      FieldName = 'SIGLAPAIS'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
  end
  object pvdUF: TsmProvider
    DataSet = dtsUF
    Options = [poAutoRefresh]
    OnGetTableName = pvdUFGetTableName
    Left = 597
    Top = 65
  end
  object cltUF: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdUF'
    TabelaPrincipal = 'UF'
    Left = 663
    Top = 65
    object cltUFSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object cltUFID_UF: TcprSmallintField
      Tag = 1
      FieldName = 'ID_UF'
      Required = True
      DisplayFormat = '0000'
    end
    object cltUFDS_SIGLA: TcprStringField
      FieldName = 'DS_SIGLA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cltUFNM_UF: TcprStringField
      FieldName = 'NM_UF'
      Required = True
      Size = 100
    end
    object cltUFID_PAIS: TcprSmallintField
      FieldName = 'ID_PAIS'
      Required = True
      DisplayFormat = '0000'
    end
    object cltUFNM_PAIS: TcprStringField
      FieldName = 'NM_PAIS'
      ProviderFlags = []
      Size = 50
    end
    object cltUFID_USUARIOEMPRESAEDITANDO: TcprSmallintField
      FieldName = 'ID_USUARIOEMPRESAEDITANDO'
    end
    object cltUFSIGLAPAIS: TcprStringField
      FieldName = 'SIGLAPAIS'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
  end
  object dtsPais: TsmDataset
    CommandText = 
      'select id_pais,'#13#10'       ds_sigla,'#13#10'       nm_pais,'#13#10'       id_us' +
      'uarioempresaeditando'#13#10'from PAIS'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 40
    Top = 469
    object dtsPaisID_PAIS: TSmallintField
      FieldName = 'ID_PAIS'
      Required = True
    end
    object dtsPaisNM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      Required = True
      Size = 50
    end
    object dtsPaisID_USUARIOEMPRESAEDITANDO: TSmallintField
      FieldName = 'ID_USUARIOEMPRESAEDITANDO'
    end
    object dtsPaisDS_SIGLA: TStringField
      FieldName = 'DS_SIGLA'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object pvdPais: TsmProvider
    DataSet = dtsPais
    Options = [poAutoRefresh]
    Left = 105
    Top = 469
  end
  object cltPais: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdPais'
    TabelaPrincipal = 'PAIS'
    Left = 174
    Top = 469
    object cltPaisID_PAIS: TcprSmallintField
      Tag = 1
      FieldName = 'ID_PAIS'
      Required = True
      DisplayFormat = '0000'
    end
    object cltPaisNM_PAIS: TcprStringField
      FieldName = 'NM_PAIS'
      Required = True
      Size = 50
    end
    object cltPaisID_USUARIOEMPRESAEDITANDO: TcprSmallintField
      FieldName = 'ID_USUARIOEMPRESAEDITANDO'
    end
    object cltPaisDS_SIGLA: TcprStringField
      FieldName = 'DS_SIGLA'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object dtsRegiao: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado'#13#10'      ,vw.id_regiao'#13#10'      ,vw.ds_reg' +
      'iao'#13#10'      ,vw.ds_observacao'#13#10'      ,vw.id_usuarioempresaeditand' +
      'o'#13#10'      ,vw.vl_frete'#13#10'      ,vw.pe_venda'#13#10'from VW_LST_REGIAO vw' +
      #13#10
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 285
    Top = 456
    object dtsRegiaoSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsRegiaoID_REGIAO: TSmallintField
      FieldName = 'ID_REGIAO'
      ProviderFlags = []
    end
    object dtsRegiaoDS_REGIAO: TStringField
      FieldName = 'DS_REGIAO'
      ProviderFlags = []
      Size = 100
    end
    object dtsRegiaoDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      ProviderFlags = []
      Size = 1000
    end
    object dtsRegiaoID_USUARIOEMPRESAEDITANDO: TSmallintField
      FieldName = 'ID_USUARIOEMPRESAEDITANDO'
      ProviderFlags = []
    end
    object dtsRegiaoVL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      ProviderFlags = []
    end
    object dtsRegiaoPE_VENDA: TFloatField
      FieldName = 'PE_VENDA'
      ProviderFlags = []
    end
  end
  object pvdRegiao: TsmProvider
    DataSet = dtsRegiao
    Options = [poAutoRefresh]
    Left = 357
    Top = 456
  end
  object cltRegiao: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdRegiao'
    TabelaPrincipal = 'REGIAO'
    Left = 428
    Top = 456
    object cltRegiaoSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltRegiaoID_REGIAO: TcprSmallintField
      Tag = 1
      FieldName = 'ID_REGIAO'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object cltRegiaoDS_REGIAO: TcprStringField
      FieldName = 'DS_REGIAO'
      ProviderFlags = []
      Size = 100
    end
    object cltRegiaoDS_OBSERVACAO: TcprStringField
      FieldName = 'DS_OBSERVACAO'
      ProviderFlags = []
      Size = 1000
    end
    object cltRegiaoID_USUARIOEMPRESAEDITANDO: TcprSmallintField
      FieldName = 'ID_USUARIOEMPRESAEDITANDO'
      ProviderFlags = []
    end
    object cltRegiaoVL_FRETE: TcprFloatField
      FieldName = 'VL_FRETE'
      ProviderFlags = []
      cprTipoGrupoDecimal = grdcVendasVl
    end
    object cltRegiaoPE_VENDA: TcprFloatField
      FieldName = 'PE_VENDA'
      ProviderFlags = []
      cprTipoGrupoDecimal = grdcVendasPe
    end
  end
  object dtsCidadeConsulta: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado, '#13#10'       c.id_cidade,'#13#10'       c.nm_ci' +
      'dade,'#13#10'       c.id_uf,'#13#10'       uf.ds_sigla as siglauf,'#13#10'       u' +
      'f.nm_uf,'#13#10'       p.id_pais,'#13#10'       p.ds_sigla as siglapais,'#13#10'  ' +
      '     p.nm_pais'#13#10'from CIDADE c'#13#10'join UF on (uf.id_uf = c.id_uf)'#13#10 +
      'join PAIS p on (p.id_pais = uf.id_pais)'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 40
    Top = 157
    object dtsCidadeConsultaSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsCidadeConsultaID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Required = True
    end
    object dtsCidadeConsultaNM_CIDADE: TStringField
      FieldName = 'NM_CIDADE'
      Required = True
      Size = 50
    end
    object dtsCidadeConsultaID_UF: TSmallintField
      FieldName = 'ID_UF'
      Required = True
    end
    object dtsCidadeConsultaSIGLAUF: TStringField
      FieldName = 'SIGLAUF'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object dtsCidadeConsultaNM_UF: TStringField
      FieldName = 'NM_UF'
      ProviderFlags = []
      Size = 100
    end
    object dtsCidadeConsultaID_PAIS: TSmallintField
      FieldName = 'ID_PAIS'
      ProviderFlags = []
    end
    object dtsCidadeConsultaSIGLAPAIS: TStringField
      FieldName = 'SIGLAPAIS'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsCidadeConsultaNM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      ProviderFlags = []
      Size = 50
    end
  end
  object pvdCidadeConsulta: TsmProvider
    DataSet = dtsCidadeConsulta
    Options = [poAutoRefresh]
    Left = 105
    Top = 157
  end
  object cltCidadeConsulta: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdCidadeConsulta'
    TabelaPrincipal = 'CIDADE'
    Left = 174
    Top = 157
    object cltCidadeConsultaSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltCidadeConsultaID_CIDADE: TcprIntegerField
      Tag = 1
      FieldName = 'ID_CIDADE'
      Required = True
      DisplayFormat = '00000'
    end
    object cltCidadeConsultaNM_CIDADE: TcprStringField
      FieldName = 'NM_CIDADE'
      Required = True
      Size = 50
    end
    object cltCidadeConsultaID_UF: TcprSmallintField
      FieldName = 'ID_UF'
      Required = True
      DisplayFormat = '0000'
    end
    object cltCidadeConsultaSIGLAUF: TcprStringField
      FieldName = 'SIGLAUF'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object cltCidadeConsultaNM_UF: TcprStringField
      FieldName = 'NM_UF'
      ProviderFlags = []
      Size = 100
    end
    object cltCidadeConsultaID_PAIS: TcprSmallintField
      FieldName = 'ID_PAIS'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object cltCidadeConsultaSIGLAPAIS: TcprStringField
      FieldName = 'SIGLAPAIS'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltCidadeConsultaNM_PAIS: TcprStringField
      FieldName = 'NM_PAIS'
      ProviderFlags = []
      Size = 50
    end
  end
  object dtsBairro: TsmDataset
    CommandText = 
      'select id_bairro'#13#10'      ,ds_bairro'#13#10'      ,id_usuarioempresaedit' +
      'ando'#13#10'      ,qt_distancia'#13#10'from BAIRRO'#13#10
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 40
    Top = 21
    object dtsBairroID_BAIRRO: TIntegerField
      FieldName = 'ID_BAIRRO'
      Required = True
    end
    object dtsBairroDS_BAIRRO: TStringField
      FieldName = 'DS_BAIRRO'
      Required = True
      Size = 100
    end
    object dtsBairroID_USUARIOEMPRESAEDITANDO: TSmallintField
      FieldName = 'ID_USUARIOEMPRESAEDITANDO'
    end
    object dtsBairroQT_DISTANCIA: TIntegerField
      FieldName = 'QT_DISTANCIA'
    end
  end
  object pvdBairro: TsmProvider
    DataSet = dtsBairro
    Options = [poAutoRefresh]
    Left = 105
    Top = 21
  end
  object cltBairro: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdBairro'
    TabelaPrincipal = 'BAIRRO'
    Left = 174
    Top = 21
    object cltBairroID_BAIRRO: TcprIntegerField
      Tag = 1
      FieldName = 'ID_BAIRRO'
      Required = True
      DisplayFormat = '000000'
    end
    object cltBairroDS_BAIRRO: TcprStringField
      FieldName = 'DS_BAIRRO'
      Required = True
      Size = 100
    end
    object cltBairroID_USUARIOEMPRESAEDITANDO: TcprSmallintField
      FieldName = 'ID_USUARIOEMPRESAEDITANDO'
    end
    object cltBairroQT_DISTANCIA: TcprIntegerField
      FieldName = 'QT_DISTANCIA'
    end
  end
  object pvdPessoaEndereco: TsmProvider
    DataSet = dtsPessoaEndereco
    Options = [poAutoRefresh]
    OnGetTableName = pvdUsuarioMemorandoGetTableName
    Left = 357
    Top = 244
  end
  object cltPessoaEndereco: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdPessoaEndereco'
    TabelaPrincipal = 'PESSOAENDERECO'
    Left = 428
    Top = 244
    object cltPessoaEnderecoID_ENDERECO: TcprIntegerField
      Tag = 1
      FieldName = 'ID_ENDERECO'
      Required = True
      DisplayFormat = '00000'
    end
    object cltPessoaEnderecoID_PESSOA: TcprIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
      DisplayFormat = '00000'
    end
    object cltPessoaEnderecoFL_TIPOENDERECO: TcprStringField
      FieldName = 'FL_TIPOENDERECO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cltPessoaEnderecoFL_TIPOENDERECO_EXTENSO: TcprStringField
      FieldName = 'FL_TIPOENDERECO_EXTENSO'
      FixedChar = True
      Size = 8
    end
    object cltPessoaEnderecoID_CIDADE: TcprIntegerField
      FieldName = 'ID_CIDADE'
      Required = True
      DisplayFormat = '00000'
    end
    object cltPessoaEnderecoNM_CIDADE: TcprStringField
      FieldName = 'NM_CIDADE'
      Required = True
      Size = 50
    end
    object cltPessoaEnderecoID_CEP: TcprIntegerField
      FieldName = 'ID_CEP'
      Required = True
      OnGetText = cltPessoaEnderecoID_CEPGetText
    end
    object cltPessoaEnderecoDS_BAIRRO: TcprStringField
      FieldName = 'DS_BAIRRO'
      Required = True
      Size = 100
    end
    object cltPessoaEnderecoDS_ENDERECO: TcprStringField
      FieldName = 'DS_ENDERECO'
      Required = True
      Size = 100
    end
    object cltPessoaEnderecoDS_ENDERECONUMERO: TcprStringField
      FieldName = 'DS_ENDERECONUMERO'
      Size = 10
    end
    object cltPessoaEnderecoDS_COMPLEMENTO: TcprStringField
      FieldName = 'DS_COMPLEMENTO'
      Size = 100
    end
    object cltPessoaEnderecoDS_FONE: TcprStringField
      FieldName = 'DS_FONE'
      FixedChar = True
      Size = 17
    end
    object cltPessoaEnderecoID_CNPJ: TcprStringField
      FieldName = 'ID_CNPJ'
      Size = 18
    end
    object cltPessoaEnderecoID_IE: TcprStringField
      FieldName = 'ID_IE'
      Size = 15
    end
    object cltPessoaEnderecoUF_ESTADO: TcprStringField
      FieldName = 'UF_ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cltPessoaEnderecoNM_OBRA: TcprStringField
      FieldName = 'NM_OBRA'
      Size = 100
    end
    object cltPessoaEnderecoID_CEI: TcprStringField
      FieldName = 'ID_CEI'
      Size = 15
    end
    object cltPessoaEnderecoFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dtsPessoaEndereco: TsmDataset
    CommandText = 
      'select pe.id_endereco'#13#10'      ,pe.id_pessoa'#13#10'      ,pe.fl_tipoend' +
      'ereco'#13#10'      ,case pe.fl_tipoendereco'#13#10'         when '#39'A'#39' then '#39'A' +
      'mbos'#39#13#10'         when '#39'E'#39' then '#39'Entrega'#39#13#10'         when '#39'C'#39' then ' +
      #39'Cobran'#231'a'#39#13#10'         when '#39'O'#39' then '#39'Obra'#39#13#10'       end as fl_tipo' +
      'endereco_extenso'#13#10'      ,pe.id_cidade'#13#10'      ,c.nm_cidade'#13#10'     ' +
      ' ,c.uf_estado'#13#10'      ,pe.id_cep'#13#10'      ,pe.ds_bairro'#13#10'      ,pe.' +
      'ds_endereco'#13#10'      ,pe.ds_endereconumero'#13#10'      ,pe.ds_complemen' +
      'to'#13#10'      ,pe.ds_fone'#13#10'      ,pe.id_cnpj'#13#10'      ,pe.id_ie'#13#10'     ' +
      ' ,pe.nm_obra'#13#10'      ,pe.id_cei'#13#10'      ,pe.fl_ativo'#13#10'from PESSOAE' +
      'NDERECO pe'#13#10'     join CIDADE c on (pe.id_cidade = c.id_cidade)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Con
    Left = 285
    Top = 244
    object dtsPessoaEnderecoID_ENDERECO: TIntegerField
      FieldName = 'ID_ENDERECO'
      Required = True
    end
    object dtsPessoaEnderecoID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object dtsPessoaEnderecoFL_TIPOENDERECO: TStringField
      FieldName = 'FL_TIPOENDERECO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtsPessoaEnderecoFL_TIPOENDERECO_EXTENSO: TStringField
      FieldName = 'FL_TIPOENDERECO_EXTENSO'
      FixedChar = True
      Size = 8
    end
    object dtsPessoaEnderecoID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Required = True
    end
    object dtsPessoaEnderecoNM_CIDADE: TStringField
      FieldName = 'NM_CIDADE'
      Required = True
      Size = 50
    end
    object dtsPessoaEnderecoID_CEP: TIntegerField
      FieldName = 'ID_CEP'
      Required = True
    end
    object dtsPessoaEnderecoDS_BAIRRO: TStringField
      FieldName = 'DS_BAIRRO'
      Required = True
      Size = 100
    end
    object dtsPessoaEnderecoDS_ENDERECO: TStringField
      FieldName = 'DS_ENDERECO'
      Required = True
      Size = 100
    end
    object dtsPessoaEnderecoDS_ENDERECONUMERO: TStringField
      FieldName = 'DS_ENDERECONUMERO'
      Size = 10
    end
    object dtsPessoaEnderecoDS_COMPLEMENTO: TStringField
      FieldName = 'DS_COMPLEMENTO'
      Size = 100
    end
    object dtsPessoaEnderecoDS_FONE: TStringField
      FieldName = 'DS_FONE'
      FixedChar = True
      Size = 17
    end
    object dtsPessoaEnderecoID_CNPJ: TStringField
      FieldName = 'ID_CNPJ'
      Size = 18
    end
    object dtsPessoaEnderecoID_IE: TStringField
      FieldName = 'ID_IE'
      Size = 15
    end
    object dtsPessoaEnderecoUF_ESTADO: TStringField
      FieldName = 'UF_ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object dtsPessoaEnderecoNM_OBRA: TStringField
      FieldName = 'NM_OBRA'
      Size = 100
    end
    object dtsPessoaEnderecoID_CEI: TStringField
      FieldName = 'ID_CEI'
      Size = 15
    end
    object dtsPessoaEnderecoFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object pvdDocumentoStaus: TsmProvider
    DataSet = dtsDocumentoStaus
    Options = [poAutoRefresh]
    UpdateMode = upWhereKeyOnly
    Left = 597
    Top = 306
  end
  object cltDocumentoStaus: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdDocumentoStaus'
    TabelaPrincipal = 'DOCUMENTOSTATUS'
    Left = 663
    Top = 306
    object cltDocumentoStausID_DOCUMENTOSTATUS: TcprIntegerField
      Tag = 1
      Alignment = taCenter
      FieldName = 'ID_DOCUMENTOSTATUS'
      ProviderFlags = [pfInKey]
      DisplayFormat = '000'
    end
    object cltDocumentoStausDS_STAUTS: TcprStringField
      FieldName = 'DS_STAUTS'
      ProviderFlags = []
      Size = 100
    end
    object cltDocumentoStausFL_DOCUMENTO: TcprStringField
      FieldName = 'FL_DOCUMENTO'
      ProviderFlags = []
      Size = 50
    end
    object cltDocumentoStausID_DOCUMENTOSTATUSITEM: TcprIntegerField
      FieldName = 'ID_DOCUMENTOSTATUSITEM'
      ProviderFlags = []
    end
    object cltDocumentoStausFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dtsDocumentoStaus: TsmDataset
    CommandText = 
      'select vw.id_documentostatus'#13#10'      ,vw.ds_stauts'#13#10'      ,vw.fl_' +
      'documento'#13#10'      ,vw.fl_documento_ext'#13#10'      ,vw.id_documentosta' +
      'tusitem'#13#10'      ,vw.fl_ativo'#13#10'from VW_LST_DOCUMENTOSTATUS vw'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'DOCUMENTOSTATUS'
    Left = 528
    Top = 307
    object dtsDocumentoStausID_DOCUMENTOSTATUS: TIntegerField
      Tag = 1
      Alignment = taCenter
      FieldName = 'ID_DOCUMENTOSTATUS'
      ProviderFlags = [pfInKey]
      DisplayFormat = '000'
    end
    object dtsDocumentoStausDS_STAUTS: TStringField
      FieldName = 'DS_STAUTS'
      ProviderFlags = []
      Size = 100
    end
    object dtsDocumentoStausFL_DOCUMENTO: TStringField
      FieldName = 'FL_DOCUMENTO'
      ProviderFlags = []
      Size = 50
    end
    object dtsDocumentoStausID_DOCUMENTOSTATUSITEM: TIntegerField
      FieldName = 'ID_DOCUMENTOSTATUSITEM'
      ProviderFlags = []
    end
    object dtsDocumentoStausFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dtsSeguradora: TsmDataset
    CommandText = 
      'select id_seguradora, '#13#10'       nm_seguradora, '#13#10'       fl_ativo'#13 +
      #10'from SEGURADORA'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 530
    Top = 354
    object dtsSeguradoraID_SEGURADORA: TIntegerField
      FieldName = 'ID_SEGURADORA'
      Required = True
    end
    object dtsSeguradoraNM_SEGURADORA: TStringField
      FieldName = 'NM_SEGURADORA'
      Required = True
      Size = 80
    end
    object dtsSeguradoraFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object pvdSeguradora: TsmProvider
    DataSet = dtsSeguradora
    Options = [poAutoRefresh]
    UpdateMode = upWhereKeyOnly
    OnGetTableName = pvdCEPGetTableName
    Left = 596
    Top = 354
  end
  object cltSeguradora: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'ID_SEGURADORA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NM_SEGURADORA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 80
      end
      item
        Name = 'FL_ATIVO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'pvdSeguradora'
    StoreDefs = True
    TabelaPrincipal = 'SEGURADORA'
    Left = 666
    Top = 354
    object cltSeguradoraID_SEGURADORA: TcprIntegerField
      Tag = 1
      Alignment = taCenter
      FieldName = 'ID_SEGURADORA'
      Required = True
      DisplayFormat = '000'
    end
    object cltSeguradoraNM_SEGURADORA: TcprStringField
      FieldName = 'NM_SEGURADORA'
      Required = True
      Size = 80
    end
    object cltSeguradoraFL_ATIVO: TcprStringField
      Alignment = taCenter
      FieldName = 'FL_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cltConvenio: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdConvenio'
    TabelaPrincipal = 'CONVENIO'
    Left = 667
    Top = 403
    object cltConvenioID_CONVENIO: TcprSmallintField
      Tag = 1
      FieldName = 'ID_CONVENIO'
      Required = True
    end
    object cltConvenioDS_CONVENIO: TcprStringField
      FieldName = 'DS_CONVENIO'
      Required = True
      Size = 80
    end
  end
  object pvdConvenio: TsmProvider
    DataSet = dtsConvenio
    Left = 602
    Top = 403
  end
  object dtsConvenio: TsmDataset
    CommandText = 'select'#13#10'  c.id_convenio, '#13#10'  c.ds_convenio'#13#10'from CONVENIO c'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 534
    Top = 405
    object dtsConvenioID_CONVENIO: TSmallintField
      FieldName = 'ID_CONVENIO'
      Required = True
    end
    object dtsConvenioDS_CONVENIO: TStringField
      FieldName = 'DS_CONVENIO'
      Required = True
      Size = 80
    end
  end
  object cltTipoUso: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdTipoUso'
    TabelaPrincipal = 'TIPOUSO'
    Left = 667
    Top = 451
    object cltTipoUsoID_TIPOUSO: TcprSmallintField
      Tag = 1
      FieldName = 'ID_TIPOUSO'
      Required = True
    end
    object cltTipoUsoDS_TIPOUSO: TcprStringField
      FieldName = 'DS_TIPOUSO'
      Required = True
      Size = 100
    end
  end
  object pvdTipoUso: TsmProvider
    DataSet = dtsTipoUso
    Left = 602
    Top = 451
  end
  object dtsTipoUso: TsmDataset
    CommandText = 'select'#13#10'  tu.id_tipouso, '#13#10'  tu.ds_tipouso'#13#10'from TIPOUSO tu'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 534
    Top = 453
    object dtsTipoUsoID_TIPOUSO: TSmallintField
      FieldName = 'ID_TIPOUSO'
      Required = True
    end
    object dtsTipoUsoDS_TIPOUSO: TStringField
      FieldName = 'DS_TIPOUSO'
      Required = True
      Size = 100
    end
  end
  object dtsMaterial: TsmDataset
    CommandText = 'select'#13#10'  m.id_material, '#13#10'  m.ds_material'#13#10'from MATERIAL m'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 534
    Top = 597
    object dtsMaterialID_MATERIAL: TSmallintField
      FieldName = 'ID_MATERIAL'
      Required = True
    end
    object dtsMaterialDS_MATERIAL: TStringField
      FieldName = 'DS_MATERIAL'
      Required = True
      Size = 100
    end
  end
  object pvdMaterial: TsmProvider
    DataSet = dtsMaterial
    Left = 604
    Top = 596
  end
  object cltMaterial: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdMaterial'
    TabelaPrincipal = 'MATERIAL'
    Left = 670
    Top = 596
    object cltMaterialID_MATERIAL: TcprSmallintField
      Tag = 1
      FieldName = 'ID_MATERIAL'
      Required = True
    end
    object cltMaterialDS_MATERIAL: TcprStringField
      FieldName = 'DS_MATERIAL'
      Required = True
      Size = 100
    end
  end
  object dtsConfiguracaoAcessoLocalUsuario: TsmDataset
    CommandText = 
      'select'#13#10'  ale.id_acessolocalestoque, '#13#10'  ale.ds_acessolocalestoq' +
      'ue, '#13#10'  ale.fl_ativo'#13#10'from CFG_ACESSOLOCALESTOQUE ale'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 286
    Top = 502
    object dtsConfiguracaoAcessoLocalUsuarioID_ACESSOLOCALESTOQUE: TSmallintField
      FieldName = 'ID_ACESSOLOCALESTOQUE'
      Required = True
    end
    object dtsConfiguracaoAcessoLocalUsuarioDS_ACESSOLOCALESTOQUE: TStringField
      FieldName = 'DS_ACESSOLOCALESTOQUE'
      Required = True
      Size = 50
    end
    object dtsConfiguracaoAcessoLocalUsuarioFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object pvdConfiguracaoAcessoLocalUsuario: TsmProvider
    DataSet = dtsConfiguracaoAcessoLocalUsuario
    Left = 356
    Top = 501
  end
  object cltConfiguracaoAcessoLocalUsuario: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdConfiguracaoAcessoLocalUsuario'
    TabelaPrincipal = 'CFG_ACESSOLOCALESTOQUE'
    Left = 422
    Top = 501
    object cltConfiguracaoAcessoLocalUsuarioID_ACESSOLOCALESTOQUE: TcprSmallintField
      Tag = 1
      FieldName = 'ID_ACESSOLOCALESTOQUE'
      Required = True
    end
    object cltConfiguracaoAcessoLocalUsuarioDS_ACESSOLOCALESTOQUE: TcprStringField
      FieldName = 'DS_ACESSOLOCALESTOQUE'
      Required = True
      Size = 50
    end
    object cltConfiguracaoAcessoLocalUsuarioFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dtsPessoaAtributo: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado, vw.id_atributo,'#13#10'       vw.ds_atribut' +
      'o,'#13#10'       vw.fl_fixo,'#13#10'       vw.fl_visivel'#13#10'from VW_LST_PESSOA' +
      '_ATRIBUTO vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'ATRIBUTO'
    Left = 288
    Top = 544
    object dtsPessoaAtributoID_ATRIBUTO: TIntegerField
      Tag = 1
      FieldName = 'ID_ATRIBUTO'
      DisplayFormat = '0000'
    end
    object dtsPessoaAtributoDS_ATRIBUTO: TStringField
      FieldName = 'DS_ATRIBUTO'
      Size = 100
    end
    object dtsPessoaAtributoFL_FIXO: TStringField
      FieldName = 'FL_FIXO'
      FixedChar = True
      Size = 1
    end
    object dtsPessoaAtributoFL_VISIVEL: TStringField
      FieldName = 'FL_VISIVEL'
      FixedChar = True
      Size = 1
    end
    object dtsPessoaAtributoSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
  end
  object pvdPessoaAtributo: TsmProvider
    DataSet = dtsPessoaAtributo
    Options = [poAutoRefresh]
    OnGetTableName = pvdTipoContratoGetTableName
    Left = 357
    Top = 544
  end
  object cltPessoaAtributo: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdPessoaAtributo'
    TabelaPrincipal = 'ATRIBUTO'
    Left = 423
    Top = 544
    object cltPessoaAtributoID_ATRIBUTO: TcprIntegerField
      Tag = 1
      FieldName = 'ID_ATRIBUTO'
      DisplayFormat = '0000'
    end
    object cltPessoaAtributoDS_ATRIBUTO: TcprStringField
      FieldName = 'DS_ATRIBUTO'
      Size = 100
    end
    object cltPessoaAtributoFL_FIXO: TcprStringField
      FieldName = 'FL_FIXO'
      FixedChar = True
      Size = 1
    end
    object cltPessoaAtributoFL_VISIVEL: TcprStringField
      FieldName = 'FL_VISIVEL'
      FixedChar = True
      Size = 1
    end
    object cltPessoaAtributoSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
  end
  object dtsCor: TsmDataset
    CommandText = 
      'select vw.id_cor'#13#10'      ,vw.ds_cor'#13#10'      ,vw.nr_cor'#13#10'from VW_LS' +
      'T_COR vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'COR'
    Left = 534
    Top = 645
    object dtsCorID_COR: TIntegerField
      FieldName = 'ID_COR'
      ProviderFlags = []
    end
    object dtsCorDS_COR: TStringField
      FieldName = 'DS_COR'
      ProviderFlags = []
      Size = 250
    end
    object dtsCorNR_COR: TIntegerField
      FieldName = 'NR_COR'
      ProviderFlags = []
    end
  end
  object pvdCor: TsmProvider
    DataSet = dtsCor
    OnGetTableName = pvdCorGetTableName
    Left = 604
    Top = 644
  end
  object cltCor: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdCor'
    TabelaPrincipal = 'COR'
    Left = 670
    Top = 644
    object cltCorID_COR: TcprIntegerField
      Tag = 1
      FieldName = 'ID_COR'
      ProviderFlags = [pfInKey]
      DisplayFormat = '0000'
    end
    object cltCorDS_COR: TcprStringField
      FieldName = 'DS_COR'
      ProviderFlags = []
      Size = 250
    end
    object cltCorNR_COR: TcprIntegerField
      FieldName = 'NR_COR'
      ProviderFlags = []
    end
  end
  object cltTipo: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdTipo'
    TabelaPrincipal = 'TIPO_GENERICO'
    Left = 424
    Top = 591
    object cltTipoID_TIPO: TcprIntegerField
      Tag = 1
      FieldName = 'ID_TIPO'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object cltTipoDS_TIPO: TcprStringField
      FieldName = 'DS_TIPO'
      ProviderFlags = []
      Size = 250
    end
    object cltTipoFL_TIPO: TcprStringField
      FieldName = 'FL_TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltTipoVL_GRAMATURA: TcprFloatField
      FieldName = 'VL_GRAMATURA'
      ProviderFlags = []
      DisplayFormat = '#,##0.0000'
    end
    object cltTipoFL_ONDA: TcprStringField
      FieldName = 'FL_ONDA'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object cltTipoDS_ONDA: TcprStringField
      FieldName = 'DS_ONDA'
      ProviderFlags = []
      Size = 2
    end
    object cltTipoDS_UNIDADE_MEDIDA: TcprStringField
      FieldName = 'DS_UNIDADE_MEDIDA'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object cltTipoVL_PRECO: TcprFloatField
      FieldName = 'VL_PRECO'
      ProviderFlags = []
      DisplayFormat = '#,##0.0000'
    end
    object cltTipoSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltTipoFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object pvdTipo: TsmProvider
    DataSet = dtsTipo
    Options = [poAutoRefresh]
    UpdateMode = upWhereChanged
    OnGetTableName = pvdTipoGetTableName
    Left = 359
    Top = 591
  end
  object dtsTipo: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado'#13#10'      ,vw.id_tipo'#13#10'      ,vw.ds_tipo'#13 +
      #10'      ,vw.fl_tipo'#13#10'      ,vw.vl_gramatura'#13#10'      ,vw.fl_onda'#13#10' ' +
      '     ,vw.ds_onda'#13#10'      ,vw.ds_unidade_medida'#13#10'      ,vw.vl_prec' +
      'o'#13#10'      ,vw.fl_ativo'#13#10'from VW_LST_TIPO_GERERICO vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'TIPO_GENERICO'
    Left = 287
    Top = 591
    object dtsTipoID_TIPO: TIntegerField
      FieldName = 'ID_TIPO'
      ProviderFlags = []
    end
    object dtsTipoDS_TIPO: TStringField
      FieldName = 'DS_TIPO'
      ProviderFlags = []
      Size = 250
    end
    object dtsTipoFL_TIPO: TStringField
      FieldName = 'FL_TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsTipoVL_GRAMATURA: TFloatField
      FieldName = 'VL_GRAMATURA'
      ProviderFlags = []
    end
    object dtsTipoFL_ONDA: TStringField
      FieldName = 'FL_ONDA'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object dtsTipoDS_ONDA: TStringField
      FieldName = 'DS_ONDA'
      ProviderFlags = []
      Size = 2
    end
    object dtsTipoDS_UNIDADE_MEDIDA: TStringField
      FieldName = 'DS_UNIDADE_MEDIDA'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object dtsTipoVL_PRECO: TFloatField
      FieldName = 'VL_PRECO'
      ProviderFlags = []
    end
    object dtsTipoSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsTipoFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dtsUsuarioConsulta: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado'#13#10'      ,vw.id_usuario'#13#10'      ,vw.id_pe' +
      'ssoa'#13#10'      ,vw.nm_login'#13#10'      ,vw.fl_ativo'#13#10'      ,vw.fl_frent' +
      'edecaixa'#13#10'      ,vw.fl_frentedecaixaextendido'#13#10'      ,vw.nm_pess' +
      'oa'#13#10'      ,vw.ds_subnivel'#13#10'      ,vw.id_caixa'#13#10'      ,vw.ds_caix' +
      'a'#13#10'from VW_LST_USUARIO vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 528
    Top = 201
    object dtsUsuarioConsultaSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsUsuarioConsultaID_USUARIO: TIntegerField
      Tag = 1
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInKey]
    end
    object dtsUsuarioConsultaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = []
    end
    object dtsUsuarioConsultaNM_LOGIN: TStringField
      FieldName = 'NM_LOGIN'
      ProviderFlags = []
      FixedChar = True
    end
    object dtsUsuarioConsultaFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsUsuarioConsultaFL_FRENTEDECAIXA: TStringField
      FieldName = 'FL_FRENTEDECAIXA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsUsuarioConsultaFL_FRENTEDECAIXAEXTENDIDO: TStringField
      FieldName = 'FL_FRENTEDECAIXAEXTENDIDO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsUsuarioConsultaNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      ProviderFlags = []
      Size = 100
    end
    object dtsUsuarioConsultaDS_SUBNIVEL: TStringField
      FieldName = 'DS_SUBNIVEL'
      ProviderFlags = []
      Size = 120
    end
    object dtsUsuarioConsultaID_CAIXA: TSmallintField
      FieldName = 'ID_CAIXA'
      ProviderFlags = []
    end
    object dtsUsuarioConsultaDS_CAIXA: TStringField
      FieldName = 'DS_CAIXA'
      ProviderFlags = []
      Size = 50
    end
  end
  object pvdUsuarioConsulta: TsmProvider
    DataSet = dtsUsuarioConsulta
    Options = [poAutoRefresh]
    OnGetTableName = pvdUsuarioGetTableName
    Left = 597
    Top = 201
  end
  object cltUsuarioConsulta: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdUsuarioConsulta'
    TabelaPrincipal = 'USUARIO'
    Left = 663
    Top = 201
    object cltUsuarioConsultaSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltUsuarioConsultaID_USUARIO: TcprIntegerField
      Tag = 1
      Alignment = taCenter
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInKey]
      DisplayFormat = '000'
    end
    object cltUsuarioConsultaID_PESSOA: TcprIntegerField
      Alignment = taCenter
      FieldName = 'ID_PESSOA'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltUsuarioConsultaNM_LOGIN: TcprStringField
      FieldName = 'NM_LOGIN'
      ProviderFlags = []
      FixedChar = True
    end
    object cltUsuarioConsultaFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltUsuarioConsultaFL_FRENTEDECAIXA: TcprStringField
      FieldName = 'FL_FRENTEDECAIXA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltUsuarioConsultaFL_FRENTEDECAIXAEXTENDIDO: TcprStringField
      FieldName = 'FL_FRENTEDECAIXAEXTENDIDO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltUsuarioConsultaNM_PESSOA: TcprStringField
      FieldName = 'NM_PESSOA'
      ProviderFlags = []
      Size = 100
    end
    object cltUsuarioConsultaDS_SUBNIVEL: TcprStringField
      FieldName = 'DS_SUBNIVEL'
      ProviderFlags = []
      Size = 120
    end
    object cltUsuarioConsultaID_CAIXA: TcprSmallintField
      FieldName = 'ID_CAIXA'
      ProviderFlags = []
    end
    object cltUsuarioConsultaDS_CAIXA: TcprStringField
      FieldName = 'DS_CAIXA'
      ProviderFlags = []
      Size = 50
    end
  end
  object cltFinanceiroPrazoMedio: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'ID_FINANC_PRAZO_MEDIO'
        DataType = ftInteger
      end
      item
        Name = 'DS_FINANC_PRAZO_MEDIO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NR_DIAS'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'pvdFinanceiroPrazoMedio'
    StoreDefs = True
    Left = 174
    Top = 517
    object cltFinanceiroPrazoMedioID_FINANC_PRAZO_MEDIO: TcprIntegerField
      FieldName = 'ID_FINANC_PRAZO_MEDIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '0000'
    end
    object cltFinanceiroPrazoMedioDS_FINANC_PRAZO_MEDIO: TcprStringField
      FieldName = 'DS_FINANC_PRAZO_MEDIO'
      Size = 50
    end
    object cltFinanceiroPrazoMedioNR_DIAS: TcprSmallintField
      FieldName = 'NR_DIAS'
      DisplayFormat = '0000'
    end
  end
  object pvdFinanceiroPrazoMedio: TsmProvider
    DataSet = dtsFinanceiroPrazoMedio
    Options = [poAutoRefresh]
    Left = 105
    Top = 517
  end
  object dtsFinanceiroPrazoMedio: TsmDataset
    CommandText = 
      'select VW.ID_FINANC_PRAZO_MEDIO'#13#10'         ,VW.DS_FINANC_PRAZO_ME' +
      'DIO'#13#10'         ,VW.NR_DIAS'#13#10'from VW_LST_FINANC_PRAZO_MEDIO VW'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 40
    Top = 517
    object dtsFinanceiroPrazoMedioID_FINANC_PRAZO_MEDIO: TIntegerField
      FieldName = 'ID_FINANC_PRAZO_MEDIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsFinanceiroPrazoMedioDS_FINANC_PRAZO_MEDIO: TStringField
      FieldName = 'DS_FINANC_PRAZO_MEDIO'
      Size = 50
    end
    object dtsFinanceiroPrazoMedioNR_DIAS: TSmallintField
      FieldName = 'NR_DIAS'
    end
  end
  object cltFinanceiroPrazoMedioConsulta: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'ID_FINANC_PRAZO_MEDIO'
        DataType = ftInteger
      end
      item
        Name = 'DS_FINANC_PRAZO_MEDIO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NR_DIAS'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'pvdFinanceiroPrazoMedioConsulta'
    StoreDefs = True
    Left = 174
    Top = 565
    object cprIntegerField5: TcprIntegerField
      FieldName = 'ID_FINANC_PRAZO_MEDIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '0000'
    end
    object cprStringField14: TcprStringField
      FieldName = 'DS_FINANC_PRAZO_MEDIO'
      Size = 50
    end
    object cprSmallintField2: TcprSmallintField
      FieldName = 'NR_DIAS'
      DisplayFormat = '0000'
    end
  end
  object pvdFinanceiroPrazoMedioConsulta: TsmProvider
    DataSet = dtsFinanceiroPrazoMedioConsulta
    Options = [poAutoRefresh]
    Left = 105
    Top = 565
  end
  object dtsFinanceiroPrazoMedioConsulta: TsmDataset
    CommandText = 
      'select VW.ID_FINANC_PRAZO_MEDIO'#13#10'         ,VW.DS_FINANC_PRAZO_ME' +
      'DIO'#13#10'         ,VW.NR_DIAS'#13#10'from VW_LST_FINANC_PRAZO_MEDIO VW'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 40
    Top = 565
    object IntegerField1: TIntegerField
      FieldName = 'ID_FINANC_PRAZO_MEDIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object StringField2: TStringField
      FieldName = 'DS_FINANC_PRAZO_MEDIO'
      Size = 50
    end
    object SmallintField2: TSmallintField
      FieldName = 'NR_DIAS'
    end
  end
  object cltRamoAtividadeAtuacao: TsmClient
    Aggregates = <>
    Params = <>
    ProviderName = 'pvdRamoAtividadeAtuacao'
    TabelaPrincipal = 'RAMOATIVIDADE_ATUACAO'
    Left = 428
    Top = 641
    object cltRamoAtividadeAtuacaoID_RAMOATIVIDADE_ATUACAO: TcprSmallintField
      Tag = 1
      Alignment = taCenter
      FieldName = 'ID_RAMOATIVIDADE_ATUACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '00000'
    end
    object cltRamoAtividadeAtuacaoDS_RAMOATIVIDADE_ATUACAO: TcprStringField
      FieldName = 'DS_RAMOATIVIDADE_ATUACAO'
      Size = 50
    end
    object cltRamoAtividadeAtuacaoFL_IMPORTADOR: TcprStringField
      FieldName = 'FL_IMPORTADOR'
      FixedChar = True
      Size = 3
    end
    object cltRamoAtividadeAtuacaoFL_INDUSTRIA: TcprStringField
      FieldName = 'FL_INDUSTRIA'
      FixedChar = True
      Size = 3
    end
    object cltRamoAtividadeAtuacaoFL_VAREJISTA: TcprStringField
      FieldName = 'FL_VAREJISTA'
      FixedChar = True
      Size = 3
    end
    object cltRamoAtividadeAtuacaoFL_ATACADISTA: TcprStringField
      FieldName = 'FL_ATACADISTA'
      FixedChar = True
      Size = 3
    end
    object cltRamoAtividadeAtuacaoFL_CONSUMIDORFINAL: TcprStringField
      FieldName = 'FL_CONSUMIDORFINAL'
      FixedChar = True
      Size = 3
    end
    object cltRamoAtividadeAtuacaoFL_FIXO: TcprStringField
      FieldName = 'FL_FIXO'
      FixedChar = True
      Size = 3
    end
  end
  object pvdRamoAtividadeAtuacao: TsmProvider
    DataSet = dtsRamoAtividadeAtuacao
    Options = [poAutoRefresh]
    Left = 357
    Top = 641
  end
  object dtsRamoAtividadeAtuacao: TsmDataset
    CommandText = 
      'select vw.id_ramoatividade_atuacao,'#13#10'       vw.ds_ramoatividade_' +
      'atuacao,'#13#10'       vw.fl_importador,'#13#10'       vw.fl_industria,'#13#10'   ' +
      '    vw.fl_varejista,'#13#10'       vw.fl_atacadista,'#13#10'       vw.fl_con' +
      'sumidorfinal,'#13#10'       vw.fl_fixo'#13#10'from VW_LST_RAMOATIVIDADE_ATUA' +
      'CAO vw'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Con
    Left = 285
    Top = 641
    object dtsRamoAtividadeAtuacaoID_RAMOATIVIDADE_ATUACAO: TSmallintField
      Tag = 1
      Alignment = taCenter
      FieldName = 'ID_RAMOATIVIDADE_ATUACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '00000'
    end
    object dtsRamoAtividadeAtuacaoDS_RAMOATIVIDADE_ATUACAO: TStringField
      FieldName = 'DS_RAMOATIVIDADE_ATUACAO'
      Size = 50
    end
    object dtsRamoAtividadeAtuacaoFL_IMPORTADOR: TStringField
      FieldName = 'FL_IMPORTADOR'
      FixedChar = True
      Size = 3
    end
    object dtsRamoAtividadeAtuacaoFL_INDUSTRIA: TStringField
      FieldName = 'FL_INDUSTRIA'
      FixedChar = True
      Size = 3
    end
    object dtsRamoAtividadeAtuacaoFL_VAREJISTA: TStringField
      FieldName = 'FL_VAREJISTA'
      FixedChar = True
      Size = 3
    end
    object dtsRamoAtividadeAtuacaoFL_ATACADISTA: TStringField
      FieldName = 'FL_ATACADISTA'
      FixedChar = True
      Size = 3
    end
    object dtsRamoAtividadeAtuacaoFL_CONSUMIDORFINAL: TStringField
      FieldName = 'FL_CONSUMIDORFINAL'
      FixedChar = True
      Size = 3
    end
    object dtsRamoAtividadeAtuacaoFL_FIXO: TStringField
      FieldName = 'FL_FIXO'
      FixedChar = True
      Size = 3
    end
  end
  object dtsContato: TsmDataset
    CommandText = 
      'select vw.id_pessoa_contato'#13#10'      ,vw.ds_nomecontato'#13#10'      ,vw' +
      '.ds_setor'#13#10'      ,vw.nr_telefone'#13#10'      ,vw.ramal'#13#10'      ,vw.fl_' +
      'autorizadoacomprar'#13#10'      ,vw.id_pessoa'#13#10'      ,vw.id_contato'#13#10'f' +
      'rom vw_lst_contato vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 38
    Top = 609
    object dtsContatoID_PESSOA_CONTATO: TIntegerField
      FieldName = 'ID_PESSOA_CONTATO'
    end
    object dtsContatoDS_NOMECONTATO: TStringField
      FieldName = 'DS_NOMECONTATO'
      Size = 100
    end
    object dtsContatoDS_SETOR: TStringField
      FieldName = 'DS_SETOR'
    end
    object dtsContatoNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
      Size = 17
    end
    object dtsContatoRAMAL: TStringField
      FieldName = 'RAMAL'
      FixedChar = True
      Size = 6
    end
    object dtsContatoFL_AUTORIZADOACOMPRAR: TStringField
      FieldName = 'FL_AUTORIZADOACOMPRAR'
      FixedChar = True
      Size = 1
    end
    object dtsContatoID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object dtsContatoID_CONTATO: TSmallintField
      Tag = 1
      FieldName = 'ID_CONTATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object pvdContato: TsmProvider
    DataSet = dtsContato
    Options = [poAutoRefresh]
    Left = 105
    Top = 609
  end
  object cltContato: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdContato'
    TabelaPrincipal = 'PESSOA'
    Left = 174
    Top = 609
    object cltContatoID_PESSOA_CONTATO: TcprIntegerField
      FieldName = 'ID_PESSOA_CONTATO'
    end
    object cltContatoDS_NOMECONTATO: TcprStringField
      FieldName = 'DS_NOMECONTATO'
      Size = 100
    end
    object cltContatoDS_SETOR: TcprStringField
      FieldName = 'DS_SETOR'
    end
    object cltContatoNR_TELEFONE: TcprStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
      Size = 17
    end
    object cltContatoRAMAL: TcprStringField
      FieldName = 'RAMAL'
      FixedChar = True
      Size = 6
    end
    object cltContatoFL_AUTORIZADOACOMPRAR: TcprStringField
      FieldName = 'FL_AUTORIZADOACOMPRAR'
      FixedChar = True
      Size = 1
    end
    object cltContatoID_PESSOA: TcprIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cltContatoID_CONTATO: TcprSmallintField
      Tag = 1
      FieldName = 'ID_CONTATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object dtsCombustivel: TsmDataset
    CommandText = 
      'select vw.id_combustivel'#13#10'      ,vw.ds_combustivel'#13#10'      ,vw.nr' +
      '_combustivel'#13#10'      ,vw.id_combustivel_referente'#13#10'      ,vw.ds_p' +
      'lano_combustivel'#13#10'      ,vw.id_unidademedida'#13#10'      ,vw.sg_medid' +
      'a'#13#10'      ,vw.fl_tipo'#13#10'      ,vw.fl_tipo_interno'#13#10'from VW_LST_COM' +
      'BUSTIVEL vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'COMBUSTIVEL'
    Left = 533
    Top = 505
    object dtsCombustivelID_COMBUSTIVEL: TIntegerField
      Tag = 1
      FieldName = 'ID_COMBUSTIVEL'
    end
    object dtsCombustivelDS_COMBUSTIVEL: TStringField
      FieldName = 'DS_COMBUSTIVEL'
      Size = 200
    end
    object dtsCombustivelNR_COMBUSTIVEL: TIntegerField
      FieldName = 'NR_COMBUSTIVEL'
    end
    object dtsCombustivelID_COMBUSTIVEL_REFERENTE: TIntegerField
      FieldName = 'ID_COMBUSTIVEL_REFERENTE'
    end
    object dtsCombustivelSG_MEDIDA: TStringField
      FieldName = 'SG_MEDIDA'
      FixedChar = True
      Size = 10
    end
    object dtsCombustivelFL_TIPO: TStringField
      FieldName = 'FL_TIPO'
      FixedChar = True
      Size = 12
    end
    object dtsCombustivelDS_PLANO_COMBUSTIVEL: TStringField
      FieldName = 'DS_PLANO_COMBUSTIVEL'
      Size = 35
    end
    object dtsCombustivelID_UNIDADEMEDIDA: TSmallintField
      FieldName = 'ID_UNIDADEMEDIDA'
    end
    object dtsCombustivelFL_TIPO_INTERNO: TStringField
      FieldName = 'FL_TIPO_INTERNO'
      FixedChar = True
      Size = 1
    end
  end
  object pvdCombustivel: TsmProvider
    DataSet = dtsCombustivel
    OnGetTableName = pvdCorGetTableName
    Left = 603
    Top = 504
  end
  object cltCombustivel: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdCombustivel'
    TabelaPrincipal = 'COMBUSTIVEL'
    Left = 669
    Top = 504
    object cltCombustivelID_COMBUSTIVEL: TcprIntegerField
      Tag = 1
      FieldName = 'ID_COMBUSTIVEL'
    end
    object cltCombustivelDS_COMBUSTIVEL: TcprStringField
      FieldName = 'DS_COMBUSTIVEL'
      Size = 200
    end
    object cltCombustivelNR_COMBUSTIVEL: TcprIntegerField
      FieldName = 'NR_COMBUSTIVEL'
    end
    object cltCombustivelID_COMBUSTIVEL_REFERENTE: TcprIntegerField
      FieldName = 'ID_COMBUSTIVEL_REFERENTE'
    end
    object cltCombustivelID_UNIDADEMEDIDA: TcprSmallintField
      FieldName = 'ID_UNIDADEMEDIDA'
    end
    object cltCombustivelSG_MEDIDA: TcprStringField
      FieldName = 'SG_MEDIDA'
      FixedChar = True
      Size = 10
    end
    object cltCombustivelFL_TIPO: TcprStringField
      FieldName = 'FL_TIPO'
      FixedChar = True
      Size = 12
    end
    object cltCombustivelDS_PLANO_COMBUSTIVEL: TcprStringField
      FieldName = 'DS_PLANO_COMBUSTIVEL'
      Size = 35
    end
    object cltCombustivelFL_TIPO_INTERNO: TcprStringField
      FieldName = 'FL_TIPO_INTERNO'
      FixedChar = True
      Size = 1
    end
  end
  object dtsMoeda: TsmDataset
    CommandText = 
      'select vw.id_moeda'#13#10'      ,vw.fl_moeda'#13#10'      ,vw.ds_moeda'#13#10'    ' +
      '  ,vw.id_pais'#13#10'      ,vw.nm_pais'#13#10'      ,vw.fl_simbolo'#13#10'      ,v' +
      'w.ds_moeda_consulta'#13#10'      ,vw.fl_nacional'#13#10'      ,vw.ds_naciona' +
      'l'#13#10'      ,vw.fl_fixo'#13#10'      ,vw.ds_fixo'#13#10'      ,vw.fl_tipo_cotac' +
      'ao'#13#10'      ,vw.ds_tipo_cotacao'#13#10'from VW_LST_MOEDA vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'MOEDA'
    Left = 38
    Top = 662
    object dtsMoedaID_MOEDA: TSmallintField
      Tag = 1
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_MOEDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsMoedaFL_MOEDA: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'FL_MOEDA'
      FixedChar = True
      Size = 3
    end
    object dtsMoedaDS_MOEDA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DS_MOEDA'
      Size = 100
    end
    object dtsMoedaID_PAIS: TSmallintField
      DisplayLabel = 'C'#243'digo do pa'#237's'
      FieldName = 'ID_PAIS'
    end
    object dtsMoedaNM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      ProviderFlags = []
      Size = 50
    end
    object dtsMoedaFL_SIMBOLO: TStringField
      DisplayLabel = 'S'#237'mbolo'
      FieldName = 'FL_SIMBOLO'
      Size = 5
    end
    object dtsMoedaDS_MOEDA_CONSULTA: TStringField
      DisplayLabel = 'Sigla consulta'
      FieldName = 'DS_MOEDA_CONSULTA'
      Size = 100
    end
    object dtsMoedaFL_NACIONAL: TStringField
      DisplayLabel = 'Nacional'
      FieldName = 'FL_NACIONAL'
      FixedChar = True
      Size = 1
    end
    object dtsMoedaDS_NACIONAL: TStringField
      FieldName = 'DS_NACIONAL'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsMoedaFL_FIXO: TStringField
      DisplayLabel = 'Padr'#227'o'
      FieldName = 'FL_FIXO'
      FixedChar = True
      Size = 1
    end
    object dtsMoedaDS_FIXO: TStringField
      FieldName = 'DS_FIXO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsMoedaFL_TIPO_COTACAO: TStringField
      FieldName = 'FL_TIPO_COTACAO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsMoedaDS_TIPO_COTACAO: TStringField
      FieldName = 'DS_TIPO_COTACAO'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
  end
  object pvdMoeda: TsmProvider
    DataSet = dtsMoeda
    OnGetTableName = pvdMoedaGetTableName
    Left = 108
    Top = 660
  end
  object cltMoeda: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdMoeda'
    TabelaPrincipal = 'MOEDA'
    Left = 174
    Top = 661
    object cltMoedaID_MOEDA: TcprSmallintField
      Tag = 1
      Alignment = taCenter
      FieldName = 'ID_MOEDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '00000'
    end
    object cltMoedaFL_MOEDA: TcprStringField
      FieldName = 'FL_MOEDA'
      FixedChar = True
      Size = 3
    end
    object cltMoedaDS_MOEDA: TcprStringField
      FieldName = 'DS_MOEDA'
      Size = 100
    end
    object cltMoedaID_PAIS: TcprSmallintField
      Alignment = taCenter
      FieldName = 'ID_PAIS'
      DisplayFormat = '00000'
    end
    object cltMoedaNM_PAIS: TcprStringField
      FieldName = 'NM_PAIS'
      ProviderFlags = []
      Size = 50
    end
    object cltMoedaFL_SIMBOLO: TcprStringField
      FieldName = 'FL_SIMBOLO'
      Size = 5
    end
    object cltMoedaDS_MOEDA_CONSULTA: TcprStringField
      FieldName = 'DS_MOEDA_CONSULTA'
      Size = 100
    end
    object cltMoedaFL_NACIONAL: TcprStringField
      FieldName = 'FL_NACIONAL'
      FixedChar = True
      Size = 1
    end
    object cltMoedaDS_NACIONAL: TcprStringField
      FieldName = 'DS_NACIONAL'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltMoedaFL_FIXO: TcprStringField
      FieldName = 'FL_FIXO'
      FixedChar = True
      Size = 1
    end
    object cltMoedaDS_FIXO: TcprStringField
      FieldName = 'DS_FIXO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltMoedaFL_TIPO_COTACAO: TcprStringField
      FieldName = 'FL_TIPO_COTACAO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltMoedaDS_TIPO_COTACAO: TcprStringField
      FieldName = 'DS_TIPO_COTACAO'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
  end
  object dtsCombustivelConsulta: TsmDataset
    CommandText = 
      'select vw.id_combustivel'#13#10'      ,vw.ds_combustivel'#13#10'      ,vw.nr' +
      '_combustivel'#13#10'      ,vw.id_combustivel_referente'#13#10'      ,vw.ds_p' +
      'lano_combustivel'#13#10'      ,vw.id_unidademedida'#13#10'      ,vw.sg_medid' +
      'a'#13#10'      ,vw.fl_tipo'#13#10'      ,vw.fl_tipo_interno'#13#10'from VW_LST_COM' +
      'BUSTIVEL_CONSULTA vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'COMBUSTIVEL'
    Left = 533
    Top = 553
    object dtsCombustivelConsultaID_COMBUSTIVEL: TIntegerField
      Tag = 1
      FieldName = 'ID_COMBUSTIVEL'
    end
    object dtsCombustivelConsultaDS_COMBUSTIVEL: TStringField
      FieldName = 'DS_COMBUSTIVEL'
      Size = 200
    end
    object dtsCombustivelConsultaNR_COMBUSTIVEL: TIntegerField
      FieldName = 'NR_COMBUSTIVEL'
    end
    object dtsCombustivelConsultaID_COMBUSTIVEL_REFERENTE: TIntegerField
      FieldName = 'ID_COMBUSTIVEL_REFERENTE'
    end
    object dtsCombustivelConsultaDS_PLANO_COMBUSTIVEL: TStringField
      FieldName = 'DS_PLANO_COMBUSTIVEL'
      Size = 35
    end
    object dtsCombustivelConsultaID_UNIDADEMEDIDA: TSmallintField
      FieldName = 'ID_UNIDADEMEDIDA'
    end
    object dtsCombustivelConsultaSG_MEDIDA: TStringField
      FieldName = 'SG_MEDIDA'
      Size = 10
    end
    object dtsCombustivelConsultaFL_TIPO: TStringField
      FieldName = 'FL_TIPO'
      Size = 15
    end
    object dtsCombustivelConsultaFL_TIPO_INTERNO: TStringField
      FieldName = 'FL_TIPO_INTERNO'
      FixedChar = True
      Size = 1
    end
  end
  object pvdCombustivelConsulta: TsmProvider
    DataSet = dtsCombustivelConsulta
    OnGetTableName = pvdCorGetTableName
    Left = 603
    Top = 552
  end
  object cltCombustivelConsulta: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdCombustivelConsulta'
    TabelaPrincipal = 'COMBUSTIVEL'
    Left = 669
    Top = 552
    object cltCombustivelConsultaID_COMBUSTIVEL: TcprIntegerField
      Tag = 1
      FieldName = 'ID_COMBUSTIVEL'
    end
    object cltCombustivelConsultaDS_COMBUSTIVEL: TcprStringField
      FieldName = 'DS_COMBUSTIVEL'
      Size = 200
    end
    object cltCombustivelConsultaNR_COMBUSTIVEL: TcprIntegerField
      FieldName = 'NR_COMBUSTIVEL'
    end
    object cltCombustivelConsultaID_COMBUSTIVEL_REFERENTE: TcprIntegerField
      FieldName = 'ID_COMBUSTIVEL_REFERENTE'
    end
    object cltCombustivelConsultaDS_PLANO_COMBUSTIVEL: TcprStringField
      FieldName = 'DS_PLANO_COMBUSTIVEL'
      Size = 35
    end
    object cltCombustivelConsultaID_UNIDADEMEDIDA: TcprSmallintField
      FieldName = 'ID_UNIDADEMEDIDA'
    end
    object cltCombustivelConsultaSG_MEDIDA: TcprStringField
      FieldName = 'SG_MEDIDA'
      Size = 10
    end
    object cltCombustivelConsultaFL_TIPO: TcprStringField
      FieldName = 'FL_TIPO'
      Size = 15
    end
    object cltCombustivelConsultaFL_TIPO_INTERNO: TcprStringField
      FieldName = 'FL_TIPO_INTERNO'
      FixedChar = True
      Size = 1
    end
  end
  object dtsCoeficiente: TsmDataset
    CommandText = 
      'select vw.id_coeficiente, vw.ds_coeficiente, vw.vl_coeficiente'#13#10 +
      'from VW_LST_COEFICIENTE vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'COEFICIENTE'
    Left = 289
    Top = 685
    object dtsCoeficienteID_COEFICIENTE: TSmallintField
      FieldName = 'ID_COEFICIENTE'
      ProviderFlags = []
    end
    object dtsCoeficienteDS_COEFICIENTE: TStringField
      FieldName = 'DS_COEFICIENTE'
      ProviderFlags = []
      Size = 100
    end
    object dtsCoeficienteVL_COEFICIENTE: TFloatField
      FieldName = 'VL_COEFICIENTE'
      ProviderFlags = []
    end
  end
  object pvdCoeficiente: TsmProvider
    DataSet = dtsCoeficiente
    OnGetTableName = pvdCoeficienteGetTableName
    Left = 359
    Top = 684
  end
  object cltCoeficiente: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdCoeficiente'
    TabelaPrincipal = 'COEFICIENTE'
    Left = 425
    Top = 684
    object cltCoeficienteID_COEFICIENTE: TcprSmallintField
      Tag = 1
      FieldName = 'ID_COEFICIENTE'
      ProviderFlags = [pfInKey]
      DisplayFormat = '000'
    end
    object cltCoeficienteDS_COEFICIENTE: TcprStringField
      FieldName = 'DS_COEFICIENTE'
      ProviderFlags = []
      Size = 100
    end
    object cltCoeficienteVL_COEFICIENTE: TcprFloatField
      FieldName = 'VL_COEFICIENTE'
      ProviderFlags = []
      DisplayFormat = '#,##0.00000'
    end
  end
  object pvdPessoaTransportadora: TsmProvider
    DataSet = dtsPessoaTransportadora
    Options = [poAutoRefresh]
    OnGetTableName = pvdPessoaTransportadoraGetTableName
    Left = 357
    Top = 330
  end
  object dtsPessoaTransportadora: TsmDataset
    CommandText = 
      'select vw.id_pessoa'#13#10'      ,vw.id_pessoa_transportadora'#13#10'      ,' +
      'vw.ds_placa'#13#10'      ,vw.ds_modelo'#13#10'      ,vw.fl_ativo'#13#10'      ,vw.' +
      'ds_ativo'#13#10'      ,vw.id_uf'#13#10'      ,vw.sg_uf'#13#10'      ,vw.nm_uf'#13#10'fro' +
      'm VW_LST_PESSOA_TRANSPORTADORA vw'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Con
    Left = 285
    Top = 330
    object dtsPessoaTransportadoraID_PESSOA_TRANSPORTADORA: TSmallintField
      FieldName = 'ID_PESSOA_TRANSPORTADORA'
      ProviderFlags = []
    end
    object dtsPessoaTransportadoraDS_PLACA: TStringField
      FieldName = 'DS_PLACA'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object dtsPessoaTransportadoraDS_MODELO: TStringField
      FieldName = 'DS_MODELO'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaTransportadoraFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsPessoaTransportadoraID_UF: TIntegerField
      FieldName = 'ID_UF'
      ProviderFlags = []
    end
    object dtsPessoaTransportadoraSG_UF: TStringField
      FieldName = 'SG_UF'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object dtsPessoaTransportadoraNM_UF: TStringField
      FieldName = 'NM_UF'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaTransportadoraID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = []
    end
    object dtsPessoaTransportadoraDS_ATIVO: TStringField
      FieldName = 'DS_ATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
  end
  object cltPessoaTransportadora: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdPessoaTransportadora'
    TabelaPrincipal = 'PESSOA_TRANSPORTADORA'
    Left = 428
    Top = 330
    object cltPessoaTransportadoraID_PESSOA_TRANSPORTADORA: TcprSmallintField
      Tag = 1
      Alignment = taCenter
      FieldName = 'ID_PESSOA_TRANSPORTADORA'
      ProviderFlags = []
      DisplayFormat = '000'
    end
    object cltPessoaTransportadoraDS_PLACA: TcprStringField
      FieldName = 'DS_PLACA'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object cltPessoaTransportadoraDS_MODELO: TcprStringField
      FieldName = 'DS_MODELO'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaTransportadoraFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltPessoaTransportadoraID_UF: TcprIntegerField
      Alignment = taCenter
      FieldName = 'ID_UF'
      ProviderFlags = []
      DisplayFormat = '000'
    end
    object cltPessoaTransportadoraSG_UF: TcprStringField
      FieldName = 'SG_UF'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object cltPessoaTransportadoraNM_UF: TcprStringField
      FieldName = 'NM_UF'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaTransportadoraID_PESSOA: TcprIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = []
    end
    object cltPessoaTransportadoraDS_ATIVO: TcprStringField
      FieldName = 'DS_ATIVO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
  end
  object dtsFaca: TsmDataset
    CommandText = 
      'select vw.id_faca'#13#10'      ,vw.ds_faca'#13#10'      ,vw.nr_faca'#13#10'      ,' +
      'vw.fl_faca_tipo'#13#10'      ,vw.ds_faca_tipo'#13#10'from VW_LST_FACA vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'FACA'
    Left = 289
    Top = 730
    object dtsFacaID_FACA: TSmallintField
      Tag = 1
      FieldName = 'ID_FACA'
      ProviderFlags = [pfInKey]
    end
    object dtsFacaDS_FACA: TStringField
      FieldName = 'DS_FACA'
      ProviderFlags = []
      Size = 100
    end
    object dtsFacaNR_FACA: TIntegerField
      FieldName = 'NR_FACA'
      ProviderFlags = []
    end
    object dtsFacaFL_FACA_TIPO: TStringField
      FieldName = 'FL_FACA_TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsFacaDS_FACA_TIPO: TStringField
      FieldName = 'DS_FACA_TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
  end
  object pvdFaca: TsmProvider
    DataSet = dtsFaca
    OnGetTableName = pvdFacaGetTableName
    Left = 359
    Top = 729
  end
  object cltFaca: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdFaca'
    TabelaPrincipal = 'FACA'
    Left = 425
    Top = 729
    object cltFacaID_FACA: TcprSmallintField
      Tag = 1
      FieldName = 'ID_FACA'
      ProviderFlags = [pfInKey]
    end
    object cltFacaDS_FACA: TcprStringField
      FieldName = 'DS_FACA'
      ProviderFlags = []
      Size = 100
    end
    object cltFacaNR_FACA: TcprIntegerField
      FieldName = 'NR_FACA'
      ProviderFlags = []
    end
    object cltFacaFL_FACA_TIPO: TcprStringField
      FieldName = 'FL_FACA_TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltFacaDS_FACA_TIPO: TcprStringField
      FieldName = 'DS_FACA_TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
  end
  object dtsEmbalagem: TsmDataset
    CommandText = 
      'select vw.id_embalagem'#13#10'      ,vw.ds_embalagem'#13#10'      ,vw.vl_pes' +
      'o'#13#10'      ,vw.id_unidade_medida'#13#10'      ,vw.sg_unidade_medida'#13#10'   ' +
      '   ,vw.nm_unidade_medida'#13#10'      ,vw.qt_unidade'#13#10'      ,vw.vl_val' +
      'or'#13#10'      ,vw.vl_valor_padrao_kg'#13#10'      ,vw.vl_valor_padrao_m3'#13#10 +
      '      ,vw.fl_ativo'#13#10'      ,vw.fl_ativo_ext'#13#10'from VW_LST_EMBALAGE' +
      'M vw'#13#10
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'EMBALAGEM'
    Left = 534
    Top = 693
    object dtsEmbalagemID_EMBALAGEM: TIntegerField
      Tag = 1
      FieldName = 'ID_EMBALAGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsEmbalagemDS_EMBALAGEM: TStringField
      FieldName = 'DS_EMBALAGEM'
      Size = 30
    end
    object dtsEmbalagemVL_PESO: TFloatField
      FieldName = 'VL_PESO'
    end
    object dtsEmbalagemID_UNIDADE_MEDIDA: TSmallintField
      FieldName = 'ID_UNIDADE_MEDIDA'
    end
    object dtsEmbalagemSG_UNIDADE_MEDIDA: TStringField
      FieldName = 'SG_UNIDADE_MEDIDA'
      FixedChar = True
      Size = 10
    end
    object dtsEmbalagemNM_UNIDADE_MEDIDA: TStringField
      FieldName = 'NM_UNIDADE_MEDIDA'
      Size = 80
    end
    object dtsEmbalagemQT_UNIDADE: TFloatField
      FieldName = 'QT_UNIDADE'
    end
    object dtsEmbalagemVL_VALOR: TFloatField
      FieldName = 'VL_VALOR'
    end
    object dtsEmbalagemVL_VALOR_PADRAO_KG: TFloatField
      FieldName = 'VL_VALOR_PADRAO_KG'
    end
    object dtsEmbalagemVL_VALOR_PADRAO_M3: TFloatField
      FieldName = 'VL_VALOR_PADRAO_M3'
    end
    object dtsEmbalagemFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object dtsEmbalagemFL_ATIVO_EXT: TStringField
      FieldName = 'FL_ATIVO_EXT'
      FixedChar = True
      Size = 3
    end
  end
  object pvdEmbalagem: TsmProvider
    DataSet = dtsEmbalagem
    OnGetTableName = pvdCorGetTableName
    Left = 604
    Top = 692
  end
  object cltEmbalagem: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdEmbalagem'
    TabelaPrincipal = 'EMBALAGEM'
    Left = 670
    Top = 692
    object cltEmbalagemID_EMBALAGEM: TcprIntegerField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_EMBALAGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '00000'
    end
    object cltEmbalagemDS_EMBALAGEM: TcprStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DS_EMBALAGEM'
      Size = 30
    end
    object cltEmbalagemVL_PESO: TcprFloatField
      DisplayLabel = 'Peso (Kg)'
      FieldName = 'VL_PESO'
      DisplayFormat = '#,###0.000'
    end
    object cltEmbalagemID_UNIDADE_MEDIDA: TcprSmallintField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo da unidade de medida'
      FieldName = 'ID_UNIDADE_MEDIDA'
      DisplayFormat = '000'
    end
    object cltEmbalagemSG_UNIDADE_MEDIDA: TcprStringField
      DisplayLabel = 'Sigla da unidade de medida'
      FieldName = 'SG_UNIDADE_MEDIDA'
      FixedChar = True
      Size = 10
    end
    object cltEmbalagemNM_UNIDADE_MEDIDA: TcprStringField
      DisplayLabel = 'Nome da unidade de medida'
      FieldName = 'NM_UNIDADE_MEDIDA'
      Size = 80
    end
    object cltEmbalagemQT_UNIDADE: TcprFloatField
      DisplayLabel = 'Capacidade'
      FieldName = 'QT_UNIDADE'
      DisplayFormat = '#,###0.000'
    end
    object cltEmbalagemVL_VALOR: TcprFloatField
      DisplayLabel = 'Valor extra'
      FieldName = 'VL_VALOR'
      DisplayFormat = '#,##0.00'
    end
    object cltEmbalagemVL_VALOR_PADRAO_KG: TcprFloatField
      FieldName = 'VL_VALOR_PADRAO_KG'
      DisplayFormat = '#,##0.00'
    end
    object cltEmbalagemVL_VALOR_PADRAO_M3: TcprFloatField
      FieldName = 'VL_VALOR_PADRAO_M3'
      DisplayFormat = '#,##0.00'
    end
    object cltEmbalagemFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object cltEmbalagemFL_ATIVO_EXT: TcprStringField
      Alignment = taCenter
      FieldName = 'FL_ATIVO_EXT'
      FixedChar = True
      Size = 3
    end
  end
  object dtsGuiaColeta: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado'#13#10'      ,vw.id_guia_coleta'#13#10'      ,vw.i' +
      'd_cliente'#13#10'      ,vw.nm_cliente'#13#10'      ,vw.id_plano_conta'#13#10'     ' +
      ' ,vw.ds_plano_conta'#13#10'      ,vw.dt_data_geracao'#13#10'      ,vw.vl_val' +
      'or'#13#10'      ,vw.fl_situacao'#13#10'      ,vw.ds_situacao'#13#10'      ,vw.id_e' +
      'mpresa'#13#10'      ,vw.fl_gerar_financeiro'#13#10'      ,vw.ds_cidade_uf_co' +
      'branca'#13#10'      ,vw.dt_data_faturamento'#13#10'      ,vw.id_plano_conta_' +
      'taxa'#13#10'      ,vw.ds_plano_conta_taxa'#13#10'      ,vw.vl_valor_taxa'#13#10'  ' +
      '    ,vw.fl_gerado_nfs'#13#10'      ,case vw.fl_gerado_nfs when '#39'N'#39' the' +
      'n '#39'N'#227'o'#39' when '#39'P'#39' then '#39'Parcial'#39' else '#39'Sim'#39' end as ds_gerado_nfs'#13 +
      #10'from VW_LST_GUIA_COLETA vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'GUIA_COLETA'
    Left = 534
    Top = 741
    object dtsGuiaColetaSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsGuiaColetaID_GUIA_COLETA: TIntegerField
      Tag = 1
      FieldName = 'ID_GUIA_COLETA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsGuiaColetaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      ProviderFlags = []
    end
    object dtsGuiaColetaNM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      ProviderFlags = []
      Size = 100
    end
    object dtsGuiaColetaID_PLANO_CONTA: TIntegerField
      FieldName = 'ID_PLANO_CONTA'
      ProviderFlags = []
    end
    object dtsGuiaColetaDS_PLANO_CONTA: TStringField
      FieldName = 'DS_PLANO_CONTA'
      ProviderFlags = []
      Size = 120
    end
    object dtsGuiaColetaDT_DATA_GERACAO: TDateField
      FieldName = 'DT_DATA_GERACAO'
      ProviderFlags = []
    end
    object dtsGuiaColetaVL_VALOR: TFloatField
      FieldName = 'VL_VALOR'
      ProviderFlags = []
    end
    object dtsGuiaColetaFL_SITUACAO: TStringField
      FieldName = 'FL_SITUACAO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsGuiaColetaDS_SITUACAO: TStringField
      FieldName = 'DS_SITUACAO'
      ProviderFlags = []
      FixedChar = True
      Size = 9
    end
    object dtsGuiaColetaID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      ProviderFlags = []
    end
    object dtsGuiaColetaFL_GERAR_FINANCEIRO: TStringField
      FieldName = 'FL_GERAR_FINANCEIRO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsGuiaColetaDS_CIDADE_UF_COBRANCA: TStringField
      FieldName = 'DS_CIDADE_UF_COBRANCA'
      ProviderFlags = []
      Size = 103
    end
    object dtsGuiaColetaDT_DATA_FATURAMENTO: TDateField
      FieldName = 'DT_DATA_FATURAMENTO'
      ProviderFlags = []
    end
    object dtsGuiaColetaID_PLANO_CONTA_TAXA: TIntegerField
      FieldName = 'ID_PLANO_CONTA_TAXA'
      ProviderFlags = []
    end
    object dtsGuiaColetaDS_PLANO_CONTA_TAXA: TStringField
      FieldName = 'DS_PLANO_CONTA_TAXA'
      ProviderFlags = []
      Size = 120
    end
    object dtsGuiaColetaVL_VALOR_TAXA: TFloatField
      FieldName = 'VL_VALOR_TAXA'
      ProviderFlags = []
    end
    object dtsGuiaColetaFL_GERADO_NFS: TStringField
      FieldName = 'FL_GERADO_NFS'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsGuiaColetaDS_GERADO_NFS: TStringField
      FieldName = 'DS_GERADO_NFS'
      ProviderFlags = []
      FixedChar = True
      Size = 7
    end
  end
  object pvdGuiaColeta: TsmProvider
    DataSet = dtsGuiaColeta
    OnGetTableName = pvdCorGetTableName
    Left = 604
    Top = 740
  end
  object cltGuiaColeta: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdGuiaColeta'
    TabelaPrincipal = 'GUIA_COLETA'
    Left = 670
    Top = 740
    object cltGuiaColetaSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltGuiaColetaID_GUIA_COLETA: TcprIntegerField
      Tag = 1
      FieldName = 'ID_GUIA_COLETA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '00000'
    end
    object cltGuiaColetaID_CLIENTE: TcprIntegerField
      FieldName = 'ID_CLIENTE'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltGuiaColetaNM_CLIENTE: TcprStringField
      FieldName = 'NM_CLIENTE'
      ProviderFlags = []
      Size = 100
    end
    object cltGuiaColetaID_PLANO_CONTA: TcprIntegerField
      FieldName = 'ID_PLANO_CONTA'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltGuiaColetaDS_PLANO_CONTA: TcprStringField
      FieldName = 'DS_PLANO_CONTA'
      ProviderFlags = []
      Size = 120
    end
    object cltGuiaColetaDT_DATA_GERACAO: TcprDateField
      FieldName = 'DT_DATA_GERACAO'
      ProviderFlags = []
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cltGuiaColetaVL_VALOR: TcprFloatField
      FieldName = 'VL_VALOR'
      ProviderFlags = []
      DisplayFormat = '#,##0.00'
    end
    object cltGuiaColetaFL_SITUACAO: TcprStringField
      FieldName = 'FL_SITUACAO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltGuiaColetaDS_SITUACAO: TcprStringField
      FieldName = 'DS_SITUACAO'
      ProviderFlags = []
      FixedChar = True
      Size = 9
    end
    object cltGuiaColetaID_EMPRESA: TcprIntegerField
      FieldName = 'ID_EMPRESA'
      ProviderFlags = []
    end
    object cltGuiaColetaFL_GERAR_FINANCEIRO: TcprStringField
      FieldName = 'FL_GERAR_FINANCEIRO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltGuiaColetaDS_CIDADE_UF_COBRANCA: TcprStringField
      FieldName = 'DS_CIDADE_UF_COBRANCA'
      ProviderFlags = []
      Size = 103
    end
    object cltGuiaColetaDT_DATA_FATURAMENTO: TcprDateField
      FieldName = 'DT_DATA_FATURAMENTO'
      ProviderFlags = []
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cltGuiaColetaID_PLANO_CONTA_TAXA: TcprIntegerField
      FieldName = 'ID_PLANO_CONTA_TAXA'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltGuiaColetaDS_PLANO_CONTA_TAXA: TcprStringField
      FieldName = 'DS_PLANO_CONTA_TAXA'
      ProviderFlags = []
      Size = 120
    end
    object cltGuiaColetaVL_VALOR_TAXA: TcprFloatField
      FieldName = 'VL_VALOR_TAXA'
      ProviderFlags = []
      DisplayFormat = '#,##0.00'
    end
    object cltGuiaColetaFL_GERADO_NFS: TcprStringField
      FieldName = 'FL_GERADO_NFS'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltGuiaColetaDS_GERADO_NFS: TcprStringField
      FieldName = 'DS_GERADO_NFS'
      ProviderFlags = []
      FixedChar = True
      Size = 7
    end
  end
  object dtsManifestoColeta: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado'#13#10'      ,vw.id_manifesto_coleta'#13#10'      ' +
      ',vw.id_cliente'#13#10'      ,vw.nm_cliente'#13#10'      ,vw.id_unidade'#13#10'    ' +
      '  ,vw.nm_unidade'#13#10'      ,vw.ds_cidade_uf_coleta'#13#10'      ,vw.id_ve' +
      'iculo'#13#10'      ,vw.ds_placa'#13#10'      ,vw.id_motorista'#13#10'      ,vw.nm_' +
      'motorista'#13#10'      ,vw.id_local_destino'#13#10'      ,vw.nm_local_destin' +
      'o'#13#10'      ,vw.dt_data_emissao'#13#10'      ,vw.dt_data_coleta'#13#10'      ,v' +
      'w.dt_data_previsao'#13#10'      ,vw.fl_guia_gerada'#13#10'      ,case when v' +
      'w.fl_guia_gerada = '#39'S'#39' then '#39'Sim'#39' else '#39'N'#227'o'#39' end ds_guia_gerada'#13 +
      #10'      ,vw.id_empresa'#13#10'      ,vw.ds_cidade_uf_cobranca'#13#10'      ,v' +
      'w.nr_vale'#13#10'      ,vw.ds_bairro'#13#10'      ,vw.fl_destinacao_final'#13#10' ' +
      '     ,case vw.fl_destinacao_final when '#39'A'#39' then '#39'Aberta'#39' when '#39'E' +
      #39' then '#39'Expedida'#39' when '#39'F'#39' then '#39'Finalizada'#39' else '#39'Nenhuma'#39' end ' +
      'as ds_destinacao_final'#13#10'      ,vw.id_local_destino_final'#13#10'      ' +
      ',vw.nm_local_destino_final'#13#10'      ,vw.ds_observacao'#13#10'      ,vw.n' +
      'm_fantasia'#13#10'      ,vw.nr_numero_mtr'#13#10'from VW_LST_MANIFESTO_COLET' +
      'A vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'MANIFESTO_COLETA'
    Left = 38
    Top = 720
    object dtsManifestoColetaSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsManifestoColetaID_MANIFESTO_COLETA: TIntegerField
      Tag = 1
      FieldName = 'ID_MANIFESTO_COLETA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsManifestoColetaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      ProviderFlags = []
    end
    object dtsManifestoColetaNM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      ProviderFlags = []
      Size = 100
    end
    object dtsManifestoColetaID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      ProviderFlags = []
    end
    object dtsManifestoColetaNM_UNIDADE: TStringField
      FieldName = 'NM_UNIDADE'
      ProviderFlags = []
      Size = 100
    end
    object dtsManifestoColetaDS_CIDADE_UF_COLETA: TStringField
      FieldName = 'DS_CIDADE_UF_COLETA'
      ProviderFlags = []
      Size = 103
    end
    object dtsManifestoColetaID_VEICULO: TIntegerField
      FieldName = 'ID_VEICULO'
      ProviderFlags = []
    end
    object dtsManifestoColetaDS_PLACA: TStringField
      FieldName = 'DS_PLACA'
      ProviderFlags = []
      Size = 8
    end
    object dtsManifestoColetaID_MOTORISTA: TIntegerField
      FieldName = 'ID_MOTORISTA'
      ProviderFlags = []
    end
    object dtsManifestoColetaNM_MOTORISTA: TStringField
      FieldName = 'NM_MOTORISTA'
      ProviderFlags = []
      Size = 100
    end
    object dtsManifestoColetaID_LOCAL_DESTINO: TIntegerField
      FieldName = 'ID_LOCAL_DESTINO'
      ProviderFlags = []
    end
    object dtsManifestoColetaNM_LOCAL_DESTINO: TStringField
      FieldName = 'NM_LOCAL_DESTINO'
      ProviderFlags = []
      Size = 100
    end
    object dtsManifestoColetaDT_DATA_EMISSAO: TSQLTimeStampField
      FieldName = 'DT_DATA_EMISSAO'
      ProviderFlags = []
    end
    object dtsManifestoColetaDT_DATA_COLETA: TSQLTimeStampField
      FieldName = 'DT_DATA_COLETA'
      ProviderFlags = []
    end
    object dtsManifestoColetaDT_DATA_PREVISAO: TDateField
      FieldName = 'DT_DATA_PREVISAO'
      ProviderFlags = []
    end
    object dtsManifestoColetaFL_GUIA_GERADA: TStringField
      FieldName = 'FL_GUIA_GERADA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsManifestoColetaDS_GUIA_GERADA: TStringField
      FieldName = 'DS_GUIA_GERADA'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsManifestoColetaID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      ProviderFlags = []
    end
    object dtsManifestoColetaDS_CIDADE_UF_COBRANCA: TStringField
      FieldName = 'DS_CIDADE_UF_COBRANCA'
      ProviderFlags = []
      Size = 103
    end
    object dtsManifestoColetaNR_VALE: TIntegerField
      FieldName = 'NR_VALE'
    end
    object dtsManifestoColetaDS_BAIRRO: TStringField
      FieldName = 'DS_BAIRRO'
      ProviderFlags = []
      Size = 100
    end
    object dtsManifestoColetaFL_DESTINACAO_FINAL: TStringField
      FieldName = 'FL_DESTINACAO_FINAL'
      ProviderFlags = []
      Size = 3
    end
    object dtsManifestoColetaDS_DESTINACAO_FINAL: TStringField
      FieldName = 'DS_DESTINACAO_FINAL'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object dtsManifestoColetaID_LOCAL_DESTINO_FINAL: TIntegerField
      FieldName = 'ID_LOCAL_DESTINO_FINAL'
      ProviderFlags = []
    end
    object dtsManifestoColetaNM_LOCAL_DESTINO_FINAL: TStringField
      FieldName = 'NM_LOCAL_DESTINO_FINAL'
      ProviderFlags = []
      Size = 100
    end
    object dtsManifestoColetaDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      ProviderFlags = []
      Size = 1000
    end
    object dtsManifestoColetaNM_FANTASIA: TStringField
      FieldName = 'NM_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
    object dtsManifestoColetaNR_NUMERO_MTR: TIntegerField
      FieldName = 'NR_NUMERO_MTR'
      ProviderFlags = []
    end
  end
  object pvdManifestoColeta: TsmProvider
    DataSet = dtsManifestoColeta
    OnGetTableName = pvdCorGetTableName
    Left = 108
    Top = 719
  end
  object cltManifestoColeta: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdManifestoColeta'
    TabelaPrincipal = 'MANIFESTO_COLETA'
    Left = 174
    Top = 719
    object cltManifestoColetaSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltManifestoColetaID_MANIFESTO_COLETA: TcprIntegerField
      Tag = 1
      FieldName = 'ID_MANIFESTO_COLETA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '00000'
    end
    object cltManifestoColetaID_CLIENTE: TcprIntegerField
      FieldName = 'ID_CLIENTE'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltManifestoColetaNM_CLIENTE: TcprStringField
      FieldName = 'NM_CLIENTE'
      ProviderFlags = []
      Size = 100
    end
    object cltManifestoColetaID_UNIDADE: TcprIntegerField
      FieldName = 'ID_UNIDADE'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltManifestoColetaNM_UNIDADE: TcprStringField
      FieldName = 'NM_UNIDADE'
      ProviderFlags = []
      Size = 100
    end
    object cltManifestoColetaDS_CIDADE_UF_COLETA: TcprStringField
      FieldName = 'DS_CIDADE_UF_COLETA'
      ProviderFlags = []
      Size = 103
    end
    object cltManifestoColetaID_VEICULO: TcprIntegerField
      FieldName = 'ID_VEICULO'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltManifestoColetaDS_PLACA: TcprStringField
      FieldName = 'DS_PLACA'
      ProviderFlags = []
      Size = 8
    end
    object cltManifestoColetaID_MOTORISTA: TcprIntegerField
      FieldName = 'ID_MOTORISTA'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltManifestoColetaNM_MOTORISTA: TcprStringField
      FieldName = 'NM_MOTORISTA'
      ProviderFlags = []
      Size = 100
    end
    object cltManifestoColetaID_LOCAL_DESTINO: TcprIntegerField
      FieldName = 'ID_LOCAL_DESTINO'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltManifestoColetaNM_LOCAL_DESTINO: TcprStringField
      FieldName = 'NM_LOCAL_DESTINO'
      ProviderFlags = []
      Size = 100
    end
    object cltManifestoColetaDT_DATA_EMISSAO: TcprSQLTimeStampField
      FieldName = 'DT_DATA_EMISSAO'
      ProviderFlags = []
      DisplayFormat = 'dd/mm/yyyy hh:nn'
    end
    object cltManifestoColetaDT_DATA_COLETA: TcprSQLTimeStampField
      FieldName = 'DT_DATA_COLETA'
      ProviderFlags = []
      DisplayFormat = 'dd/mm/yyyy hh:nn'
    end
    object cltManifestoColetaDT_DATA_PREVISAO: TcprDateField
      FieldName = 'DT_DATA_PREVISAO'
      ProviderFlags = []
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cltManifestoColetaFL_GUIA_GERADA: TcprStringField
      FieldName = 'FL_GUIA_GERADA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltManifestoColetaDS_GUIA_GERADA: TcprStringField
      FieldName = 'DS_GUIA_GERADA'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltManifestoColetaID_EMPRESA: TcprIntegerField
      FieldName = 'ID_EMPRESA'
      ProviderFlags = []
    end
    object cltManifestoColetaDS_CIDADE_UF_COBRANCA: TcprStringField
      FieldName = 'DS_CIDADE_UF_COBRANCA'
      ProviderFlags = []
      Size = 103
    end
    object cltManifestoColetaNR_VALE: TcprIntegerField
      FieldName = 'NR_VALE'
      DisplayFormat = '00000'
    end
    object cltManifestoColetaDS_BAIRRO: TcprStringField
      FieldName = 'DS_BAIRRO'
      ProviderFlags = []
      Size = 100
    end
    object cltManifestoColetaFL_DESTINACAO_FINAL: TcprStringField
      FieldName = 'FL_DESTINACAO_FINAL'
      ProviderFlags = []
      Size = 3
    end
    object cltManifestoColetaDS_DESTINACAO_FINAL: TcprStringField
      FieldName = 'DS_DESTINACAO_FINAL'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object cltManifestoColetaID_LOCAL_DESTINO_FINAL: TcprIntegerField
      FieldName = 'ID_LOCAL_DESTINO_FINAL'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltManifestoColetaNM_LOCAL_DESTINO_FINAL: TcprStringField
      FieldName = 'NM_LOCAL_DESTINO_FINAL'
      ProviderFlags = []
      Size = 100
    end
    object cltManifestoColetaDS_OBSERVACAO: TcprStringField
      FieldName = 'DS_OBSERVACAO'
      ProviderFlags = []
      Size = 1000
    end
    object cltManifestoColetaNM_FANTASIA: TcprStringField
      FieldName = 'NM_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
    object cltManifestoColetaNR_NUMERO_MTR: TcprIntegerField
      FieldName = 'NR_NUMERO_MTR'
      ProviderFlags = []
    end
  end
  object dtsTorre: TsmDataset
    CommandText = 'select id_torre'#13#10'      ,ds_torre'#13#10'from vw_lst_torre'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'COR'
    Left = 534
    Top = 789
    object dtsTorreID_TORRE: TIntegerField
      Tag = 1
      FieldName = 'ID_TORRE'
      ProviderFlags = [pfInKey]
    end
    object dtsTorreDS_TORRE: TStringField
      FieldName = 'DS_TORRE'
      ProviderFlags = []
      Size = 100
    end
  end
  object pvdTorre: TsmProvider
    DataSet = dtsTorre
    OnGetTableName = pvdTorreGetTableName
    Left = 604
    Top = 788
  end
  object cltTorre: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdTorre'
    TabelaPrincipal = 'TORRE'
    Left = 670
    Top = 788
    object cltTorreID_TORRE: TcprIntegerField
      Tag = 1
      FieldName = 'ID_TORRE'
      ProviderFlags = [pfInKey]
    end
    object cltTorreDS_TORRE: TcprStringField
      FieldName = 'DS_TORRE'
      ProviderFlags = []
      Size = 100
    end
  end
  object dtsTipoResiduo: TsmDataset
    CommandText = 
      'select vw.id_informacao_residuo'#13#10'      ,vw.fl_tipo'#13#10'      ,vw.ds' +
      '_descricao'#13#10'      ,vw.nr_conama'#13#10'from VW_LST_INFORMACAO_RESIDUO ' +
      'vw'#13#10'where vw.fl_tipo = '#39'TIP'#39
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'INFORMACAO_RESIDUO'
    Left = 38
    Top = 776
    object dtsTipoResiduoID_INFORMACAO_RESIDUO: TSmallintField
      Tag = 1
      FieldName = 'ID_INFORMACAO_RESIDUO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsTipoResiduoFL_TIPO: TStringField
      FieldName = 'FL_TIPO'
      FixedChar = True
      Size = 3
    end
    object dtsTipoResiduoDS_DESCRICAO: TStringField
      FieldName = 'DS_DESCRICAO'
      Size = 80
    end
    object dtsTipoResiduoNR_CONAMA: TStringField
      FieldName = 'NR_CONAMA'
      FixedChar = True
      Size = 4
    end
  end
  object pvdTipoResiduo: TsmProvider
    DataSet = dtsTipoResiduo
    OnGetTableName = pvdCorGetTableName
    Left = 108
    Top = 775
  end
  object cltTipoResiduo: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdTipoResiduo'
    TabelaPrincipal = 'INFORMACAO_RESIDUO'
    Left = 174
    Top = 775
    object cltTipoResiduoID_INFORMACAO_RESIDUO: TcprSmallintField
      Tag = 1
      FieldName = 'ID_INFORMACAO_RESIDUO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '0000'
    end
    object cltTipoResiduoFL_TIPO: TcprStringField
      FieldName = 'FL_TIPO'
      FixedChar = True
      Size = 3
    end
    object cltTipoResiduoDS_DESCRICAO: TcprStringField
      FieldName = 'DS_DESCRICAO'
      Size = 80
    end
    object cltTipoResiduoNR_CONAMA: TcprStringField
      FieldName = 'NR_CONAMA'
      FixedChar = True
      Size = 4
    end
  end
  object dtsDestinacaoResiduo: TsmDataset
    CommandText = 
      'select vw.id_informacao_residuo'#13#10'      ,vw.fl_tipo'#13#10'      ,vw.ds' +
      '_descricao'#13#10'from VW_LST_INFORMACAO_RESIDUO vw'#13#10'where vw.fl_tipo ' +
      '= '#39'DES'#39
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'INFORMACAO_RESIDUO'
    Left = 286
    Top = 784
    object SmallintField3: TSmallintField
      Tag = 1
      FieldName = 'ID_INFORMACAO_RESIDUO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object StringField3: TStringField
      FieldName = 'FL_TIPO'
      FixedChar = True
      Size = 3
    end
    object StringField4: TStringField
      FieldName = 'DS_DESCRICAO'
      Size = 80
    end
  end
  object pvdDestinacaoResiduo: TsmProvider
    DataSet = dtsDestinacaoResiduo
    OnGetTableName = pvdCorGetTableName
    Left = 356
    Top = 783
  end
  object cltDestinacaoResiduo: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdDestinacaoResiduo'
    TabelaPrincipal = 'INFORMACAO_RESIDUO'
    Left = 422
    Top = 783
    object cprSmallintField3: TcprSmallintField
      Tag = 1
      FieldName = 'ID_INFORMACAO_RESIDUO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '0000'
    end
    object cprStringField15: TcprStringField
      FieldName = 'FL_TIPO'
      FixedChar = True
      Size = 3
    end
    object cprStringField16: TcprStringField
      FieldName = 'DS_DESCRICAO'
      Size = 80
    end
  end
  object dtsCertificadoDestinacaoResiduo: TsmDataset
    CommandText = 
      'select vw.id_certificado_residuo'#13#10'      ,vw.dt_emissao'#13#10'      ,v' +
      'w.dt_mes_referencia'#13#10'      ,vw.id_pessoa_cliente'#13#10'      ,vw.nm_p' +
      'essoa_cliente'#13#10'      ,vw.id_tipo_residuo'#13#10'      ,vw.ds_tipo_resi' +
      'duo'#13#10'      ,vw.id_pessoa_fornecedor as id_pessoa_local_destino'#13#10 +
      '      ,vw.nm_pessoa_fornecedor as nm_pessoa_local_destino'#13#10'     ' +
      ' ,vw.id_destinacao_residuo'#13#10'      ,vw.ds_destinacao_residuo'#13#10'   ' +
      '   ,vw.fl_unidade'#13#10'      ,vw.ds_unidade'#13#10'      ,vw.qt_quantidade' +
      #13#10'      ,vw.id_guia_coleta'#13#10'from VW_LST_CERTIFICADO_RESIDUO vw'#13#10 +
      'where vw.fl_tipo_certificado = '#39'DES'#39
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'CERTIFICADO_RESIDUO'
    Left = 766
    Top = 24
    object dtsCertificadoDestinacaoResiduoID_CERTIFICADO_RESIDUO: TIntegerField
      Tag = 1
      FieldName = 'ID_CERTIFICADO_RESIDUO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsCertificadoDestinacaoResiduoDT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
    end
    object dtsCertificadoDestinacaoResiduoDT_MES_REFERENCIA: TDateField
      FieldName = 'DT_MES_REFERENCIA'
    end
    object dtsCertificadoDestinacaoResiduoID_PESSOA_CLIENTE: TIntegerField
      FieldName = 'ID_PESSOA_CLIENTE'
    end
    object dtsCertificadoDestinacaoResiduoNM_PESSOA_CLIENTE: TStringField
      FieldName = 'NM_PESSOA_CLIENTE'
      Size = 104
    end
    object dtsCertificadoDestinacaoResiduoID_TIPO_RESIDUO: TSmallintField
      FieldName = 'ID_TIPO_RESIDUO'
    end
    object dtsCertificadoDestinacaoResiduoDS_TIPO_RESIDUO: TStringField
      FieldName = 'DS_TIPO_RESIDUO'
      Size = 80
    end
    object dtsCertificadoDestinacaoResiduoID_PESSOA_LOCAL_DESTINO: TIntegerField
      FieldName = 'ID_PESSOA_LOCAL_DESTINO'
    end
    object dtsCertificadoDestinacaoResiduoNM_PESSOA_LOCAL_DESTINO: TStringField
      FieldName = 'NM_PESSOA_LOCAL_DESTINO'
      Size = 100
    end
    object dtsCertificadoDestinacaoResiduoID_DESTINACAO_RESIDUO: TSmallintField
      FieldName = 'ID_DESTINACAO_RESIDUO'
    end
    object dtsCertificadoDestinacaoResiduoDS_DESTINACAO_RESIDUO: TStringField
      FieldName = 'DS_DESTINACAO_RESIDUO'
      Size = 80
    end
    object dtsCertificadoDestinacaoResiduoFL_UNIDADE: TStringField
      FieldName = 'FL_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object dtsCertificadoDestinacaoResiduoDS_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'DS_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object dtsCertificadoDestinacaoResiduoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
    object dtsCertificadoDestinacaoResiduoID_GUIA_COLETA: TIntegerField
      FieldName = 'ID_GUIA_COLETA'
    end
  end
  object pvdCertificadoDestinacaoResiduo: TsmProvider
    DataSet = dtsCertificadoDestinacaoResiduo
    OnGetTableName = pvdCorGetTableName
    Left = 836
    Top = 22
  end
  object cltCertificadoDestinacaoResiduo: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdCertificadoDestinacaoResiduo'
    TabelaPrincipal = 'CERTIFICADO_RESIDUO'
    Left = 902
    Top = 23
    object cltCertificadoDestinacaoResiduoID_CERTIFICADO_RESIDUO: TcprIntegerField
      Tag = 1
      FieldName = 'ID_CERTIFICADO_RESIDUO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '00000'
    end
    object cltCertificadoDestinacaoResiduoDT_EMISSAO: TcprDateField
      FieldName = 'DT_EMISSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cltCertificadoDestinacaoResiduoDT_MES_REFERENCIA: TcprDateField
      FieldName = 'DT_MES_REFERENCIA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cltCertificadoDestinacaoResiduoID_PESSOA_CLIENTE: TcprIntegerField
      Alignment = taCenter
      FieldName = 'ID_PESSOA_CLIENTE'
      DisplayFormat = '00000'
    end
    object cltCertificadoDestinacaoResiduoNM_PESSOA_CLIENTE: TcprStringField
      FieldName = 'NM_PESSOA_CLIENTE'
      Size = 104
    end
    object cltCertificadoDestinacaoResiduoID_TIPO_RESIDUO: TcprSmallintField
      Alignment = taCenter
      FieldName = 'ID_TIPO_RESIDUO'
      DisplayFormat = '00000'
    end
    object cltCertificadoDestinacaoResiduoDS_TIPO_RESIDUO: TcprStringField
      FieldName = 'DS_TIPO_RESIDUO'
      Size = 80
    end
    object cltCertificadoDestinacaoResiduoID_PESSOA_LOCAL_DESTINO: TcprIntegerField
      Alignment = taCenter
      FieldName = 'ID_PESSOA_LOCAL_DESTINO'
      DisplayFormat = '00000'
    end
    object cltCertificadoDestinacaoResiduoNM_PESSOA_LOCAL_DESTINO: TcprStringField
      FieldName = 'NM_PESSOA_LOCAL_DESTINO'
      Size = 100
    end
    object cltCertificadoDestinacaoResiduoID_DESTINACAO_RESIDUO: TcprSmallintField
      Alignment = taCenter
      FieldName = 'ID_DESTINACAO_RESIDUO'
      DisplayFormat = '00000'
    end
    object cltCertificadoDestinacaoResiduoDS_DESTINACAO_RESIDUO: TcprStringField
      FieldName = 'DS_DESTINACAO_RESIDUO'
      Size = 80
    end
    object cltCertificadoDestinacaoResiduoFL_UNIDADE: TcprStringField
      FieldName = 'FL_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cltCertificadoDestinacaoResiduoDS_UNIDADE: TcprStringField
      DisplayWidth = 3
      FieldName = 'DS_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cltCertificadoDestinacaoResiduoQT_QUANTIDADE: TcprFloatField
      FieldName = 'QT_QUANTIDADE'
      DisplayFormat = '#,#0.000'
    end
    object cltCertificadoDestinacaoResiduoID_GUIA_COLETA: TcprIntegerField
      FieldName = 'ID_GUIA_COLETA'
      DisplayFormat = '00000'
    end
  end
  object dtsCertificadoRecebimentoResiduo: TsmDataset
    CommandText = 
      'select vw.id_certificado_residuo'#13#10'      ,vw.dt_emissao'#13#10'      ,v' +
      'w.nr_mtr'#13#10'      ,vw.id_pessoa_cliente as id_pessoa_gerador'#13#10'    ' +
      '  ,vw.nm_pessoa_cliente as nm_pessoa_gerador'#13#10'      ,vw.id_tipo_' +
      'residuo'#13#10'      ,vw.ds_tipo_residuo'#13#10'      ,vw.id_pessoa_forneced' +
      'or as id_pessoa_certificante'#13#10'      ,vw.nm_pessoa_fornecedor as ' +
      'nm_pessoa_certificante'#13#10'      ,vw.fl_unidade'#13#10'      ,vw.ds_unida' +
      'de'#13#10'      ,vw.qt_quantidade'#13#10'from VW_LST_CERTIFICADO_RESIDUO vw'#13 +
      #10'where vw.fl_tipo_certificado = '#39'REC'#39
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'CERTIFICADO_RESIDUO'
    Left = 766
    Top = 72
    object dtsCertificadoRecebimentoResiduoID_CERTIFICADO_RESIDUO: TIntegerField
      Tag = 1
      FieldName = 'ID_CERTIFICADO_RESIDUO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsCertificadoRecebimentoResiduoDT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
    end
    object dtsCertificadoRecebimentoResiduoNR_MTR: TStringField
      FieldName = 'NR_MTR'
      ProviderFlags = []
      Size = 1000
    end
    object dtsCertificadoRecebimentoResiduoID_PESSOA_GERADOR: TIntegerField
      FieldName = 'ID_PESSOA_GERADOR'
    end
    object dtsCertificadoRecebimentoResiduoNM_PESSOA_GERADOR: TStringField
      FieldName = 'NM_PESSOA_GERADOR'
      Size = 100
    end
    object dtsCertificadoRecebimentoResiduoID_TIPO_RESIDUO: TSmallintField
      FieldName = 'ID_TIPO_RESIDUO'
    end
    object dtsCertificadoRecebimentoResiduoDS_TIPO_RESIDUO: TStringField
      FieldName = 'DS_TIPO_RESIDUO'
      Size = 80
    end
    object dtsCertificadoRecebimentoResiduoID_PESSOA_CERTIFICANTE: TIntegerField
      FieldName = 'ID_PESSOA_CERTIFICANTE'
    end
    object dtsCertificadoRecebimentoResiduoNM_PESSOA_CERTIFICANTE: TStringField
      FieldName = 'NM_PESSOA_CERTIFICANTE'
      Size = 100
    end
    object dtsCertificadoRecebimentoResiduoFL_UNIDADE: TStringField
      FieldName = 'FL_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object dtsCertificadoRecebimentoResiduoDS_UNIDADE: TStringField
      DisplayWidth = 3
      FieldName = 'DS_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object dtsCertificadoRecebimentoResiduoQT_QUANTIDADE: TFloatField
      FieldName = 'QT_QUANTIDADE'
    end
  end
  object pvdCertificadoRecebimentoResiduo: TsmProvider
    DataSet = dtsCertificadoRecebimentoResiduo
    OnGetTableName = pvdCorGetTableName
    Left = 836
    Top = 70
  end
  object cltCertificadoRecebimentoResiduo: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdCertificadoRecebimentoResiduo'
    TabelaPrincipal = 'CERTIFICADO_RESIDUO'
    Left = 902
    Top = 71
    object cltCertificadoRecebimentoResiduoID_CERTIFICADO_RESIDUO: TcprIntegerField
      Tag = 1
      FieldName = 'ID_CERTIFICADO_RESIDUO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '00000'
    end
    object cltCertificadoRecebimentoResiduoDT_EMISSAO: TcprDateField
      FieldName = 'DT_EMISSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cltCertificadoRecebimentoResiduoNR_MTR: TcprStringField
      FieldName = 'NR_MTR'
      ProviderFlags = []
      Size = 1000
    end
    object cltCertificadoRecebimentoResiduoID_PESSOA_GERADOR: TcprIntegerField
      FieldName = 'ID_PESSOA_GERADOR'
      DisplayFormat = '00000'
    end
    object cltCertificadoRecebimentoResiduoNM_PESSOA_GERADOR: TcprStringField
      FieldName = 'NM_PESSOA_GERADOR'
      Size = 100
    end
    object cltCertificadoRecebimentoResiduoID_TIPO_RESIDUO: TcprSmallintField
      FieldName = 'ID_TIPO_RESIDUO'
      DisplayFormat = '00000'
    end
    object cltCertificadoRecebimentoResiduoDS_TIPO_RESIDUO: TcprStringField
      FieldName = 'DS_TIPO_RESIDUO'
      Size = 80
    end
    object cltCertificadoRecebimentoResiduoID_PESSOA_CERTIFICANTE: TcprIntegerField
      FieldName = 'ID_PESSOA_CERTIFICANTE'
      DisplayFormat = '00000'
    end
    object cltCertificadoRecebimentoResiduoNM_PESSOA_CERTIFICANTE: TcprStringField
      FieldName = 'NM_PESSOA_CERTIFICANTE'
      Size = 100
    end
    object cltCertificadoRecebimentoResiduoFL_UNIDADE: TcprStringField
      FieldName = 'FL_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cltCertificadoRecebimentoResiduoDS_UNIDADE: TcprStringField
      DisplayWidth = 3
      FieldName = 'DS_UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cltCertificadoRecebimentoResiduoQT_QUANTIDADE: TcprFloatField
      FieldName = 'QT_QUANTIDADE'
      DisplayFormat = '#,#0.000'
    end
  end
  object dtsCacamba: TsmDataset
    CommandText = 
      'select vw.id_cacamba'#13#10'      ,vw.id_tipo_cacamba'#13#10'      ,vw.ds_de' +
      'scricao'#13#10'      ,vw.fl_possui_tampa'#13#10'      ,vw.ds_possui_tampa'#13#10' ' +
      '     ,vw.qt_peso'#13#10'      ,vw.id_unidade_medida'#13#10'      ,vw.sg_medi' +
      'da'#13#10'      ,vw.nm_medida'#13#10'      ,vw.qt_capacidade'#13#10'      ,vw.fl_a' +
      'tiva'#13#10'      ,vw.ds_ativa'#13#10'      ,vw.fl_comporta_liquido'#13#10'      ,' +
      'vw.ds_comporta_liquido'#13#10'      ,vw.ds_observacao'#13#10'      ,vw.id_ex' +
      'pedicao_cacamba'#13#10'      ,vw.fl_disponivel'#13#10'      ,vw.ds_disponive' +
      'l'#13#10'      ,vw.vl_padrao'#13#10'      ,vw.nr_numero'#13#10'from VW_LST_CACAMBA' +
      ' vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'CACAMBA'
    Left = 768
    Top = 165
    object dtsCacambaID_CACAMBA: TIntegerField
      Tag = 1
      FieldName = 'ID_CACAMBA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsCacambaID_TIPO_CACAMBA: TSmallintField
      FieldName = 'ID_TIPO_CACAMBA'
    end
    object dtsCacambaDS_DESCRICAO: TStringField
      FieldName = 'DS_DESCRICAO'
      Size = 30
    end
    object dtsCacambaFL_POSSUI_TAMPA: TStringField
      FieldName = 'FL_POSSUI_TAMPA'
      FixedChar = True
      Size = 1
    end
    object dtsCacambaDS_POSSUI_TAMPA: TStringField
      FieldName = 'DS_POSSUI_TAMPA'
      FixedChar = True
      Size = 3
    end
    object dtsCacambaQT_PESO: TFloatField
      FieldName = 'QT_PESO'
    end
    object dtsCacambaID_UNIDADE_MEDIDA: TSmallintField
      FieldName = 'ID_UNIDADE_MEDIDA'
    end
    object dtsCacambaSG_MEDIDA: TStringField
      FieldName = 'SG_MEDIDA'
      FixedChar = True
      Size = 10
    end
    object dtsCacambaNM_MEDIDA: TStringField
      FieldName = 'NM_MEDIDA'
      Size = 80
    end
    object dtsCacambaQT_CAPACIDADE: TFloatField
      FieldName = 'QT_CAPACIDADE'
    end
    object dtsCacambaFL_ATIVA: TStringField
      FieldName = 'FL_ATIVA'
      FixedChar = True
      Size = 1
    end
    object dtsCacambaDS_ATIVA: TStringField
      FieldName = 'DS_ATIVA'
      FixedChar = True
      Size = 3
    end
    object dtsCacambaFL_COMPORTA_LIQUIDO: TStringField
      FieldName = 'FL_COMPORTA_LIQUIDO'
      FixedChar = True
      Size = 1
    end
    object dtsCacambaDS_COMPORTA_LIQUIDO: TStringField
      FieldName = 'DS_COMPORTA_LIQUIDO'
      FixedChar = True
      Size = 3
    end
    object dtsCacambaDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 100
    end
    object dtsCacambaID_EXPEDICAO_CACAMBA: TIntegerField
      FieldName = 'ID_EXPEDICAO_CACAMBA'
    end
    object dtsCacambaFL_DISPONIVEL: TStringField
      FieldName = 'FL_DISPONIVEL'
      FixedChar = True
      Size = 1
    end
    object dtsCacambaDS_DISPONIVEL: TStringField
      FieldName = 'DS_DISPONIVEL'
      FixedChar = True
      Size = 3
    end
    object dtsCacambaVL_PADRAO: TFloatField
      FieldName = 'VL_PADRAO'
    end
    object dtsCacambaNR_NUMERO: TStringField
      FieldName = 'NR_NUMERO'
      Size = 1000
    end
  end
  object pvdCacamba: TsmProvider
    DataSet = dtsCacamba
    OnGetTableName = pvdCorGetTableName
    Left = 836
    Top = 164
  end
  object cltCacamba: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdCacamba'
    TabelaPrincipal = 'CACAMBA'
    Left = 902
    Top = 164
    object cltCacambaID_CACAMBA: TcprIntegerField
      Tag = 1
      FieldName = 'ID_CACAMBA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '00000'
    end
    object cltCacambaID_TIPO_CACAMBA: TcprSmallintField
      FieldName = 'ID_TIPO_CACAMBA'
      DisplayFormat = '000'
    end
    object cltCacambaDS_DESCRICAO: TcprStringField
      FieldName = 'DS_DESCRICAO'
      Size = 30
    end
    object cltCacambaFL_POSSUI_TAMPA: TcprStringField
      FieldName = 'FL_POSSUI_TAMPA'
      FixedChar = True
      Size = 1
    end
    object cltCacambaDS_POSSUI_TAMPA: TcprStringField
      FieldName = 'DS_POSSUI_TAMPA'
      FixedChar = True
      Size = 3
    end
    object cltCacambaQT_PESO: TcprFloatField
      FieldName = 'QT_PESO'
      DisplayFormat = '#,#0.000'
    end
    object cltCacambaID_UNIDADE_MEDIDA: TcprSmallintField
      FieldName = 'ID_UNIDADE_MEDIDA'
      DisplayFormat = '00000'
    end
    object cltCacambaSG_MEDIDA: TcprStringField
      FieldName = 'SG_MEDIDA'
      FixedChar = True
      Size = 10
    end
    object cltCacambaNM_MEDIDA: TcprStringField
      FieldName = 'NM_MEDIDA'
      Size = 80
    end
    object cltCacambaQT_CAPACIDADE: TcprFloatField
      FieldName = 'QT_CAPACIDADE'
      DisplayFormat = '#,#0.000'
    end
    object cltCacambaFL_ATIVA: TcprStringField
      FieldName = 'FL_ATIVA'
      FixedChar = True
      Size = 1
    end
    object cltCacambaDS_ATIVA: TcprStringField
      FieldName = 'DS_ATIVA'
      FixedChar = True
      Size = 3
    end
    object cltCacambaFL_COMPORTA_LIQUIDO: TcprStringField
      FieldName = 'FL_COMPORTA_LIQUIDO'
      FixedChar = True
      Size = 1
    end
    object cltCacambaDS_COMPORTA_LIQUIDO: TcprStringField
      FieldName = 'DS_COMPORTA_LIQUIDO'
      FixedChar = True
      Size = 3
    end
    object cltCacambaDS_OBSERVACAO: TcprStringField
      FieldName = 'DS_OBSERVACAO'
      Size = 100
    end
    object cltCacambaID_EXPEDICAO_CACAMBA: TcprIntegerField
      FieldName = 'ID_EXPEDICAO_CACAMBA'
      DisplayFormat = '00000'
    end
    object cltCacambaFL_DISPONIVEL: TcprStringField
      FieldName = 'FL_DISPONIVEL'
      FixedChar = True
      Size = 1
    end
    object cltCacambaDS_DISPONIVEL: TcprStringField
      FieldName = 'DS_DISPONIVEL'
      FixedChar = True
      Size = 3
    end
    object cltCacambaVL_PADRAO: TcprFloatField
      FieldName = 'VL_PADRAO'
    end
    object cltCacambaNR_NUMERO: TcprStringField
      FieldName = 'NR_NUMERO'
      Size = 1000
    end
  end
  object dtsTipoCacamba: TsmDataset
    CommandText = 
      'select vw.id_tipo_cacamba'#13#10'      ,vw.ds_descricao'#13#10'      ,vw.qt_' +
      'peso'#13#10'      ,vw.id_unidade_medida'#13#10'      ,vw.sg_medida'#13#10'      ,v' +
      'w.nm_medida'#13#10'      ,vw.qt_capacidade'#13#10'from VW_LST_TIPO_CACAMBA v' +
      'w'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'TIPO_CACAMBA'
    Left = 766
    Top = 117
    object dtsTipoCacambaID_TIPO_CACAMBA: TSmallintField
      Tag = 1
      FieldName = 'ID_TIPO_CACAMBA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsTipoCacambaDS_DESCRICAO: TStringField
      FieldName = 'DS_DESCRICAO'
      Size = 30
    end
    object dtsTipoCacambaQT_PESO: TFloatField
      FieldName = 'QT_PESO'
    end
    object dtsTipoCacambaID_UNIDADE_MEDIDA: TSmallintField
      FieldName = 'ID_UNIDADE_MEDIDA'
    end
    object dtsTipoCacambaSG_MEDIDA: TStringField
      FieldName = 'SG_MEDIDA'
      FixedChar = True
      Size = 10
    end
    object dtsTipoCacambaNM_MEDIDA: TStringField
      FieldName = 'NM_MEDIDA'
      Size = 80
    end
    object dtsTipoCacambaQT_CAPACIDADE: TFloatField
      FieldName = 'QT_CAPACIDADE'
    end
  end
  object pvdTipoCacamba: TsmProvider
    DataSet = dtsTipoCacamba
    OnGetTableName = pvdCorGetTableName
    Left = 836
    Top = 116
  end
  object cltTipoCacamba: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdTipoCacamba'
    TabelaPrincipal = 'TIPO_CACAMBA'
    Left = 902
    Top = 116
    object cltTipoCacambaID_TIPO_CACAMBA: TcprSmallintField
      Tag = 1
      FieldName = 'ID_TIPO_CACAMBA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '00000'
    end
    object cltTipoCacambaDS_DESCRICAO: TcprStringField
      FieldName = 'DS_DESCRICAO'
      Size = 30
    end
    object cltTipoCacambaQT_PESO: TcprFloatField
      FieldName = 'QT_PESO'
      DisplayFormat = '#,#0.000'
    end
    object cltTipoCacambaID_UNIDADE_MEDIDA: TcprSmallintField
      FieldName = 'ID_UNIDADE_MEDIDA'
      DisplayFormat = '00000'
    end
    object cltTipoCacambaSG_MEDIDA: TcprStringField
      FieldName = 'SG_MEDIDA'
      FixedChar = True
      Size = 10
    end
    object cltTipoCacambaNM_MEDIDA: TcprStringField
      FieldName = 'NM_MEDIDA'
      Size = 80
    end
    object cltTipoCacambaQT_CAPACIDADE: TcprFloatField
      FieldName = 'QT_CAPACIDADE'
      DisplayFormat = '#,#0.000'
    end
  end
  object dtsExpedicaoCacamba: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado'#13#10'      ,vw.id_expedicao_cacamba'#13#10'     ' +
      ' ,vw.id_cacamba'#13#10'      ,vw.ds_descricao'#13#10'      ,vw.nr_numero'#13#10'  ' +
      '    ,vw.dt_expedicao'#13#10'      ,vw.dt_retorno'#13#10'      ,vw.fl_conclui' +
      'da'#13#10'      ,vw.ds_concluida'#13#10'      ,vw.id_veiculo_expedicao'#13#10'    ' +
      '  ,vw.ds_placa_expedicao'#13#10'      ,vw.id_motorista_expedicao'#13#10'    ' +
      '  ,vw.nm_motorista_expedicao'#13#10'      ,vw.id_veiculo_retorno'#13#10'    ' +
      '  ,vw.ds_placa_retorno'#13#10'      ,vw.id_motorista_retorno'#13#10'      ,v' +
      'w.nm_motorista_retorno'#13#10'      ,vw.id_contrato_locacao'#13#10'      ,vw' +
      '.ds_tipo_contrato'#13#10'      ,vw.id_manifesto_coleta'#13#10'      ,vw.dt_d' +
      'ata_coleta'#13#10'      ,vw.id_cliente'#13#10'      ,vw.nm_cliente'#13#10'      ,v' +
      'w.ds_cidade_uf_cliente'#13#10'      ,vw.dt_previsao_retorno'#13#10'      ,vw' +
      '.ds_observacao'#13#10'from VW_LST_EXPEDICAO_CACAMBA vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'EXPEDICAO_CACAMBA'
    Left = 768
    Top = 213
    object dtsExpedicaoCacambaSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object dtsExpedicaoCacambaID_EXPEDICAO_CACAMBA: TIntegerField
      Tag = 1
      FieldName = 'ID_EXPEDICAO_CACAMBA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsExpedicaoCacambaID_CACAMBA: TIntegerField
      FieldName = 'ID_CACAMBA'
    end
    object dtsExpedicaoCacambaDS_DESCRICAO: TStringField
      FieldName = 'DS_DESCRICAO'
      Size = 30
    end
    object dtsExpedicaoCacambaDT_EXPEDICAO: TSQLTimeStampField
      FieldName = 'DT_EXPEDICAO'
    end
    object dtsExpedicaoCacambaDT_RETORNO: TSQLTimeStampField
      FieldName = 'DT_RETORNO'
    end
    object dtsExpedicaoCacambaFL_CONCLUIDA: TStringField
      FieldName = 'FL_CONCLUIDA'
      FixedChar = True
      Size = 1
    end
    object dtsExpedicaoCacambaDS_CONCLUIDA: TStringField
      FieldName = 'DS_CONCLUIDA'
      FixedChar = True
      Size = 3
    end
    object dtsExpedicaoCacambaID_VEICULO_EXPEDICAO: TIntegerField
      FieldName = 'ID_VEICULO_EXPEDICAO'
    end
    object dtsExpedicaoCacambaDS_PLACA_EXPEDICAO: TStringField
      FieldName = 'DS_PLACA_EXPEDICAO'
      Size = 8
    end
    object dtsExpedicaoCacambaID_MOTORISTA_EXPEDICAO: TIntegerField
      FieldName = 'ID_MOTORISTA_EXPEDICAO'
    end
    object dtsExpedicaoCacambaNM_MOTORISTA_EXPEDICAO: TStringField
      FieldName = 'NM_MOTORISTA_EXPEDICAO'
      Size = 100
    end
    object dtsExpedicaoCacambaID_VEICULO_RETORNO: TIntegerField
      FieldName = 'ID_VEICULO_RETORNO'
    end
    object dtsExpedicaoCacambaDS_PLACA_RETORNO: TStringField
      FieldName = 'DS_PLACA_RETORNO'
      Size = 8
    end
    object dtsExpedicaoCacambaID_MOTORISTA_RETORNO: TIntegerField
      FieldName = 'ID_MOTORISTA_RETORNO'
    end
    object dtsExpedicaoCacambaNM_MOTORISTA_RETORNO: TStringField
      FieldName = 'NM_MOTORISTA_RETORNO'
      Size = 100
    end
    object dtsExpedicaoCacambaID_CONTRATO_LOCACAO: TIntegerField
      FieldName = 'ID_CONTRATO_LOCACAO'
    end
    object dtsExpedicaoCacambaDS_TIPO_CONTRATO: TStringField
      FieldName = 'DS_TIPO_CONTRATO'
      Size = 80
    end
    object dtsExpedicaoCacambaID_MANIFESTO_COLETA: TIntegerField
      FieldName = 'ID_MANIFESTO_COLETA'
    end
    object dtsExpedicaoCacambaDT_DATA_COLETA: TSQLTimeStampField
      FieldName = 'DT_DATA_COLETA'
    end
    object dtsExpedicaoCacambaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object dtsExpedicaoCacambaNM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      Size = 100
    end
    object dtsExpedicaoCacambaDS_CIDADE_UF_CLIENTE: TStringField
      FieldName = 'DS_CIDADE_UF_CLIENTE'
      Size = 103
    end
    object dtsExpedicaoCacambaDT_PREVISAO_RETORNO: TDateField
      FieldName = 'DT_PREVISAO_RETORNO'
    end
    object dtsExpedicaoCacambaDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      ProviderFlags = []
      Size = 1000
    end
    object dtsExpedicaoCacambaNR_NUMERO: TStringField
      FieldName = 'NR_NUMERO'
      Size = 1000
    end
  end
  object pvdExpedicaoCacamba: TsmProvider
    DataSet = dtsExpedicaoCacamba
    OnGetTableName = pvdCorGetTableName
    Left = 836
    Top = 212
  end
  object cltExpedicaoCacamba: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdExpedicaoCacamba'
    TabelaPrincipal = 'EXPEDICAO_CACAMBA'
    Left = 902
    Top = 212
    object cltExpedicaoCacambaSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object cltExpedicaoCacambaID_EXPEDICAO_CACAMBA: TcprIntegerField
      Tag = 1
      FieldName = 'ID_EXPEDICAO_CACAMBA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '00000'
    end
    object cltExpedicaoCacambaID_CACAMBA: TcprIntegerField
      FieldName = 'ID_CACAMBA'
      DisplayFormat = '00000'
    end
    object cltExpedicaoCacambaDS_DESCRICAO: TcprStringField
      FieldName = 'DS_DESCRICAO'
      Size = 30
    end
    object cltExpedicaoCacambaDT_EXPEDICAO: TcprSQLTimeStampField
      FieldName = 'DT_EXPEDICAO'
      DisplayFormat = 'dd/MM/yyyy hh:mm'
    end
    object cltExpedicaoCacambaDT_RETORNO: TcprSQLTimeStampField
      FieldName = 'DT_RETORNO'
      DisplayFormat = 'dd/MM/yyyy hh:mm'
    end
    object cltExpedicaoCacambaFL_CONCLUIDA: TcprStringField
      FieldName = 'FL_CONCLUIDA'
      FixedChar = True
      Size = 1
    end
    object cltExpedicaoCacambaDS_CONCLUIDA: TcprStringField
      FieldName = 'DS_CONCLUIDA'
      FixedChar = True
      Size = 3
    end
    object cltExpedicaoCacambaID_VEICULO_EXPEDICAO: TcprIntegerField
      FieldName = 'ID_VEICULO_EXPEDICAO'
      DisplayFormat = '00000'
    end
    object cltExpedicaoCacambaDS_PLACA_EXPEDICAO: TcprStringField
      FieldName = 'DS_PLACA_EXPEDICAO'
      Size = 8
    end
    object cltExpedicaoCacambaID_MOTORISTA_EXPEDICAO: TcprIntegerField
      FieldName = 'ID_MOTORISTA_EXPEDICAO'
      DisplayFormat = '00000'
    end
    object cltExpedicaoCacambaNM_MOTORISTA_EXPEDICAO: TcprStringField
      FieldName = 'NM_MOTORISTA_EXPEDICAO'
      Size = 100
    end
    object cltExpedicaoCacambaID_VEICULO_RETORNO: TcprIntegerField
      FieldName = 'ID_VEICULO_RETORNO'
      DisplayFormat = '00000'
    end
    object cltExpedicaoCacambaDS_PLACA_RETORNO: TcprStringField
      FieldName = 'DS_PLACA_RETORNO'
      Size = 8
    end
    object cltExpedicaoCacambaID_MOTORISTA_RETORNO: TcprIntegerField
      FieldName = 'ID_MOTORISTA_RETORNO'
      DisplayFormat = '00000'
    end
    object cltExpedicaoCacambaNM_MOTORISTA_RETORNO: TcprStringField
      FieldName = 'NM_MOTORISTA_RETORNO'
      Size = 100
    end
    object cltExpedicaoCacambaID_CONTRATO_LOCACAO: TcprIntegerField
      FieldName = 'ID_CONTRATO_LOCACAO'
      DisplayFormat = '00000'
    end
    object cltExpedicaoCacambaDS_TIPO_CONTRATO: TcprStringField
      FieldName = 'DS_TIPO_CONTRATO'
      Size = 80
    end
    object cltExpedicaoCacambaID_MANIFESTO_COLETA: TcprIntegerField
      FieldName = 'ID_MANIFESTO_COLETA'
      DisplayFormat = '00000'
    end
    object cltExpedicaoCacambaDT_DATA_COLETA: TcprSQLTimeStampField
      FieldName = 'DT_DATA_COLETA'
      DisplayFormat = 'dd/MM/yyyy hh:mm'
    end
    object cltExpedicaoCacambaID_CLIENTE: TcprIntegerField
      FieldName = 'ID_CLIENTE'
      DisplayFormat = '00000'
    end
    object cltExpedicaoCacambaNM_CLIENTE: TcprStringField
      FieldName = 'NM_CLIENTE'
      Size = 100
    end
    object cltExpedicaoCacambaDS_CIDADE_UF_CLIENTE: TcprStringField
      FieldName = 'DS_CIDADE_UF_CLIENTE'
      Size = 103
    end
    object cltExpedicaoCacambaDT_PREVISAO_RETORNO: TcprDateField
      FieldName = 'DT_PREVISAO_RETORNO'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object cltExpedicaoCacambaDS_OBSERVACAO: TcprStringField
      FieldName = 'DS_OBSERVACAO'
      ProviderFlags = []
      Size = 1000
    end
    object cltExpedicaoCacambaNR_NUMERO: TcprStringField
      FieldName = 'NR_NUMERO'
      Size = 1000
    end
  end
  object dtsPessoaRelacionamentoComercial: TsmDataset
    CommandText = 
      'select vw.id_pessoa_relacionamento'#13#10'      ,vw.fl_tipo'#13#10'      ,vw' +
      '.ds_tipo'#13#10'      ,vw.fl_fixo'#13#10'      ,vw.fl_ativo'#13#10'      ,vw.dt_ca' +
      'dastro'#13#10'from VW_LST_PESSOA_RELAC_COMERCIAL vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 768
    Top = 269
    object dtsPessoaRelacionamentoComercialID_PESSOA_RELACIONAMENTO: TSmallintField
      FieldName = 'ID_PESSOA_RELACIONAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsPessoaRelacionamentoComercialFL_TIPO: TStringField
      FieldName = 'FL_TIPO'
      FixedChar = True
      Size = 3
    end
    object dtsPessoaRelacionamentoComercialDS_TIPO: TStringField
      FieldName = 'DS_TIPO'
      Size = 30
    end
    object dtsPessoaRelacionamentoComercialFL_FIXO: TStringField
      FieldName = 'FL_FIXO'
      FixedChar = True
      Size = 1
    end
    object dtsPessoaRelacionamentoComercialFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object dtsPessoaRelacionamentoComercialDT_CADASTRO: TSQLTimeStampField
      FieldName = 'DT_CADASTRO'
    end
  end
  object pvdPessoaRelacionamentoComercial: TsmProvider
    DataSet = dtsPessoaRelacionamentoComercial
    OnGetTableName = pvdPessoaRelacionamentoComercialGetTableName
    Left = 836
    Top = 268
  end
  object cltPessoaRelacionamentoComercial: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdPessoaRelacionamentoComercial'
    TabelaPrincipal = 'PESSOA_RELACIONAMENTO_TIPO'
    Left = 902
    Top = 268
    object cltPessoaRelacionamentoComercialID_PESSOA_RELACIONAMENTO: TcprSmallintField
      FieldName = 'ID_PESSOA_RELACIONAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '00000'
    end
    object cltPessoaRelacionamentoComercialFL_TIPO: TcprStringField
      FieldName = 'FL_TIPO'
      FixedChar = True
      Size = 3
    end
    object cltPessoaRelacionamentoComercialDS_TIPO: TcprStringField
      FieldName = 'DS_TIPO'
      Size = 30
    end
    object cltPessoaRelacionamentoComercialFL_FIXO: TcprStringField
      FieldName = 'FL_FIXO'
      FixedChar = True
      Size = 1
    end
    object cltPessoaRelacionamentoComercialFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object cltPessoaRelacionamentoComercialDT_CADASTRO: TcprSQLTimeStampField
      FieldName = 'DT_CADASTRO'
    end
  end
  object dtsDestinoColeta: TsmDataset
    CommandText = 
      'select vw.id_destino_coleta'#13#10'      ,vw.id_empresa'#13#10'      ,vw.dt_' +
      'data_cadastro'#13#10'      ,vw.nr_vale'#13#10'      ,vw.id_veiculo'#13#10'      ,v' +
      'w.ds_placa'#13#10'      ,vw.id_pessoa_motorista'#13#10'      ,vw.nm_pessoa_m' +
      'otorista'#13#10'      ,vw.id_pessoa_local_destino'#13#10'      ,vw.nm_pessoa' +
      '_local_destino'#13#10'      ,vw.vl_valor'#13#10'      ,vw.id_plano_conta'#13#10'  ' +
      '    ,vw.ds_plano_conta'#13#10'      ,vw.fl_situacao'#13#10'      ,vw.ds_situ' +
      'acao'#13#10'      ,vw.ds_observacao'#13#10'      ,vw.id_pessoa_transportador' +
      #13#10'      ,vw.nm_pessoa_transportador'#13#10'      ,vw.id_lote'#13#10'from VW_' +
      'LST_DESTINO_COLETA vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'DESTINO_COLETA'
    Left = 766
    Top = 328
    object dtsDestinoColetaID_DESTINO_COLETA: TIntegerField
      Tag = 1
      FieldName = 'ID_DESTINO_COLETA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsDestinoColetaID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      ProviderFlags = []
    end
    object dtsDestinoColetaDT_DATA_CADASTRO: TDateField
      FieldName = 'DT_DATA_CADASTRO'
      ProviderFlags = []
    end
    object dtsDestinoColetaNR_VALE: TIntegerField
      FieldName = 'NR_VALE'
      ProviderFlags = []
    end
    object dtsDestinoColetaID_VEICULO: TIntegerField
      FieldName = 'ID_VEICULO'
      ProviderFlags = []
    end
    object dtsDestinoColetaDS_PLACA: TStringField
      FieldName = 'DS_PLACA'
      ProviderFlags = []
      Size = 8
    end
    object dtsDestinoColetaID_PESSOA_MOTORISTA: TIntegerField
      FieldName = 'ID_PESSOA_MOTORISTA'
      ProviderFlags = []
    end
    object dtsDestinoColetaNM_PESSOA_MOTORISTA: TStringField
      FieldName = 'NM_PESSOA_MOTORISTA'
      ProviderFlags = []
      Size = 100
    end
    object dtsDestinoColetaID_PESSOA_LOCAL_DESTINO: TIntegerField
      FieldName = 'ID_PESSOA_LOCAL_DESTINO'
      ProviderFlags = []
    end
    object dtsDestinoColetaNM_PESSOA_LOCAL_DESTINO: TStringField
      FieldName = 'NM_PESSOA_LOCAL_DESTINO'
      ProviderFlags = []
      Size = 100
    end
    object dtsDestinoColetaVL_VALOR: TFloatField
      FieldName = 'VL_VALOR'
      ProviderFlags = []
    end
    object dtsDestinoColetaID_PLANO_CONTA: TIntegerField
      FieldName = 'ID_PLANO_CONTA'
      ProviderFlags = []
    end
    object dtsDestinoColetaDS_PLANO_CONTA: TStringField
      FieldName = 'DS_PLANO_CONTA'
      ProviderFlags = []
      Size = 120
    end
    object dtsDestinoColetaFL_SITUACAO: TStringField
      FieldName = 'FL_SITUACAO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsDestinoColetaDS_SITUACAO: TStringField
      FieldName = 'DS_SITUACAO'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object dtsDestinoColetaDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      ProviderFlags = []
      Size = 200
    end
    object dtsDestinoColetaID_PESSOA_TRANSPORTADOR: TIntegerField
      FieldName = 'ID_PESSOA_TRANSPORTADOR'
      ProviderFlags = []
    end
    object dtsDestinoColetaNM_PESSOA_TRANSPORTADOR: TStringField
      FieldName = 'NM_PESSOA_TRANSPORTADOR'
      ProviderFlags = []
      Size = 100
    end
    object dtsDestinoColetaID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
  end
  object pvdDestinoColeta: TsmProvider
    DataSet = dtsDestinoColeta
    OnGetTableName = pvdCorGetTableName
    Left = 836
    Top = 327
  end
  object cltDestinoColeta: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdDestinoColeta'
    TabelaPrincipal = 'DESTINO_COLETA'
    Left = 902
    Top = 327
    object cltDestinoColetaID_DESTINO_COLETA: TcprIntegerField
      Tag = 1
      FieldName = 'ID_DESTINO_COLETA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '00000'
    end
    object cltDestinoColetaID_EMPRESA: TcprIntegerField
      FieldName = 'ID_EMPRESA'
      ProviderFlags = []
    end
    object cltDestinoColetaDT_DATA_CADASTRO: TcprDateField
      FieldName = 'DT_DATA_CADASTRO'
      ProviderFlags = []
      DisplayFormat = 'dd/MM/yyyy'
    end
    object cltDestinoColetaNR_VALE: TcprIntegerField
      FieldName = 'NR_VALE'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltDestinoColetaID_VEICULO: TcprIntegerField
      FieldName = 'ID_VEICULO'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltDestinoColetaDS_PLACA: TcprStringField
      FieldName = 'DS_PLACA'
      ProviderFlags = []
      Size = 8
    end
    object cltDestinoColetaID_PESSOA_MOTORISTA: TcprIntegerField
      FieldName = 'ID_PESSOA_MOTORISTA'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltDestinoColetaNM_PESSOA_MOTORISTA: TcprStringField
      FieldName = 'NM_PESSOA_MOTORISTA'
      ProviderFlags = []
      Size = 100
    end
    object cltDestinoColetaID_PESSOA_LOCAL_DESTINO: TcprIntegerField
      FieldName = 'ID_PESSOA_LOCAL_DESTINO'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltDestinoColetaNM_PESSOA_LOCAL_DESTINO: TcprStringField
      FieldName = 'NM_PESSOA_LOCAL_DESTINO'
      ProviderFlags = []
      Size = 100
    end
    object cltDestinoColetaVL_VALOR: TcprFloatField
      FieldName = 'VL_VALOR'
      ProviderFlags = []
      DisplayFormat = '#,#0.00'
    end
    object cltDestinoColetaID_PLANO_CONTA: TcprIntegerField
      FieldName = 'ID_PLANO_CONTA'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltDestinoColetaDS_PLANO_CONTA: TcprStringField
      FieldName = 'DS_PLANO_CONTA'
      ProviderFlags = []
      Size = 120
    end
    object cltDestinoColetaFL_SITUACAO: TcprStringField
      FieldName = 'FL_SITUACAO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltDestinoColetaDS_SITUACAO: TcprStringField
      FieldName = 'DS_SITUACAO'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object cltDestinoColetaDS_OBSERVACAO: TcprStringField
      FieldName = 'DS_OBSERVACAO'
      ProviderFlags = []
      Size = 200
    end
    object cltDestinoColetaID_PESSOA_TRANSPORTADOR: TcprIntegerField
      FieldName = 'ID_PESSOA_TRANSPORTADOR'
      ProviderFlags = []
      DisplayFormat = '00000'
    end
    object cltDestinoColetaNM_PESSOA_TRANSPORTADOR: TcprStringField
      FieldName = 'NM_PESSOA_TRANSPORTADOR'
      ProviderFlags = []
      Size = 100
    end
    object cltDestinoColetaID_LOTE: TcprIntegerField
      FieldName = 'ID_LOTE'
      EditFormat = '000000'
    end
  end
  object dtsItemCategoria: TsmDataset
    CommandText = 
      'select vw.id_item_categoria'#13#10'      ,vw.ds_item_categoria'#13#10'      ' +
      ',vw.fl_ativo'#13#10'      ,vw.fl_ativo_ext'#13#10'from VW_ITEM_CATEGORIA vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'ITEM_CATEGORIA'
    Left = 766
    Top = 432
    object dtsItemCategoriaID_ITEM_CATEGORIA: TIntegerField
      FieldName = 'ID_ITEM_CATEGORIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsItemCategoriaDS_ITEM_CATEGORIA: TStringField
      FieldName = 'DS_ITEM_CATEGORIA'
      Size = 150
    end
    object dtsItemCategoriaFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object dtsItemCategoriaFL_ATIVO_EXT: TStringField
      FieldName = 'FL_ATIVO_EXT'
      FixedChar = True
      Size = 3
    end
  end
  object pvdItemCategoria: TsmProvider
    DataSet = dtsItemCategoria
    OnGetTableName = pvdCorGetTableName
    Left = 836
    Top = 431
  end
  object cltItemCategoria: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdItemCategoria'
    TabelaPrincipal = 'ITEM_CATEGORIA'
    Left = 910
    Top = 431
    object cltItemCategoriaID_ITEM_CATEGORIA: TcprIntegerField
      FieldName = 'ID_ITEM_CATEGORIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cltItemCategoriaDS_ITEM_CATEGORIA: TcprStringField
      FieldName = 'DS_ITEM_CATEGORIA'
      Size = 150
    end
    object cltItemCategoriaFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object cltItemCategoriaFL_ATIVO_EXT: TcprStringField
      FieldName = 'FL_ATIVO_EXT'
      FixedChar = True
      Size = 3
    end
  end
  object dtsItemTipo: TsmDataset
    CommandText = 
      'select vw.id_item_tipo'#13#10'      ,vw.ds_item_tipo'#13#10'      ,vw.fl_ati' +
      'vo'#13#10'      ,vw.fl_ativo_ext'#13#10'from VW_ITEM_TIPO vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'ITEM_TIPO'
    Left = 766
    Top = 384
    object dtsItemTipoID_ITEM_TIPO: TIntegerField
      FieldName = 'ID_ITEM_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsItemTipoDS_ITEM_TIPO: TStringField
      FieldName = 'DS_ITEM_TIPO'
      Size = 150
    end
    object dtsItemTipoFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object dtsItemTipoFL_ATIVO_EXT: TStringField
      FieldName = 'FL_ATIVO_EXT'
      FixedChar = True
      Size = 3
    end
  end
  object pvdItemTipo: TsmProvider
    DataSet = dtsItemTipo
    OnGetTableName = pvdCorGetTableName
    Left = 836
    Top = 383
  end
  object cltItemTipo: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdItemTipo'
    TabelaPrincipal = 'ITEM_TIPO'
    Left = 910
    Top = 383
    object cltItemTipoID_ITEM_TIPO: TcprIntegerField
      FieldName = 'ID_ITEM_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cltItemTipoDS_ITEM_TIPO: TcprStringField
      FieldName = 'DS_ITEM_TIPO'
      Size = 150
    end
    object cltItemTipoFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object cltItemTipoFL_ATIVO_EXT: TcprStringField
      FieldName = 'FL_ATIVO_EXT'
      FixedChar = True
      Size = 3
    end
  end
  object dtsItemTipoConsulta: TsmDataset
    CommandText = 
      'select vw.id_item_tipo'#13#10'      ,vw.ds_item_tipo'#13#10'      ,vw.fl_ati' +
      'vo'#13#10'      ,vw.fl_ativo_ext'#13#10'from VW_ITEM_TIPO_CONSULTA vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'ITEM_TIPO'
    Left = 766
    Top = 480
    object dtsItemTipoConsultaID_ITEM_TIPO: TIntegerField
      FieldName = 'ID_ITEM_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsItemTipoConsultaDS_ITEM_TIPO: TStringField
      FieldName = 'DS_ITEM_TIPO'
      Size = 150
    end
    object dtsItemTipoConsultaFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object dtsItemTipoConsultaFL_ATIVO_EXT: TStringField
      FieldName = 'FL_ATIVO_EXT'
      FixedChar = True
      Size = 3
    end
  end
  object pvdItemTipoConsulta: TsmProvider
    DataSet = dtsItemTipoConsulta
    Left = 836
    Top = 479
  end
  object cltItemTipoConsulta: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdItemTipoConsulta'
    TabelaPrincipal = 'ITEM_TIPO'
    Left = 910
    Top = 479
    object cltItemTipoConsultaID_ITEM_TIPO: TcprIntegerField
      FieldName = 'ID_ITEM_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cltItemTipoConsultaDS_ITEM_TIPO: TcprStringField
      FieldName = 'DS_ITEM_TIPO'
      Size = 150
    end
    object cltItemTipoConsultaFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object cltItemTipoConsultaFL_ATIVO_EXT: TcprStringField
      FieldName = 'FL_ATIVO_EXT'
      FixedChar = True
      Size = 3
    end
  end
  object cltItemCategoriaConsulta: TsmClient
    Aggregates = <>
    AggregatesActive = True
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdItemCategoriaConsulta'
    TabelaPrincipal = 'ITEM_CATEGORIA'
    Left = 910
    Top = 527
    object cltItemCategoriaConsultaID_ITEM_CATEGORIA: TcprIntegerField
      FieldName = 'ID_ITEM_CATEGORIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cltItemCategoriaConsultaDS_ITEM_CATEGORIA: TcprStringField
      FieldName = 'DS_ITEM_CATEGORIA'
      Size = 150
    end
    object cltItemCategoriaConsultaFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object cltItemCategoriaConsultaFL_ATIVO_EXT: TcprStringField
      FieldName = 'FL_ATIVO_EXT'
      FixedChar = True
      Size = 3
    end
  end
  object pvdItemCategoriaConsulta: TsmProvider
    DataSet = dtsItemCategoriaConsulta
    Left = 836
    Top = 527
  end
  object dtsItemCategoriaConsulta: TsmDataset
    CommandText = 
      'select vw.id_item_categoria'#13#10'      ,vw.ds_item_categoria'#13#10'      ' +
      ',vw.fl_ativo'#13#10'      ,vw.fl_ativo_ext'#13#10'from VW_ITEM_CATEGORIA_CON' +
      'SULTA vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'ITEM_CATEGORIA'
    Left = 766
    Top = 528
    object dtsItemCategoriaConsultaID_ITEM_CATEGORIA: TIntegerField
      FieldName = 'ID_ITEM_CATEGORIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsItemCategoriaConsultaDS_ITEM_CATEGORIA: TStringField
      FieldName = 'DS_ITEM_CATEGORIA'
      Size = 150
    end
    object dtsItemCategoriaConsultaFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object dtsItemCategoriaConsultaFL_ATIVO_EXT: TStringField
      FieldName = 'FL_ATIVO_EXT'
      FixedChar = True
      Size = 3
    end
  end
  object dtsPessoaConsulta: TsmDataset
    CommandText = 
      'select '#39'N'#39' as selecionado'#13#10'      ,p.id_pessoa'#13#10'      ,p.id_cidad' +
      'e'#13#10'      ,p.nm_pessoa'#13#10'      ,p.tp_pessoa'#13#10'      ,p.fl_ativo'#13#10'  ' +
      '    ,p.id_cpf_cnpj'#13#10'      ,p.id_rg_insc'#13#10'      ,p.nm_fantasia'#13#10' ' +
      '     ,p.ds_endereco'#13#10'      ,p.ds_complemento'#13#10'      ,p.id_cep_pe' +
      'ssoa'#13#10'      ,p.ds_bairro'#13#10'      ,p.nr_telefone'#13#10'      ,p.nr_celu' +
      'lar'#13#10'      ,p.fl_telefoneespecial'#13#10'      ,p.nr_fax'#13#10'      ,p.ds_' +
      'email'#13#10'      ,p.ds_url'#13#10'      ,p.vl_limite_credito'#13#10'      ,p.dt_' +
      'cadastro'#13#10'      ,p.dt_nascimento'#13#10'      ,p.nm_contato'#13#10'      ,p.' +
      'nr_insc_municipal'#13#10'      ,p.id_pessoa_mtz'#13#10'      ,p.pe_comissaop' +
      'adraovendedor'#13#10'      ,p.dt_ultimocontato'#13#10'      ,p.id_vendedorpa' +
      'drao'#13#10'      ,p.nr_diasultimocontato'#13#10'      ,p.nr_inscricaomunici' +
      'pal'#13#10'      ,p.id_sistemaantigo'#13#10'      ,p.ds_endereco_numero'#13#10'   ' +
      '   ,p.ds_caixapostal'#13#10'      ,p.ds_observacao'#13#10'      ,p.nr_ramal'#13 +
      #10'      ,c.nm_cidade as nmcidade'#13#10'      ,c.uf_estado'#13#10'      ,pm.n' +
      'm_pessoa as nomematriz'#13#10'      ,cast((select substring(nm_vendedo' +
      'r from 1 for 100) from PROC_NOMEVENDEDORES_DOCUMENTO(p.id_pessoa' +
      ', '#39'P'#39', 6)) as varchar(100)) as nomevendedor'#13#10'      ,p.ds_empresa' +
      's'#13#10'      ,pescom.fl_sexo'#13#10'      ,case pescom.fl_sexo when '#39'M'#39' th' +
      'en '#39'Masculino'#39#13#10'                           when '#39'F'#39' then '#39'Femini' +
      'no '#39#13#10'       end as fl_sexoextenso'#13#10'      ,ra.ds_ramoatividade'#13#10 +
      '      ,case p.fl_receitaantecipada when '#39'S'#39' then '#39'Sim'#39#13#10'        ' +
      '                           else '#39'N'#227'o'#39#13#10'       end as fl_receitaa' +
      'ntecipadaextenso'#13#10'      ,extract (day from p.dt_nascimento) as d' +
      'ia_nascimento'#13#10'      ,pescom.ds_numerotitulo'#13#10'      ,pescom.ds_z' +
      'onatitulo'#13#10'      ,pescom.ds_secaotitulo'#13#10'      ,p.id_codigo_mobi' +
      'le'#13#10'      ,p.id_tabelapreco'#13#10'      ,s.ds_subnivel'#13#10'      ,o.ds_c' +
      'bo_ocupacao'#13#10'      ,iif(exists(select 1 from pessoa_impressao_di' +
      'gital pid where pid.id_pessoa = p.id_pessoa),'#39'SIM'#39','#39'N'#195'O'#39') as fl_' +
      'impressaodigitalsimnao'#13#10'      ,p.fl_bloqueado'#13#10'      ,p.dt_bloqu' +
      'eadoliberado'#13#10'      ,case when (select first 1 1'#13#10'              ' +
      '    from RECEBERPAGAR rp'#13#10'                  where rp.id_pessoa =' +
      ' p.id_pessoa'#13#10'                  and   rp.dt_vencimento < current' +
      '_date'#13#10'                  and   rp.fl_status in ('#39'ABR'#39','#39'APP'#39','#39'APZ' +
      #39')) > 0 then '#39'S'#39#13#10'            else '#39'N'#39#13#10'       end as fl_parcela' +
      '_vencida'#13#10'      ,rg.ds_regiao'#13#10'      ,m.dt_validadeseguro'#13#10'     ' +
      ' ,rh.dt_admissao'#13#10'      ,rh.dt_demissao'#13#10'      ,pescom.ds_profis' +
      'sao'#13#10'      ,p.vl_frete_tonelada'#13#10'      ,pgd.ds_diasparcelamento'#13 +
      #10'      ,coalesce((select max(cc.nm_cidade || '#39'/'#39' || cc.uf_estado' +
      ')'#13#10'                 from CIDADE cc'#13#10'                      join P' +
      'ESSOAENDERECO pe on (pe.id_pessoa = p.id_pessoa and pe.fl_tipoen' +
      'dereco in ('#39'A'#39','#39'C'#39'))'#13#10'                 where cc.id_cidade = coal' +
      'esce(pe.id_cidade, p.id_cidade)), c.nm_cidade || '#39'/'#39' || c.uf_est' +
      'ado) as ds_cidade_uf_cobranca'#13#10'      ,p.ds_email_doce'#13#10'from PESS' +
      'OA p'#13#10'     join CIDADE c on(c.id_cidade = p.id_cidade)'#13#10'     lef' +
      't join RAMOATIVIDADE ra on(ra.id_ramoatividade = p.id_ramoativid' +
      'ade)'#13#10'     left join PESSOA pm on (pm.id_pessoa = p.id_pessoa_mt' +
      'z)'#13#10'     left join PESSOACOMPLEMENTO pescom on (pescom.id_pessoa' +
      ' = p.id_pessoa and pescom.fl_tipo_pessoacomplemento = '#39'PESS'#39')'#13#10' ' +
      '    left join PESSOA_RH pRH on (pRH.id_pessoa = p.id_pessoa)'#13#10'  ' +
      '   left join SUBNIVEL s on (s.id_subnivel = prh.id_setor and s.d' +
      's_tiposubnivel ='#39'S'#39')'#13#10'     left join CBO_OCUPACAO o on (o.id_cbo' +
      '_ocupacao = prh.id_cbo)'#13#10'     left join regiao rg on (rg.id_regi' +
      'ao = p.id_regiao)'#13#10'     left join pessoamotoristaseguro m on (m.' +
      'id_pessoa = p.id_pessoa)'#13#10'     left join pessoa_rh rh on (rh.id_' +
      'pessoa = p.id_pessoa)'#13#10'     left join PROC_ENDERECOPESSOA (p.id_' +
      'pessoa, '#39'C'#39') proc on (1=1)'#13#10'     left join CIDADE cc on (cc.id_c' +
      'idade = coalesce(proc.id_cidade, p.id_cidade))'#13#10'     left join P' +
      'ROC_GET_DIASPARCELAMENTO(p.id_pessoa,null) pgd on (1=1)'#13#10
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 285
    Top = 199
    object dtsPessoaConsultaSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object dtsPessoaConsultaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInKey]
      Required = True
    end
    object dtsPessoaConsultaID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      ProviderFlags = []
      Required = True
    end
    object dtsPessoaConsultaNM_PESSOA: TStringField
      FieldName = 'NM_PESSOA'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object dtsPessoaConsultaTP_PESSOA: TStringField
      FieldName = 'TP_PESSOA'
      ProviderFlags = []
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtsPessoaConsultaFL_ATIVO: TStringField
      FieldName = 'FL_ATIVO'
      ProviderFlags = []
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtsPessoaConsultaID_CPF_CNPJ: TStringField
      FieldName = 'ID_CPF_CNPJ'
      ProviderFlags = []
      Size = 18
    end
    object dtsPessoaConsultaID_RG_INSC: TStringField
      FieldName = 'ID_RG_INSC'
      ProviderFlags = []
      Size = 15
    end
    object dtsPessoaConsultaNM_FANTASIA: TStringField
      FieldName = 'NM_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaConsultaDS_ENDERECO: TStringField
      FieldName = 'DS_ENDERECO'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaConsultaDS_COMPLEMENTO: TStringField
      FieldName = 'DS_COMPLEMENTO'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaConsultaID_CEP_PESSOA: TIntegerField
      FieldName = 'ID_CEP_PESSOA'
      ProviderFlags = []
    end
    object dtsPessoaConsultaDS_BAIRRO: TStringField
      FieldName = 'DS_BAIRRO'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaConsultaNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object dtsPessoaConsultaNR_CELULAR: TStringField
      FieldName = 'NR_CELULAR'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object dtsPessoaConsultaFL_TELEFONEESPECIAL: TStringField
      FieldName = 'FL_TELEFONEESPECIAL'
      ProviderFlags = []
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtsPessoaConsultaNR_FAX: TStringField
      FieldName = 'NR_FAX'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object dtsPessoaConsultaDS_EMAIL: TStringField
      FieldName = 'DS_EMAIL'
      ProviderFlags = []
      Size = 5000
    end
    object dtsPessoaConsultaDS_URL: TStringField
      FieldName = 'DS_URL'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaConsultaVL_LIMITE_CREDITO: TFloatField
      FieldName = 'VL_LIMITE_CREDITO'
      ProviderFlags = []
      Required = True
    end
    object dtsPessoaConsultaDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      ProviderFlags = []
      Required = True
    end
    object dtsPessoaConsultaDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      ProviderFlags = []
    end
    object dtsPessoaConsultaNM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      ProviderFlags = []
      Size = 50
    end
    object dtsPessoaConsultaNR_INSC_MUNICIPAL: TStringField
      FieldName = 'NR_INSC_MUNICIPAL'
      ProviderFlags = []
    end
    object dtsPessoaConsultaID_PESSOA_MTZ: TIntegerField
      FieldName = 'ID_PESSOA_MTZ'
      ProviderFlags = []
    end
    object dtsPessoaConsultaPE_COMISSAOPADRAOVENDEDOR: TFMTBCDField
      FieldName = 'PE_COMISSAOPADRAOVENDEDOR'
      ProviderFlags = []
      Required = True
      Precision = 15
      Size = 3
    end
    object dtsPessoaConsultaDT_ULTIMOCONTATO: TSQLTimeStampField
      FieldName = 'DT_ULTIMOCONTATO'
      ProviderFlags = []
    end
    object dtsPessoaConsultaID_VENDEDORPADRAO: TIntegerField
      FieldName = 'ID_VENDEDORPADRAO'
      ProviderFlags = []
    end
    object dtsPessoaConsultaNR_DIASULTIMOCONTATO: TIntegerField
      FieldName = 'NR_DIASULTIMOCONTATO'
      ProviderFlags = []
    end
    object dtsPessoaConsultaNR_INSCRICAOMUNICIPAL: TStringField
      FieldName = 'NR_INSCRICAOMUNICIPAL'
      ProviderFlags = []
    end
    object dtsPessoaConsultaID_SISTEMAANTIGO: TIntegerField
      FieldName = 'ID_SISTEMAANTIGO'
      ProviderFlags = []
    end
    object dtsPessoaConsultaDS_ENDERECO_NUMERO: TStringField
      FieldName = 'DS_ENDERECO_NUMERO'
      ProviderFlags = []
      Size = 10
    end
    object dtsPessoaConsultaDS_CAIXAPOSTAL: TStringField
      FieldName = 'DS_CAIXAPOSTAL'
      ProviderFlags = []
      Size = 10
    end
    object dtsPessoaConsultaDS_OBSERVACAO: TStringField
      FieldName = 'DS_OBSERVACAO'
      ProviderFlags = []
      Size = 1000
    end
    object dtsPessoaConsultaNR_RAMAL: TIntegerField
      FieldName = 'NR_RAMAL'
      ProviderFlags = []
    end
    object dtsPessoaConsultaNMCIDADE: TStringField
      FieldName = 'NMCIDADE'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object dtsPessoaConsultaUF_ESTADO: TStringField
      FieldName = 'UF_ESTADO'
      ProviderFlags = []
      Required = True
      FixedChar = True
      Size = 2
    end
    object dtsPessoaConsultaNOMEMATRIZ: TStringField
      FieldName = 'NOMEMATRIZ'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaConsultaNOMEVENDEDOR: TStringField
      FieldName = 'NOMEVENDEDOR'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaConsultaDS_EMPRESAS: TStringField
      FieldName = 'DS_EMPRESAS'
      ProviderFlags = []
      Required = True
      Size = 500
    end
    object dtsPessoaConsultaFL_SEXO: TStringField
      FieldName = 'FL_SEXO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaConsultaFL_SEXOEXTENSO: TStringField
      FieldName = 'FL_SEXOEXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 9
    end
    object dtsPessoaConsultaDS_RAMOATIVIDADE: TStringField
      FieldName = 'DS_RAMOATIVIDADE'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaConsultaFL_RECEITAANTECIPADAEXTENSO: TStringField
      FieldName = 'FL_RECEITAANTECIPADAEXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsPessoaConsultaDIA_NASCIMENTO: TSmallintField
      FieldName = 'DIA_NASCIMENTO'
      ProviderFlags = []
    end
    object dtsPessoaConsultaDS_NUMEROTITULO: TStringField
      FieldName = 'DS_NUMEROTITULO'
      ProviderFlags = []
      Size = 30
    end
    object dtsPessoaConsultaDS_ZONATITULO: TStringField
      FieldName = 'DS_ZONATITULO'
      ProviderFlags = []
      Size = 10
    end
    object dtsPessoaConsultaDS_SECAOTITULO: TStringField
      FieldName = 'DS_SECAOTITULO'
      ProviderFlags = []
      Size = 10
    end
    object dtsPessoaConsultaID_CODIGO_MOBILE: TStringField
      FieldName = 'ID_CODIGO_MOBILE'
      ProviderFlags = []
      Size = 30
    end
    object dtsPessoaConsultaID_TABELAPRECO: TIntegerField
      FieldName = 'ID_TABELAPRECO'
      ProviderFlags = []
    end
    object dtsPessoaConsultaDS_SUBNIVEL: TStringField
      FieldName = 'DS_SUBNIVEL'
      ProviderFlags = []
      Size = 120
    end
    object dtsPessoaConsultaDS_CBO_OCUPACAO: TStringField
      FieldName = 'DS_CBO_OCUPACAO'
      ProviderFlags = []
      Size = 200
    end
    object dtsPessoaConsultaFL_IMPRESSAODIGITALSIMNAO: TStringField
      FieldName = 'FL_IMPRESSAODIGITALSIMNAO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object dtsPessoaConsultaFL_BLOQUEADO: TStringField
      FieldName = 'FL_BLOQUEADO'
      ProviderFlags = []
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtsPessoaConsultaDT_BLOQUEADOLIBERADO: TSQLTimeStampField
      FieldName = 'DT_BLOQUEADOLIBERADO'
      ProviderFlags = []
    end
    object dtsPessoaConsultaFL_PARCELA_VENCIDA: TStringField
      FieldName = 'FL_PARCELA_VENCIDA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object dtsPessoaConsultaDS_REGIAO: TStringField
      FieldName = 'DS_REGIAO'
      ProviderFlags = []
      Size = 100
    end
    object dtsPessoaConsultaDT_VALIDADESEGURO: TDateField
      FieldName = 'DT_VALIDADESEGURO'
      ProviderFlags = []
    end
    object dtsPessoaConsultaDT_ADMISSAO: TDateField
      FieldName = 'DT_ADMISSAO'
      ProviderFlags = []
    end
    object dtsPessoaConsultaDT_DEMISSAO: TDateField
      FieldName = 'DT_DEMISSAO'
      ProviderFlags = []
    end
    object dtsPessoaConsultaDS_PROFISSAO: TStringField
      FieldName = 'DS_PROFISSAO'
      ProviderFlags = []
      Size = 50
    end
    object dtsPessoaConsultaVL_FRETE_TONELADA: TFloatField
      FieldName = 'VL_FRETE_TONELADA'
      ProviderFlags = []
    end
    object dtsPessoaConsultaDS_DIASPARCELAMENTO: TStringField
      FieldName = 'DS_DIASPARCELAMENTO'
      ProviderFlags = []
      Size = 250
    end
    object dtsPessoaConsultaDS_CIDADE_UF_COBRANCA: TStringField
      FieldName = 'DS_CIDADE_UF_COBRANCA'
      ProviderFlags = []
      Size = 103
    end
    object dtsPessoaConsultaDS_EMAIL_DOCE: TStringField
      FieldName = 'DS_EMAIL_DOCE'
      Size = 5000
    end
  end
  object pvdPessoaConsulta: TsmProvider
    DataSet = dtsPessoaConsulta
    Options = [poAutoRefresh]
    OnGetTableName = pvdPessoaGetTableName
    Left = 357
    Top = 200
  end
  object cltPessoaConsulta: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdPessoaConsulta'
    OnReconcileError = cltPessoaReconcileError
    TabelaPrincipal = 'PESSOA'
    Left = 428
    Top = 200
    object cltPessoaConsultaSELECIONADO: TcprStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object cltPessoaConsultaID_PESSOA: TcprIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInKey]
      Required = True
    end
    object cltPessoaConsultaID_CIDADE: TcprIntegerField
      FieldName = 'ID_CIDADE'
      ProviderFlags = []
      Required = True
    end
    object cltPessoaConsultaNM_PESSOA: TcprStringField
      FieldName = 'NM_PESSOA'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cltPessoaConsultaTP_PESSOA: TcprStringField
      FieldName = 'TP_PESSOA'
      ProviderFlags = []
      Required = True
      FixedChar = True
      Size = 1
    end
    object cltPessoaConsultaFL_ATIVO: TcprStringField
      FieldName = 'FL_ATIVO'
      ProviderFlags = []
      Required = True
      FixedChar = True
      Size = 1
    end
    object cltPessoaConsultaID_CPF_CNPJ: TcprStringField
      FieldName = 'ID_CPF_CNPJ'
      ProviderFlags = []
      Size = 18
    end
    object cltPessoaConsultaID_RG_INSC: TcprStringField
      FieldName = 'ID_RG_INSC'
      ProviderFlags = []
      Size = 15
    end
    object cltPessoaConsultaNM_FANTASIA: TcprStringField
      FieldName = 'NM_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaConsultaDS_ENDERECO: TcprStringField
      FieldName = 'DS_ENDERECO'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaConsultaDS_COMPLEMENTO: TcprStringField
      FieldName = 'DS_COMPLEMENTO'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaConsultaID_CEP_PESSOA: TcprIntegerField
      FieldName = 'ID_CEP_PESSOA'
      ProviderFlags = []
    end
    object cltPessoaConsultaDS_BAIRRO: TcprStringField
      FieldName = 'DS_BAIRRO'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaConsultaNR_TELEFONE: TcprStringField
      FieldName = 'NR_TELEFONE'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object cltPessoaConsultaNR_CELULAR: TcprStringField
      FieldName = 'NR_CELULAR'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object cltPessoaConsultaFL_TELEFONEESPECIAL: TcprStringField
      FieldName = 'FL_TELEFONEESPECIAL'
      ProviderFlags = []
      Required = True
      FixedChar = True
      Size = 1
    end
    object cltPessoaConsultaNR_FAX: TcprStringField
      FieldName = 'NR_FAX'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object cltPessoaConsultaDS_EMAIL: TcprStringField
      FieldName = 'DS_EMAIL'
      ProviderFlags = []
      Size = 5000
    end
    object cltPessoaConsultaDS_URL: TcprStringField
      FieldName = 'DS_URL'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaConsultaVL_LIMITE_CREDITO: TcprFloatField
      FieldName = 'VL_LIMITE_CREDITO'
      ProviderFlags = []
      Required = True
    end
    object cltPessoaConsultaDT_CADASTRO: TcprDateField
      FieldName = 'DT_CADASTRO'
      ProviderFlags = []
      Required = True
    end
    object cltPessoaConsultaDT_NASCIMENTO: TcprDateField
      FieldName = 'DT_NASCIMENTO'
      ProviderFlags = []
    end
    object cltPessoaConsultaNM_CONTATO: TcprStringField
      FieldName = 'NM_CONTATO'
      ProviderFlags = []
      Size = 50
    end
    object cltPessoaConsultaNR_INSC_MUNICIPAL: TcprStringField
      FieldName = 'NR_INSC_MUNICIPAL'
      ProviderFlags = []
    end
    object cltPessoaConsultaID_PESSOA_MTZ: TcprIntegerField
      FieldName = 'ID_PESSOA_MTZ'
      ProviderFlags = []
    end
    object cltPessoaConsultaPE_COMISSAOPADRAOVENDEDOR: TcprFMTBcdField
      FieldName = 'PE_COMISSAOPADRAOVENDEDOR'
      ProviderFlags = []
      Required = True
      Precision = 15
      Size = 3
    end
    object cltPessoaConsultaDT_ULTIMOCONTATO: TcprSQLTimeStampField
      FieldName = 'DT_ULTIMOCONTATO'
      ProviderFlags = []
    end
    object cltPessoaConsultaID_VENDEDORPADRAO: TcprIntegerField
      FieldName = 'ID_VENDEDORPADRAO'
      ProviderFlags = []
    end
    object cltPessoaConsultaNR_DIASULTIMOCONTATO: TcprIntegerField
      FieldName = 'NR_DIASULTIMOCONTATO'
      ProviderFlags = []
    end
    object cltPessoaConsultaNR_INSCRICAOMUNICIPAL: TcprStringField
      FieldName = 'NR_INSCRICAOMUNICIPAL'
      ProviderFlags = []
    end
    object cltPessoaConsultaID_SISTEMAANTIGO: TcprIntegerField
      FieldName = 'ID_SISTEMAANTIGO'
      ProviderFlags = []
    end
    object cltPessoaConsultaDS_ENDERECO_NUMERO: TcprStringField
      FieldName = 'DS_ENDERECO_NUMERO'
      ProviderFlags = []
      Size = 10
    end
    object cltPessoaConsultaDS_CAIXAPOSTAL: TcprStringField
      FieldName = 'DS_CAIXAPOSTAL'
      ProviderFlags = []
      Size = 10
    end
    object cltPessoaConsultaDS_OBSERVACAO: TcprStringField
      FieldName = 'DS_OBSERVACAO'
      ProviderFlags = []
      Size = 1000
    end
    object cltPessoaConsultaNR_RAMAL: TcprIntegerField
      FieldName = 'NR_RAMAL'
      ProviderFlags = []
    end
    object cltPessoaConsultaNMCIDADE: TcprStringField
      FieldName = 'NMCIDADE'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cltPessoaConsultaUF_ESTADO: TcprStringField
      FieldName = 'UF_ESTADO'
      ProviderFlags = []
      Required = True
      FixedChar = True
      Size = 2
    end
    object cltPessoaConsultaNOMEMATRIZ: TcprStringField
      FieldName = 'NOMEMATRIZ'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaConsultaNOMEVENDEDOR: TcprStringField
      FieldName = 'NOMEVENDEDOR'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaConsultaDS_EMPRESAS: TcprStringField
      FieldName = 'DS_EMPRESAS'
      ProviderFlags = []
      Required = True
      Size = 500
    end
    object cltPessoaConsultaFL_SEXO: TcprStringField
      FieldName = 'FL_SEXO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaConsultaFL_SEXOEXTENSO: TcprStringField
      FieldName = 'FL_SEXOEXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 9
    end
    object cltPessoaConsultaDS_RAMOATIVIDADE: TcprStringField
      FieldName = 'DS_RAMOATIVIDADE'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaConsultaFL_RECEITAANTECIPADAEXTENSO: TcprStringField
      FieldName = 'FL_RECEITAANTECIPADAEXTENSO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltPessoaConsultaDIA_NASCIMENTO: TcprSmallintField
      FieldName = 'DIA_NASCIMENTO'
      ProviderFlags = []
    end
    object cltPessoaConsultaDS_NUMEROTITULO: TcprStringField
      FieldName = 'DS_NUMEROTITULO'
      ProviderFlags = []
      Size = 30
    end
    object cltPessoaConsultaDS_ZONATITULO: TcprStringField
      FieldName = 'DS_ZONATITULO'
      ProviderFlags = []
      Size = 10
    end
    object cltPessoaConsultaDS_SECAOTITULO: TcprStringField
      FieldName = 'DS_SECAOTITULO'
      ProviderFlags = []
      Size = 10
    end
    object cltPessoaConsultaID_CODIGO_MOBILE: TcprStringField
      FieldName = 'ID_CODIGO_MOBILE'
      ProviderFlags = []
      Size = 30
    end
    object cltPessoaConsultaID_TABELAPRECO: TcprIntegerField
      FieldName = 'ID_TABELAPRECO'
      ProviderFlags = []
    end
    object cltPessoaConsultaDS_SUBNIVEL: TcprStringField
      FieldName = 'DS_SUBNIVEL'
      ProviderFlags = []
      Size = 120
    end
    object cltPessoaConsultaDS_CBO_OCUPACAO: TcprStringField
      FieldName = 'DS_CBO_OCUPACAO'
      ProviderFlags = []
      Size = 200
    end
    object cltPessoaConsultaFL_IMPRESSAODIGITALSIMNAO: TcprStringField
      FieldName = 'FL_IMPRESSAODIGITALSIMNAO'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object cltPessoaConsultaFL_BLOQUEADO: TcprStringField
      FieldName = 'FL_BLOQUEADO'
      ProviderFlags = []
      Required = True
      FixedChar = True
      Size = 1
    end
    object cltPessoaConsultaDT_BLOQUEADOLIBERADO: TcprSQLTimeStampField
      FieldName = 'DT_BLOQUEADOLIBERADO'
      ProviderFlags = []
    end
    object cltPessoaConsultaFL_PARCELA_VENCIDA: TcprStringField
      FieldName = 'FL_PARCELA_VENCIDA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cltPessoaConsultaDS_REGIAO: TcprStringField
      FieldName = 'DS_REGIAO'
      ProviderFlags = []
      Size = 100
    end
    object cltPessoaConsultaDT_VALIDADESEGURO: TcprDateField
      FieldName = 'DT_VALIDADESEGURO'
      ProviderFlags = []
    end
    object cltPessoaConsultaDT_ADMISSAO: TcprDateField
      FieldName = 'DT_ADMISSAO'
      ProviderFlags = []
    end
    object cltPessoaConsultaDT_DEMISSAO: TcprDateField
      FieldName = 'DT_DEMISSAO'
      ProviderFlags = []
    end
    object cltPessoaConsultaDS_PROFISSAO: TcprStringField
      FieldName = 'DS_PROFISSAO'
      ProviderFlags = []
      Size = 50
    end
    object cltPessoaConsultaVL_FRETE_TONELADA: TcprFloatField
      FieldName = 'VL_FRETE_TONELADA'
      ProviderFlags = []
    end
    object cltPessoaConsultaDS_DIASPARCELAMENTO: TcprStringField
      FieldName = 'DS_DIASPARCELAMENTO'
      ProviderFlags = []
      Size = 250
    end
    object cltPessoaConsultaDS_CIDADE_UF_COBRANCA: TcprStringField
      FieldName = 'DS_CIDADE_UF_COBRANCA'
      ProviderFlags = []
      Size = 103
    end
    object cltPessoaConsultaDS_EMAIL_DOCE: TcprStringField
      FieldName = 'DS_EMAIL_DOCE'
      Size = 5000
    end
  end
  object dtsContatoAutorizadoConsulta: TsmDataset
    CommandText = 
      'select vw.id_pessoa'#13#10'      ,vw.id_contato'#13#10'      ,vw.id_pessoa_c' +
      'ontato'#13#10'      ,vw.ds_nomecontato'#13#10'      ,vw.bl_foto'#13#10'from VW_CON' +
      'TATO_AUTORIZADO vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'VW_CONTATO_AUTORIZADO'
    Left = 766
    Top = 577
    object dtsContatoAutorizadoConsultaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object dtsContatoAutorizadoConsultaID_CONTATO: TSmallintField
      Tag = 1
      FieldName = 'ID_CONTATO'
    end
    object dtsContatoAutorizadoConsultaID_PESSOA_CONTATO: TIntegerField
      FieldName = 'ID_PESSOA_CONTATO'
    end
    object dtsContatoAutorizadoConsultaDS_NOMECONTATO: TStringField
      FieldName = 'DS_NOMECONTATO'
      Size = 100
    end
    object dtsContatoAutorizadoConsultaBL_FOTO: TBlobField
      FieldName = 'BL_FOTO'
    end
  end
  object pvdContatoAutorizadoConsulta: TsmProvider
    DataSet = dtsContatoAutorizadoConsulta
    Options = [poFetchBlobsOnDemand, poAutoRefresh]
    Left = 833
    Top = 577
  end
  object cltContatoAutorizadoConsulta: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdContatoAutorizadoConsulta'
    TabelaPrincipal = 'VW_CONTATO_AUTORIZADO'
    Left = 902
    Top = 577
    object cltContatoAutorizadoConsultaID_PESSOA: TcprIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cltContatoAutorizadoConsultaID_CONTATO: TcprSmallintField
      Tag = 1
      FieldName = 'ID_CONTATO'
      DisplayFormat = '0000'
    end
    object cltContatoAutorizadoConsultaID_PESSOA_CONTATO: TcprIntegerField
      FieldName = 'ID_PESSOA_CONTATO'
    end
    object cltContatoAutorizadoConsultaDS_NOMECONTATO: TcprStringField
      FieldName = 'DS_NOMECONTATO'
      Size = 100
    end
    object cltContatoAutorizadoConsultaBL_FOTO: TcprBlobField
      FieldName = 'BL_FOTO'
    end
  end
  object dtsPlanos: TsmDataset
    CommandText = 
      'select vw.id_contrato_plano'#13#10'     , vw.id_plano_ecomerce'#13#10'     ,' +
      ' vw.ds_contrato_plano'#13#10'     , vw.vl_plano'#13#10'     , vw.fl_tipo_cob' +
      'ranca'#13#10'     , vw.fl_tipo_plano'#13#10'     , vw.fl_tipo_fiscal'#13#10'     ,' +
      ' vw.fl_tipo_cobranca_ext'#13#10'     , vw.fl_tipo_plano_ext'#13#10'     , vw' +
      '.fl_tipo_fiscal_ext'#13#10'from VW_LST_CONTRATO_PLANO vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'VW_CONTATO_AUTORIZADO'
    Left = 766
    Top = 625
    object dtsPlanosID_CONTRATO_PLANO: TIntegerField
      FieldName = 'ID_CONTRATO_PLANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsPlanosID_PLANO_ECOMERCE: TIntegerField
      FieldName = 'ID_PLANO_ECOMERCE'
    end
    object dtsPlanosDS_CONTRATO_PLANO: TStringField
      FieldName = 'DS_CONTRATO_PLANO'
      Size = 100
    end
    object dtsPlanosVL_PLANO: TFloatField
      FieldName = 'VL_PLANO'
    end
    object dtsPlanosFL_TIPO_COBRANCA: TStringField
      FieldName = 'FL_TIPO_COBRANCA'
      FixedChar = True
      Size = 1
    end
    object dtsPlanosFL_TIPO_PLANO: TStringField
      FieldName = 'FL_TIPO_PLANO'
      FixedChar = True
      Size = 1
    end
    object dtsPlanosFL_TIPO_FISCAL: TStringField
      FieldName = 'FL_TIPO_FISCAL'
      FixedChar = True
      Size = 1
    end
    object dtsPlanosFL_TIPO_COBRANCA_EXT: TStringField
      FieldName = 'FL_TIPO_COBRANCA_EXT'
      FixedChar = True
      Size = 8
    end
    object dtsPlanosFL_TIPO_PLANO_EXT: TStringField
      FieldName = 'FL_TIPO_PLANO_EXT'
      FixedChar = True
      Size = 11
    end
    object dtsPlanosFL_TIPO_FISCAL_EXT: TStringField
      FieldName = 'FL_TIPO_FISCAL_EXT'
      FixedChar = True
      Size = 6
    end
  end
  object pvdPlanos: TsmProvider
    DataSet = dtsPlanos
    Options = [poFetchBlobsOnDemand, poAutoRefresh]
    Left = 833
    Top = 625
  end
  object cltPlanos: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdPlanos'
    Left = 902
    Top = 625
    object cltPlanosID_CONTRATO_PLANO: TcprIntegerField
      FieldName = 'ID_CONTRATO_PLANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '0000'
    end
    object cltPlanosID_PLANO_ECOMERCE: TcprIntegerField
      FieldName = 'ID_PLANO_ECOMERCE'
      DisplayFormat = '0000'
    end
    object cltPlanosDS_CONTRATO_PLANO: TcprStringField
      FieldName = 'DS_CONTRATO_PLANO'
      Size = 100
    end
    object cltPlanosVL_PLANO: TcprFloatField
      FieldName = 'VL_PLANO'
      DisplayFormat = '#,##0.00'
    end
    object cltPlanosFL_TIPO_COBRANCA: TcprStringField
      FieldName = 'FL_TIPO_COBRANCA'
      FixedChar = True
      Size = 1
    end
    object cltPlanosFL_TIPO_PLANO: TcprStringField
      FieldName = 'FL_TIPO_PLANO'
      FixedChar = True
      Size = 1
    end
    object cltPlanosFL_TIPO_FISCAL: TcprStringField
      FieldName = 'FL_TIPO_FISCAL'
      FixedChar = True
      Size = 1
    end
    object cltPlanosFL_TIPO_COBRANCA_EXT: TcprStringField
      FieldName = 'FL_TIPO_COBRANCA_EXT'
      FixedChar = True
      Size = 8
    end
    object cltPlanosFL_TIPO_PLANO_EXT: TcprStringField
      FieldName = 'FL_TIPO_PLANO_EXT'
      FixedChar = True
      Size = 11
    end
    object cltPlanosFL_TIPO_FISCAL_EXT: TcprStringField
      FieldName = 'FL_TIPO_FISCAL_EXT'
      FixedChar = True
      Size = 6
    end
  end
  object dtsSala: TsmDataset
    CommandText = 'select vw.id_sala'#13#10'     , vw.ds_sala'#13#10'from VW_LST_SALA vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'VW_LST_SALA'
    Left = 766
    Top = 681
    object dtsSalaID_SALA: TIntegerField
      FieldName = 'ID_SALA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsSalaDS_SALA: TStringField
      FieldName = 'DS_SALA'
      Size = 150
    end
  end
  object pvdSala: TsmProvider
    DataSet = dtsSala
    Options = [poFetchBlobsOnDemand, poAutoRefresh]
    Left = 833
    Top = 681
  end
  object cltSala: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdSala'
    Left = 902
    Top = 681
    object cltSalaID_SALA: TcprIntegerField
      FieldName = 'ID_SALA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '0000'
    end
    object cltSalaDS_SALA: TcprStringField
      FieldName = 'DS_SALA'
      Size = 150
    end
  end
  object cltAverbacao: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'ID_AVERBACAO'
        DataType = ftInteger
      end
      item
        Name = 'ID_DOC'
        DataType = ftInteger
      end
      item
        Name = 'FL_DOC'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'FL_DOC_EXT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'FL_STATUS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FL_STATUS_EXT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'DS_INFOADICIONAIS'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DT_AVERBACAO'
        DataType = ftTimeStamp
      end
      item
        Name = 'DS_PROTOCOLO'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'pvdAverbacao'
    StoreDefs = True
    Left = 902
    Top = 737
    object cltAverbacaoID_AVERBACAO: TcprIntegerField
      Tag = 1
      FieldName = 'ID_AVERBACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cltAverbacaoID_DOC: TcprIntegerField
      FieldName = 'ID_DOC'
      ProviderFlags = [pfInUpdate]
    end
    object cltAverbacaoFL_DOC: TcprStringField
      FieldName = 'FL_DOC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object cltAverbacaoFL_DOC_EXT: TcprStringField
      FieldName = 'FL_DOC_EXT'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cltAverbacaoFL_STATUS: TcprStringField
      FieldName = 'FL_STATUS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cltAverbacaoFL_STATUS_EXT: TcprStringField
      FieldName = 'FL_STATUS_EXT'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object cltAverbacaoDS_INFOADICIONAIS: TcprStringField
      FieldName = 'DS_INFOADICIONAIS'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cltAverbacaoDT_AVERBACAO: TcprSQLTimeStampField
      FieldName = 'DT_AVERBACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cltAverbacaoDS_PROTOCOLO: TcprStringField
      FieldName = 'DS_PROTOCOLO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object pvdAverbacao: TsmProvider
    DataSet = dtsAverbacao
    Options = [poAutoRefresh]
    UpdateMode = upWhereKeyOnly
    OnGetTableName = pvdCEPGetTableName
    Left = 832
    Top = 737
  end
  object dtsAverbacao: TsmDataset
    CommandText = 
      'select vw.id_averbacao'#13#10'      ,vw.id_doc'#13#10'      ,vw.fl_doc'#13#10'    ' +
      '  ,vw.fl_doc_ext'#13#10'      ,vw.fl_status'#13#10'      ,vw.fl_status_ext'#13#10 +
      '      ,vw.ds_infoadicionais'#13#10'      ,vw.dt_averbacao'#13#10'      ,vw.d' +
      's_protocolo'#13#10'from VW_LST_AVERBACAO vw'
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    Left = 766
    Top = 737
    object dtsAverbacaoID_AVERBACAO: TIntegerField
      Tag = 1
      FieldName = 'ID_AVERBACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtsAverbacaoID_DOC: TIntegerField
      FieldName = 'ID_DOC'
      ProviderFlags = [pfInUpdate]
    end
    object dtsAverbacaoFL_DOC: TStringField
      FieldName = 'FL_DOC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dtsAverbacaoFL_DOC_EXT: TStringField
      FieldName = 'FL_DOC_EXT'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dtsAverbacaoFL_STATUS: TStringField
      FieldName = 'FL_STATUS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtsAverbacaoFL_STATUS_EXT: TStringField
      FieldName = 'FL_STATUS_EXT'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object dtsAverbacaoDS_INFOADICIONAIS: TStringField
      FieldName = 'DS_INFOADICIONAIS'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtsAverbacaoDT_AVERBACAO: TSQLTimeStampField
      FieldName = 'DT_AVERBACAO'
      ProviderFlags = [pfInUpdate]
    end
    object dtsAverbacaoDS_PROTOCOLO: TStringField
      FieldName = 'DS_PROTOCOLO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object dtsTipoInativacao: TsmDataset
    CommandText = 
      'select tg.id_tipo'#13#10'      ,tg.ds_tipo'#13#10'from TIPO_GENERICO tg'#13#10'whe' +
      're tg.fl_tipo = '#39'I'#39#13#10
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'TIPO_GENERICO'
    Left = 30
    Top = 828
  end
  object pvdTipoInativacao: TsmProvider
    DataSet = dtsTipoInativacao
    OnGetTableName = pvdTipoInativacaoGetTableName
    Left = 97
    Top = 828
  end
  object cltTipoInativacao: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdTipoInativacao'
    TabelaPrincipal = 'TIPO_GENERICO'
    Left = 166
    Top = 828
    object cltTipoInativacaoID_TIPO: TcprIntegerField
      Tag = 1
      Alignment = taCenter
      FieldName = 'ID_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000'
    end
    object cltTipoInativacaoDS_TIPO: TcprStringField
      FieldName = 'DS_TIPO'
      Required = True
      Size = 250
    end
  end
  object dtsTipoOrigemPessoa: TsmDataset
    CommandText = 
      'select tg.id_tipo, tg.ds_tipo'#13#10'from TIPO_GENERICO tg'#13#10'where tg.f' +
      'l_tipo = '#39'O'#39#13#10
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'TIPO_GENERICO'
    Left = 766
    Top = 788
  end
  object pvdTipoOrigemPessoa: TsmProvider
    DataSet = dtsTipoOrigemPessoa
    OnGetTableName = pvdTipoOrigemPessoaGetTableName
    Left = 833
    Top = 788
  end
  object cltTipoOrigemPessoa: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdTipoOrigemPessoa'
    TabelaPrincipal = 'TIPO_GENERICO'
    Left = 902
    Top = 788
    object cltTipoOrigemPessoaID_TIPO: TcprIntegerField
      Tag = 1
      Alignment = taCenter
      FieldName = 'ID_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000'
    end
    object cltTipoOrigemPessoaDS_TIPO: TcprStringField
      FieldName = 'DS_TIPO'
      Required = True
      Size = 250
    end
  end
  object dtsBanho: TsmDataset
    CommandText = 
      'select tg.id_tipo'#13#10'      ,tg.ds_tipo'#13#10'from TIPO_GENERICO tg'#13#10'whe' +
      're tg.fl_tipo = '#39'B'#39#13#10
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQLConnection = Con
    TabelaPrincipal = 'TIPO_GENERICO'
    Left = 286
    Top = 836
  end
  object pvdBanho: TsmProvider
    DataSet = dtsBanho
    OnGetTableName = pvdTipoInativacaoGetTableName
    Left = 353
    Top = 836
  end
  object cltBanho: TsmClient
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'pvdBanho'
    TabelaPrincipal = 'TIPO_GENERICO'
    Left = 422
    Top = 836
    object cltBanhoID_TIPO: TcprIntegerField
      Tag = 1
      FieldName = 'ID_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cltBanhoDS_TIPO: TcprStringField
      FieldName = 'DS_TIPO'
      Required = True
      Size = 250
    end
  end
end
