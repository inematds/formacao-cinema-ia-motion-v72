#!/usr/bin/env python3
"""karaoke.py — transforma o transcript.json (palavra + tempo) em legendas.js para a composição.

Uso:  python3 karaoke.py transcript.json --inicio 0.5 --por-linha 3 > legendas.js

--inicio     segundos em que a narração começa no vídeo (o data-start do <audio>)
--por-linha  palavras por legenda (padrão 3)
Imprime na saída de erro: "palavras: N · legendas: M".
"""
import argparse
import json
import sys


def main():
    a = argparse.ArgumentParser()
    a.add_argument("transcript")
    a.add_argument("--inicio", type=float, default=0.0)
    a.add_argument("--por-linha", type=int, default=3)
    o = a.parse_args()
    palavras = json.load(open(o.transcript, encoding="utf-8"))
    linhas = []
    for i in range(0, len(palavras), o.por_linha):
        grupo = palavras[i:i + o.por_linha]
        linhas.append({
            "inicio": round(grupo[0]["start"] + o.inicio, 3),
            "fim": round(grupo[-1]["end"] + o.inicio, 3),
            "palavras": [{"t": p["text"], "inicio": round(p["start"] + o.inicio, 3)} for p in grupo],
        })
    # cada legenda sai 0,15 s depois da última palavra, mas nunca depois que a próxima entra
    for atual, prox in zip(linhas, linhas[1:] + [None]):
        atual["fim"] = round(min(atual["fim"] + 0.15, prox["inicio"]) if prox else atual["fim"] + 0.15, 3)
    print("window.LEGENDAS = " + json.dumps(linhas, ensure_ascii=False) + ";")
    print(f"palavras: {len(palavras)} · legendas: {len(linhas)}", file=sys.stderr)


if __name__ == "__main__":
    main()
