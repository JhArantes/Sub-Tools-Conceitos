


# Diretório base onde as pastas serão criadas
$baseDir = "."

# Estrutura de pastas (categorias e subpastas)
$estrutura = @{
    "1_Desenvolvimento_e_Automacao" = @(
        "APIs_e_WebServices",
        "Contêinerizacao_e_Orquestracao",
        "Controle_de_Versao",
        "Protocolos_de_Rede"
    );
    "2_Infraestrutura_e_Cloud" = @(
        "Infraestrutura_como_Codigo_IaC",
        "Cloud_Computing",
        "Servicos_Gerenciados"
    );
    "3_Processamento_de_Dados" = @(
        "Bancos_de_Dados_SQL",
        "Bancos_de_Dados_NoSQL",
        "Data_Warehouses",
        "Ferramentas_ETL_ELT"
    );
    "4_Big_Data_e_Distributed_Systems" = @(
        "Frameworks_de_Processamento",
        "Streaming_de_Dados",
        "Formatos_de_Armazenamento"
    );
    "5_Seguranca_e_Acesso" = @(
        "Autenticacao_e_Autorizacao",
        "Criptografia",
        "Acesso_Remoto"
    );
    "6_Testes_e_Qualidade_de_Dados" = @(
        "Testes_de_Pipeline",
        "Ferramentas_de_Qualidade",
        "Monitoramento"
    );
    "7_Scripting_e_Linha_de_Comando" = @(
        "Shell_Script",
        "Linguagens_de_Script"
    );
    "8_Observability_e_Logs" = @(
        "Gestao_de_Logs",
        "Monitoramento_de_Pipelines"
    );
    "9_Governanca_e_Metadados" = @(
        "Catalogos_de_Dados",
        "Linage_e_Metadata_Management"
    );
    "10_Machine_Learning_Engineering" = @(
        "MLOps",
        "Feature_Stores"
    )
}

# Cria o diretório base (se não existir)
if (-not (Test-Path -Path $baseDir)) {
    New-Item -ItemType Directory -Path $baseDir | Out-Null
    Write-Host "Diretório base criado: $baseDir"
}

# Cria as pastas, subpastas e README.md
foreach ($categoria in $estrutura.Keys) {
    $categoriaPath = Join-Path -Path $baseDir -ChildPath $categoria
    New-Item -ItemType Directory -Path $categoriaPath | Out-Null
    Write-Host "Categoria criada: $categoriaPath"

    foreach ($subpasta in $estrutura[$categoria]) {
        $subpastaPath = Join-Path -Path $categoriaPath -ChildPath $subpasta
        New-Item -ItemType Directory -Path $subpastaPath | Out-Null
        New-Item -ItemType File -Path "$subpastaPath\README.md" | Out-Null  # ← Cria README.md
        Write-Host "Subpasta criada: $subpastaPath (com README.md)"
    }
}

Write-Host "Estrutura de pastas criada com sucesso em $baseDir!"