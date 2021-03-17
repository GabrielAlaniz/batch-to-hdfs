#!/bin/bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Carregando configuracoes do projecto
source "${BASEDIR}/../config/config-prj.sh"

### HDFS native protocol: access data from inside a cluster or another machine on the network

# logger_info "Iniciando proceso de transferencia"

time hdfs dfs -copyFromLocal ${LOCAL_DIR} ${MOVE_TO}
echo "[$(date +'%d/%m/%Y %H:%M:%S')] Iniciando processo de move para arquivos." | tee -a ${LOG_MOVES}

# logger_info "Transferencia finalizada"

# rc_treatment $?