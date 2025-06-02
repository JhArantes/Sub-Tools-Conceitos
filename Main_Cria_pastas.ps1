# Diretório base onde as pastas serão criadas
$baseDir = "."

# Estrutura de tópicos e subpastas
$estrutura = @{
    "1_Desenvolvimento_e_Automacao" = @(
        "APIs_e_Web_Services_REST_GraphQL_gRPC",
        "Containerizacao_e_Orquestracao_Docker_Kubernetes_Airflow",
        "Controle_de_Versao_Git_GitHub_GitLab_CI_CD",
        "Protocolos_de_Rede_HTTP_TCP_gRPC"
    )
    "2_Infraestrutura_e_Cloud" = @(
        "Infraestrutura_como_Codigo_Terraform_Ansible",
        "Cloud_Computing_AWS_GCP_Azure",
        "Servicos_Gerenciados_Kafka_Snowflake_Redshift"
    )
    "3_Processamento_de_Dados" = @(
        "Bancos_de_Dados",
        "SQL_PostgreSQL_MySQL_Oracle",
        "NoSQL_MongoDB_Cassandra_Redis",
        "Data_Warehouses_Snowflake_BigQuery_Redshift",
        "ETL_ELT_Spark_Airflow_dbt_Talend"
    )
    "4_Big_Data_e_Distribuidos" = @(
        "Frameworks_Processamento_Spark_Flink_Hadoop",
        "Streaming_Kafka_Pulsar_SparkStreaming",
        "Formatos_Parquet_Delta_Avro"
    )
    "5_Seguranca_e_Acesso" = @(
        "Autenticacao_Autorizacao_OAuth_IAM_Kerberos",
        "Criptografia_SSL_TLS_PGP",
        "Acesso_Remoto_SSH_VPN_Bastion"
    )
    "6_Testes_e_Qualidade_de_Dados" = @(
        "Testes_de_Pipeline_Unitarios_Integracao_DataChecks",
        "Ferramentas_GreatExpectations_Deequ_pytest",
        "Monitoramento_Prometheus_Grafana_Datadog"
    )
    "7_Scripting_e_Linha_de_Comando" = @(
        "Shell_Script_Bash_Zsh",
        "Linguagens_de_Script_Python_PySpark_Scala"
    )
    "8_Observability_e_Logs" = @(
        "Gestao_de_Logs_ELK_Splunk_Fluentd",
        "Monitoramento_de_Pipelines_Airflow_Alerts_Spark_UI"
    )
    "9_Governanca_e_Metadados" = @(
        "Catalogos_de_Dados_DataHub_Amundsen_Unity",
        "Linage_Metadata_OpenLineage_Marquez"
    )
    "10_Machine_Learning_Engineering" = @(
        "MLOps_MLflow_Kubeflow_TFX",
        "Feature_Stores_Feast_Hopsworks"
    )
}

# Cria o diretório base se não existir
if (-not (Test-Path -Path $baseDir)) {
    New-Item -ItemType Directory -Path $baseDir | Out-Null
}

# Inicializa conteúdo do README principal
$readmePrincipal = "# Engenharia de Dados: Sub-Tools e Conceitos Fundamentais`n`n## Índice`n"

# Cria as pastas e subpastas
foreach ($categoria in $estrutura.Keys) {
    $categoriaPath = Join-Path -Path $baseDir -ChildPath $categoria
    New-Item -ItemType Directory -Path $categoriaPath -Force | Out-Null
    $readmePrincipal += "`n### $categoria`n"

    foreach ($subpasta in $estrutura[$categoria]) {
        $subpastaPath = Join-Path -Path $categoriaPath -ChildPath $subpasta
        New-Item -ItemType Directory -Path $subpastaPath -Force | Out-Null
        $readmePath = Join-Path -Path $subpastaPath -ChildPath "README.md"
        "## $subpasta`nConteúdo em construção." | Out-File -FilePath $readmePath -Encoding utf8
        $relPath = "$categoria/$subpasta"
        $readmePrincipal += "- [$subpasta]($relPath/README.md)`n"
    }
}

# Salva o README principal
$readmePrincipalPath = Join-Path -Path $baseDir -ChildPath "README.md"
$readmePrincipal | Out-File -FilePath $readmePrincipalPath -Encoding utf8

Write-Host "Estrutura de pastas criada com sucesso em '$baseDir'"
