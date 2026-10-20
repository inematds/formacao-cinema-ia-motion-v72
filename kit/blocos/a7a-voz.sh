K=~/projetos/formacao-cinema-ia-motion-v72/kit
export HYPERFRAMES_NO_TELEMETRY=1 NO_COLOR=1
E=${TMPDIR:-/tmp}/ensaio-motion/a7; rm -rf "$E"; mkdir -p "$E"
cp -r "$K/exemplos/a7-karaoke" "$E/karaoke"; cd "$E/karaoke"
TEXTO="A voz sai do seu computador, e cada palavra sabe a hora de aparecer."
npx -y hyperframes@0.8.176 tts "$TEXTO" --voice pf_dora --lang pt-br -o narracao.wav > tts.log 2>&1; echo "tts: $?"
ffprobe -v error -show_entries format=duration -of csv=p=0 narracao.wav
npx -y hyperframes@0.8.176 transcribe narracao.wav -m small -l pt --json > transcricao.log 2>/dev/null; echo "transcribe: $?"
python3 -c "import json; print('palavras:', len(json.load(open('transcript.json'))))"
