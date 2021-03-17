#!/bin/bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Carregando configuracoes do projecto
source "${BASEDIR}/../config/config-prj.sh"

### WebHDFS: manage files in the HDFS over the Internet or HTTP or the Web

# logger_info "Iniciando proceso de transferencia"


# caminho webhdfs
WEBHDFS="webhdfs/v1"

C=0
time for file in "${LOCAL_DIR}"/*
do
    (MOVE_URL=$(curl -s --negotiate -u : -X PUT --write-out '%{redirect_url}' "http://${NAMENODE}/${WEBHDFS}${MOVE_TO}/${file##*/}?op=CREATE&overwrite=true&user.name=${USERNAME}" 2>> ${LOG_MOVES}.${C}); curl -s -X PUT -T ${file} "${MOVE_URL}" 2>> echo "Arquivo ${file##*/} movido com sucesso!" >> ${LOG_MOVES}.${C})
    let C++
done

# logger_info "Transferencia finalizada"

# rc_treatment $?