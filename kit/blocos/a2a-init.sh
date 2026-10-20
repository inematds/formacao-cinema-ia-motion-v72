export HYPERFRAMES_NO_TELEMETRY=1 NO_COLOR=1
E=${TMPDIR:-/tmp}/ensaio-motion/a2; rm -rf "$E"; mkdir -p "$E"; cd "$E"
npx -y hyperframes@0.8.176 init minha-abertura --non-interactive > init.log 2>&1; echo "saída: $?"
ls minha-abertura
grep '"render"' minha-abertura/package.json
npx -y hyperframes@0.8.176 telemetry status | head -2
