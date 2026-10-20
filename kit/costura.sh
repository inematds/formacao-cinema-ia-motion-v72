#!/usr/bin/env bash
# costura.sh — o "E" do RISE: confere a pasta de quadros do snapshot.
# Uso: bash costura.sh <pasta-de-quadros>
# Exige 5 quadros (frame-*.png) e compara os pixels do primeiro com os do último.
# Saída: "COSTURA: igual (quadro inicial = quadro final)" (código 0) ou "COSTURA: diferente …" (código 1).
set -uo pipefail
P="${1:?uso: costura.sh <pasta-de-quadros>}"
mapfile -t Q < <(ls "$P"/frame-*.png 2>/dev/null | sort)
echo "${#Q[@]} quadros em $(basename "$P")/"
[ "${#Q[@]}" -eq 5 ] || { echo "FALHA: esperava 5 quadros"; exit 1; }
px() { ffmpeg -v error -i "$1" -f framemd5 - | grep -v '^#' | awk -F, '{print $NF}'; }
if [ "$(px "${Q[0]}")" = "$(px "${Q[4]}")" ]; then
  echo "COSTURA: igual (quadro inicial = quadro final)"; exit 0
fi
echo "COSTURA: diferente — o último quadro não volta ao primeiro"; exit 1
