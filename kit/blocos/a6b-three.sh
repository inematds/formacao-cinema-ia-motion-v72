K=~/projetos/formacao-cinema-ia-motion-v72/kit
export HYPERFRAMES_NO_TELEMETRY=1 NO_COLOR=1
E=${TMPDIR:-/tmp}/ensaio-motion/a6; mkdir -p "$E"
rm -rf "$E/three"; cp -r "$K/exemplos/a6-three" "$E/three"; cd "$E/three"
sed -i 's/ data-duration="4"//' index.html   # o erro comum: raiz sem duração
echo "## sem data-duration"; npx -y hyperframes@0.8.176 lint 2>&1 | grep -oE "root_composition_missing_duration_source|[0-9]+ errors?.*"
cp "$K/exemplos/a6-three/index.html" index.html
echo "## com data-duration"; npx -y hyperframes@0.8.176 lint 2>&1 | grep -oE "root_composition_missing_duration_source|[0-9]+ errors?.*"
npx -y hyperframes@0.8.176 render --quality draft --workers 1 --quiet --output three.mp4 > render.log 2>&1
python3 "$K/conferir.py" three.mp4 4 1920x1080; echo "saída: $?"
