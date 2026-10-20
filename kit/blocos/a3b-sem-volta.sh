K=~/projetos/formacao-cinema-ia-motion-v72/kit
export HYPERFRAMES_NO_TELEMETRY=1 NO_COLOR=1
unset GEMINI_API_KEY
cd ${TMPDIR:-/tmp}/ensaio-motion/a3/loop
sed -i '/x: 0, duration: 1.2/d' index.html   # tira a volta da cabeça de leitura
npx -y hyperframes@0.8.176 snapshot --at 0,1.5,3,4.5,5.9 --no-end -o quadros > snapshot.log 2>&1
bash "$K/costura.sh" quadros; echo "saída: $?"
