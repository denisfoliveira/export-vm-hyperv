# Variáveis
cd c:\backupVM
$VMName = "Sistema"
$ExportPath = "C:\BackupVM\"
$CurrentDate = Get-Date -Format "yyyyMMdd_HHmmss" # Obtem a data atual no formato desejado
$ZipFileName = "$VMName" + "_" + "$CurrentDate.zip" # Nome do arquivo ZIP
$ZipFilePath = Join-Path -Path $ExportPath -ChildPath $ZipFileName # Caminho completo do arquivo ZIP
$SevenZipPath = "C:\Program Files\7-Zip\7z.exe" # Caminho para o executável 7-Zip
$FolderPathToDelete = "$ExportPath\$VMName" # Caminho da pasta a ser excluída
$BackupFilePattern = "$VMName*.zip" # Padrão de nome de arquivo de backup


# Verifica se existe arquivo de backup antigo
if (Test-Path -Path "$ExportPath\$BackupFilePattern") {
    Write-Host "Apagando Backups Antigos..."
    Remove-Item -Path $BackupFilePattern -Force
    Write-Host "Os Backups antigos foram removidos."
} else {
    Write-Host "Nao existem backups para serem removidos."
}


# Exporta a máquina virtual
Export-VM -Name $VMName -Path $ExportPath

# Compacta o arquivo de exportação usando o 7-Zip
if (Test-Path $SevenZipPath) {
    Write-Host "Compactando arquivo de exportação..."
    & $SevenZipPath a -tzip $ZipFilePath "$ExportPath\*"
    Write-Host "Backup concluido. Arquivo compactado: $ZipFilePath"
} else {
    Write-Host "Erro: O executável do 7-Zip não foi encontrado em $SevenZipPath"
}

# Verifica se a pasta a ser excluída existe e a exclui se existir
if (Test-Path $FolderPathToDelete) {
    Write-Host "Excluindo pasta $FolderPathToDelete..."
    Remove-Item -Path $FolderPathToDelete -Recurse
    Write-Host "A pasta $FolderPathToDelete foi removida."
} else {
    Write-Host "A pasta $FolderPathToDelete não existe."
}