#!/bin/sh

echo "Iniciando o container"

for i in 1 2 3 4 5 6; do
  echo "Contador: $i"
done

echo "Processos realizados, servidor em execução"

echo "Iniciando o processo de 5 segundos"

sleep 5s

echo "5 segundos depois"

# Continua a execução dos comandos CMD definidos no Dockerfile
exec "$@"