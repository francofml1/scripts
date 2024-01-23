#!/bin/bash

# Verificar se um diretório foi fornecido como argumento
if [ "$#" -eq 0 ]; then
    diretorio=$(pwd)  # Diretório atual se nenhum argumento for passado
else
    diretorio="$1"
fi

# Verificar se o diretório existe
if [ ! -d "$diretorio" ]; then
    echo "Diretório não encontrado: $diretorio"
    exit 1
fi

# Percorrer os arquivos .img no diretório
for arquivo in "$diretorio"/*.img; do
    if [ -f "$arquivo" ]; then
        # Nome do arquivo sem extensão
        nome_sem_extensao=$(basename -- "$arquivo" .img)

        # Compactar o arquivo usando tar
        echo "Compactando $arquivo..."
        tar -czf "$diretorio/$nome_sem_extensao.tar.gz" -C "$diretorio" "$nome_sem_extensao.img"
        echo "Compactação concluída."
    fi
done

echo "Compactação de todos os arquivos .img em $diretorio concluída."
