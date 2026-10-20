export HYPERFRAMES_NO_TELEMETRY=1 NO_COLOR=1
cd ${TMPDIR:-/tmp}/ensaio-motion/a8/abertura
npx -y hyperframes@0.8.176 render --resolution portrait --quality draft --output renders/torto.mp4 2>&1 | grep -A2 "incompatible"
