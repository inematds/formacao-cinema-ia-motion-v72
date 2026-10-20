cd ${TMPDIR:-/tmp}/ensaio-motion/a5/remotion
npx remotion render src/index.tsx abertura out/errado.mp4 2>&1 | grep -m1 -o "Could not find composition.*"
echo "render: ${PIPESTATUS[0]}"
