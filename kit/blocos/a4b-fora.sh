K=~/projetos/formacao-cinema-ia-motion-v72/kit
cd ${TMPDIR:-/tmp}/ensaio-motion/a4/marca
sed -i 's/--destaque: #e9b949/--destaque: #ff3366/' index.html   # o agente "melhorou" o destaque
python3 "$K/conferir-design.py" DESIGN.md index.html; echo "saída: $?"
