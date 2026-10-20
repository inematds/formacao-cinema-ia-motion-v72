K=~/projetos/formacao-cinema-ia-motion-v72/kit
export HYPERFRAMES_NO_TELEMETRY=1 NO_COLOR=1
cd ${TMPDIR:-/tmp}/ensaio-motion/a7/karaoke
# trilha de ensaio: um acorde suave de 8 s gerado no ffmpeg (a sua trilha de verdade entra no lugar)
ffmpeg -v error -y -f lavfi -i "aevalsrc=0.10*sin(2*PI*220*t)+0.07*sin(2*PI*277.18*t)+0.06*sin(2*PI*329.63*t):s=48000:d=8" \
  -af "afade=t=in:d=1,afade=t=out:st=6.5:d=1.5" trilha.wav
python3 "$K/karaoke.py" transcript.json --inicio 0.5 --por-linha 3 > legendas.js
npx -y hyperframes@0.8.176 check 2>&1 | grep -E "Check passed|✗"
npx -y hyperframes@0.8.176 render --quality draft --workers 2 --quiet --output karaoke.mp4 > render.log 2>&1
echo "render: $?"
python3 "$K/conferir.py" karaoke.mp4 8 1920x1080 --audio; echo "saída: $?"
