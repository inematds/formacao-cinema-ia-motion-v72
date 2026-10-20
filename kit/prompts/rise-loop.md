R — REFERÊNCIAS
Leia o DESIGN.md desta pasta antes de tudo: cores, fontes e regras de movimento saem dele. Não invente logotipo, cor nem fonte.
Projeto HyperFrames 0.8.176 nesta pasta (index.html já criado pelo init).

I — IDEIA
Um loop de 6 segundos, 1920x1080, sobre uma linha do tempo de edição.
- Início (0–0,6 s): o trilho da linha do tempo e a cabeça de leitura parados à esquerda.
- Meio (0,6–4,2 s): a cabeça de leitura corre até a direita; o título "Cena 1" entra e sai.
- Fim (4,2–6 s): a cabeça volta à esquerda e para. O último quadro é igual ao primeiro.

S — ESTILO
Visual: fundo #0c0c10 com luz suave no centro, trilho #3f3f47, cabeça de leitura #e9b949 (a única cor de destaque), título branco #f4f4f5 em sem serifa do sistema, peso 700.
Movimento: nada em velocidade constante (power1 a power3, entrada e saída suaves); o título fica pelo menos 1,2 s legível; uma coisa se move por vez.

E — EXAMINAR
Escreva tudo numa única timeline GSAP pausada registrada em window.__timelines["main"], sem Math.random e sem Date.now.
Rode `npx hyperframes@0.8.176 check` e corrija até aparecer "Check passed".
Tire 5 quadros com `npx hyperframes@0.8.176 snapshot --at 0,1.5,3,4.5,5.9 --no-end -o quadros`, olhe o contact-sheet.jpg e confira:
o quadro de 0 s é igual ao de 5,9 s; nenhuma letra cortada; nenhuma palavra sozinha na linha; o título aparece inteiro no quadro de 3 s.
Corrija o que falhar e repita até tudo passar. Não renderize o MP4: eu renderizo depois de ver os quadros.
