#!/bin/env bash
#BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Carregando configuracoes do projecto
# source "${BASEDIR}/../config/config-prj.sh"

# variaveis
USERNAME=${1}
HDFS_PORT=${2}

# caminho local
LOCAL_DIR=${3}

# hdfs getconf -namenodes
NAMENODE="hdp-vm:50070"
MOVE_TO=${4-"/tmp"}
PARALLEL=150
LOG_MOVES="/home/hdp/Documents/var/log//move_webhdfs_$(date +'%Y%m%d').log"


