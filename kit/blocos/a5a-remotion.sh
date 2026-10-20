K=~/projetos/formacao-cinema-ia-motion-v72/kit
E=${TMPDIR:-/tmp}/ensaio-motion/a5; rm -rf "$E"; mkdir -p "$E/remotion"
cp -r "$K"/remotion/{package.json,package-lock.json,src} "$E/remotion/"; cd "$E/remotion"
npm ci --no-audit --no-fund > npm.log 2>&1; echo "npm: $?"
npx remotion render src/index.tsx Abertura out/abertura.mp4 --concurrency=2 > render.log 2>&1
echo "render: $?"
python3 "$K/conferir.py" out/abertura.mp4 5 1920x1080; echo "saída: $?"
