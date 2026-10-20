K=~/projetos/formacao-cinema-ia-motion-v72/kit
export HYPERFRAMES_NO_TELEMETRY=1 NO_COLOR=1
E=${TMPDIR:-/tmp}/ensaio-motion/a6; rm -rf "$E"; mkdir -p "$E"
cp -r "$K/exemplos/a6-dados" "$E/dados"; cd "$E/dados"
npx -y hyperframes@0.8.176 check 2>&1 | grep -E "Check passed|✗"
npx -y hyperframes@0.8.176 render --quality draft --workers 2 --quiet --output dados.mp4 > render.log 2>&1
echo "render: $?"
python3 "$K/conferir.py" dados.mp4 6 1920x1080; echo "saída: $?"
