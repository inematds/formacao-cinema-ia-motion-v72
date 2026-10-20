K=~/projetos/formacao-cinema-ia-motion-v72/kit
export HYPERFRAMES_NO_TELEMETRY=1 NO_COLOR=1
E=${TMPDIR:-/tmp}/ensaio-motion/a8; rm -rf "$E"; mkdir -p "$E"
cp -r "$K/exemplos/a8-abertura" "$E/abertura"; cd "$E/abertura"
python3 "$K/conferir-design.py" DESIGN.md abertura.css; echo "saída: $?"
npx -y hyperframes@0.8.176 check 2>&1 | grep -E "Check passed|✗"
npx -y hyperframes@0.8.176 render --quality draft --workers 2 --quiet --output renders/abertura-16x9.mp4 > render-16x9.log 2>&1
npx -y hyperframes@0.8.176 render -c formatos/vertical.html --quality draft --workers 2 --quiet --output renders/abertura-9x16.mp4 > render-9x16.log 2>&1
python3 "$K/conferir.py" renders/abertura-16x9.mp4 15 1920x1080; echo "saída: $?"
python3 "$K/conferir.py" renders/abertura-9x16.mp4 15 1080x1920; echo "saída: $?"
