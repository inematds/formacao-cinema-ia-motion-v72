#!/usr/bin/env python3
"""conferir-design.py — confere o DESIGN.md do vídeo e se a composição respeita as cores dele.

Uso:  python3 conferir-design.py DESIGN.md index.html

Regras: o DESIGN.md tem as seções "## Cores", "## Tipografia", "## Movimento" e "## Proibido";
"Cores" tem pelo menos 2 cores em hex; "Movimento" tem pelo menos 3 regras (linhas com "- ");
toda cor em hex do index.html está em "Cores".
Saída: "OK: …" (código 0) ou "FALTA: …" / "FORA DA MARCA: …" (código 1).
"""
import re
import sys

HEX = re.compile(r"#(?:[0-9a-fA-F]{6}|[0-9a-fA-F]{3})\b")
SECOES = ["Cores", "Tipografia", "Movimento", "Proibido"]


def eh_cor(linha, m):
    """Cor = valor de propriedade ou atributo: vem depois de : , ( = ou aspas e não abre um bloco {."""
    antes = linha[:m.start()].rstrip()
    depois = linha[m.end():].lstrip()
    return bool(antes) and antes[-1] in ":,(=\"'" and not depois.startswith("{")


def secoes(md):
    partes, atual = {}, None
    for linha in md.splitlines():
        m = re.match(r"^##\s+(.+?)\s*$", linha)
        if m:
            atual = m.group(1).strip()
            partes[atual] = []
        elif atual:
            partes[atual].append(linha)
    return partes


def main():
    if len(sys.argv) != 3:
        print(__doc__.strip())
        return 2
    md = open(sys.argv[1], encoding="utf-8").read()
    comp = open(sys.argv[2], encoding="utf-8").read().splitlines()
    s = secoes(md)
    faltam = [n for n in SECOES if n not in s]
    if faltam:
        print("FALTA: seção " + ", ".join(f"## {n}" for n in faltam))
        return 1
    cores = {c.lower() for c in HEX.findall("\n".join(s["Cores"]))}
    regras = [l for l in s["Movimento"] if l.strip().startswith("- ")]
    if len(cores) < 2:
        print("FALTA: pelo menos 2 cores em hex na seção ## Cores")
        return 1
    if len(regras) < 3:
        print("FALTA: pelo menos 3 regras (linhas com '- ') na seção ## Movimento")
        return 1
    fora = []
    for n, linha in enumerate(comp, 1):
        for m in HEX.finditer(linha):
            if not eh_cor(linha, m):
                continue  # é seletor CSS (#cabeca {), não cor
            if m.group(0).lower() not in cores:
                fora.append(f"{m.group(0)} (linha {n})")
    if fora:
        print("FORA DA MARCA: " + ", ".join(fora))
        return 1
    print(f"OK: 4 seções · {len(cores)} cores · {len(regras)} regras de movimento · a composição usa só cores do DESIGN.md")
    return 0


if __name__ == "__main__":
    sys.exit(main())
