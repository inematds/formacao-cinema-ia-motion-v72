K=~/projetos/formacao-cinema-ia-motion-v72/kit
export HYPERFRAMES_NO_TELEMETRY=1 NO_COLOR=1
for ex in a1-sorteio a1-semente; do
  cd "$K/exemplos/$ex"
  npx -y hyperframes@0.8.176 lint; echo "saída: $?"
done
