#!/usr/bin/env bash
# capturar.sh — roda cada bloco "Terminal" do curso (kit/blocos/*.sh), um por vez, e grava a saída em kit/saidas/.
# É daqui que saem as abas "Saída capturada" das aulas. Os blocos usam ${TMPDIR:-/tmp}; a captura roda com
# um TMPDIR próprio e troca esse caminho por /tmp na saída, para a aba mostrar o que o aluno vê.
# Uso: bash capturar.sh              # todos, em ordem alfabética (a1a, a1b, a2a…)
#      bash capturar.sh a2a-render   # um bloco
# Teto: cada bloco roda com timeout de 600 s e MemoryMax=8G (systemd-run), um por vez.
set -uo pipefail
K=$(cd "$(dirname "$0")" && pwd)
T=${CAPTURA_TMP:-$(mktemp -d)}
mkdir -p "$K/saidas" "$T"
alvos=("$@"); [ ${#alvos[@]} -eq 0 ] && alvos=($(cd "$K/blocos" && ls *.sh | sed 's/\.sh$//'))
for b in "${alvos[@]}"; do
  ( cd /tmp && TMPDIR="$T" timeout 600 systemd-run --user --scope -q -p MemoryMax=8G bash "$K/blocos/$b.sh" ) 2>&1 \
    | sed "s#$T#/tmp#g; s#$HOME#~#g" > "$K/saidas/$b.txt"
  echo "$b: $(wc -l < "$K/saidas/$b.txt") linhas"
done
