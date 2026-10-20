K=~/projetos/formacao-cinema-ia-motion-v72/kit
export HYPERFRAMES_NO_TELEMETRY=1
E=${TMPDIR:-/tmp}/ensaio-motion/a1; rm -rf "$E"; mkdir -p "$E"
for ex in a1-sorteio a1-semente; do
  cp -r "$K/exemplos/$ex" "$E/$ex"; cd "$E/$ex"
  for n in 1 2; do
    npx -y hyperframes@0.8.176 render --quality draft --workers 1 --quiet --output "render-$n.mp4" > /dev/null 2>&1
  done
  echo "## $ex"; bash "$K/comparar-quadros.sh" render-1.mp4 render-2.mp4; echo "saída: $?"
done
