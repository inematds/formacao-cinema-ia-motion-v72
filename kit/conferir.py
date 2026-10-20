#!/usr/bin/env python3
"""conferir.py — confere um vídeo renderizado contra o que você pediu (usa ffprobe).

Uso:  python3 conferir.py <video.mp4> <segundos> <LARGURAxALTURA> [--audio]
Ex.:  python3 conferir.py renders/abertura.mp4 15 1920x1080 --audio

Saída: "OK: 15,0 s · 1920×1080 · 30 fps · com áudio" (código 0)
       ou "FALHA: ..." com o que não bateu (código 1).
Tolerância de duração: 0,1 s (um quadro a 10 fps).
"""
import json
import subprocess
import sys


def sonda(caminho):
    r = subprocess.run(
        ["ffprobe", "-v", "error", "-show_format", "-show_streams", "-of", "json", caminho],
        capture_output=True, text=True,
    )
    if r.returncode != 0:
        print(f"FALHA: ffprobe não abriu {caminho}")
        sys.exit(1)
    return json.loads(r.stdout)


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    if len(args) != 3:
        print(__doc__.strip())
        return 2
    caminho, seg, tam = args[0], float(args[1].replace(",", ".")), args[2].lower()
    quer_audio = "--audio" in sys.argv
    larg, alt = (int(x) for x in tam.split("x"))
    d = sonda(caminho)
    video = [s for s in d["streams"] if s.get("codec_type") == "video"]
    audio = [s for s in d["streams"] if s.get("codec_type") == "audio"]
    if not video:
        print("FALHA: o arquivo não tem faixa de vídeo")
        return 1
    v = video[0]
    dur = float(d["format"].get("duration", 0))
    num, den = (int(x) for x in v.get("r_frame_rate", "0/1").split("/"))
    fps = round(num / den) if den else 0
    falhas = []
    if abs(dur - seg) > 0.1:
        falhas.append(f"duração {dur:.1f} s (pedido {seg:.1f} s)".replace(".", ","))
    if (v["width"], v["height"]) != (larg, alt):
        falhas.append(f"tamanho {v['width']}×{v['height']} (pedido {larg}×{alt})")
    if quer_audio and not audio:
        falhas.append("sem faixa de áudio (pedido com áudio)")
    if falhas:
        print("FALHA: " + "; ".join(falhas))
        return 1
    som = " · com áudio" if audio else " · sem áudio"
    print(f"OK: {dur:.1f} s · {v['width']}×{v['height']} · {fps} fps{som}".replace(".", ",", 1))
    return 0


if __name__ == "__main__":
    sys.exit(main())
