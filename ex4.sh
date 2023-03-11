#!/bin/bash

# Exemplo usando expansao de parametros
TMPFILE="/tmp/data.txt"
echo ${TMPFILE:="/tmp/file.txt"}
