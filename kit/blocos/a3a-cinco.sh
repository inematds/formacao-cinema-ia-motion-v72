K=~/projetos/formacao-cinema-ia-motion-v72/kit
export HYPERFRAMES_NO_TELEMETRY=1 NO_COLOR=1
unset GEMINI_API_KEY   # sem isso, o snapshot manda os quadros ao Gemini sozinho
E=${TMPDIR:-/tmp}/ensaio-motion/a3; rm -rf "$E"; mkdir -p "$E"
cp -r "$K/exemplos/a3-loop" "$E/loop"; cd "$E/loop"
npx -y hyperframes@0.8.176 check 2>&1 | grep -E "Check passed|✗"
npx -y hyperframes@0.8.176 snapshot --at 0,1.5,3,4.5,5.9 --no-end -o quadros > snapshot.log 2>&1
bash "$K/costura.sh" quadros; echo "saída: $?"
