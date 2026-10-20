#!/usr/bin/env bash
# comparar-quadros.sh — compara dois vídeos quadro a quadro (hash de cada quadro decodificado).
# Uso: bash comparar-quadros.sh a.mp4 b.mp4
# Saída: "IGUAIS: N/N quadros" (código 0) ou "DIFEREM: X de N quadros" (código 1).
set -uo pipefail
[ $# -eq 2 ] || { echo "uso: comparar-quadros.sh a.mp4 b.mp4"; exit 2; }
for f in "$1" "$2"; do [ -s "$f" ] || { echo "FALHA: não achei $f"; exit 2; }; done
ha=$(mktemp); hb=$(mktemp)
ffmpeg -v error -i "$1" -map 0:v:0 -f framemd5 - | grep -v '^#' | awk -F, '{print $NF}' > "$ha"
ffmpeg -v error -i "$2" -map 0:v:0 -f framemd5 - | grep -v '^#' | awk -F, '{print $NF}' > "$hb"
na=$(wc -l < "$ha"); nb=$(wc -l < "$hb")
if [ "$na" -ne "$nb" ]; then echo "DIFEREM: $na quadros × $nb quadros"; rm -f "$ha" "$hb"; exit 1; fi
dif=$(paste "$ha" "$hb" | awk '$1!=$2' | wc -l)
rm -f "$ha" "$hb"
if [ "$dif" -eq 0 ]; then echo "IGUAIS: $na/$na quadros"; exit 0; fi
echo "DIFEREM: $dif de $na quadros"; exit 1
