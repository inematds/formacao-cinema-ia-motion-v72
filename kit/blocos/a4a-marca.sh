K=~/projetos/formacao-cinema-ia-motion-v72/kit
export HYPERFRAMES_NO_TELEMETRY=1 NO_COLOR=1
E=${TMPDIR:-/tmp}/ensaio-motion/a4; rm -rf "$E"; mkdir -p "$E"
cp -r "$K/exemplos/a4-marca" "$E/marca"; cd "$E/marca"
python3 "$K/conferir-design.py" DESIGN.md index.html; echo "saída: $?"
npx -y hyperframes@0.8.176 check 2>&1 | grep -E "Check passed|✗|WCAG"
