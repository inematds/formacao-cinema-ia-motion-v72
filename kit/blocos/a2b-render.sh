K=~/projetos/formacao-cinema-ia-motion-v72/kit
export HYPERFRAMES_NO_TELEMETRY=1 NO_COLOR=1
cd ${TMPDIR:-/tmp}/ensaio-motion/a2/minha-abertura
cp "$K/exemplos/a2-ola/index.html" index.html
npx -y hyperframes@0.8.176 check 2>&1 | grep -E "◇|✗|⚠"
npx -y hyperframes@0.8.176 render --quality draft --workers 2 --quiet --output renders/abertura.mp4 > render.log 2>&1
echo "render: $?"
python3 "$K/conferir.py" renders/abertura.mp4 5 1920x1080; echo "saída: $?"
