# DESIGN.md — vídeo de exemplo (curso Motion por código, INEMA.CLUB)

Uma frase: fundo escuro e calmo, uma ideia por vez, luz em vez de cor; o amarelo só aparece em detalhe.

## Cores
- fundo: #0c0c10
- superfície: #1c1c22
- linha: #3f3f47
- texto: #f4f4f5
- texto secundário: #a1a1aa
- destaque (só detalhe: um filete, um ponto, a cabeça de leitura): #e9b949

## Tipografia
- Títulos: sem serifa do sistema, peso 700, altura de linha 1,1, no máximo 6 palavras.
- Apoio: sem serifa do sistema, peso 400, 48 px em 1920x1080.
- Nenhuma palavra sozinha na última linha.

## Movimento
- Entrada de 0,5 a 0,8 s com power2.out ou power3.out; saída mais curta que a entrada, com power2.in.
- Uma coisa se move por vez; a próxima começa quando a anterior já assentou.
- Todo texto fica pelo menos 1,2 s parado e legível.
- Nada em velocidade constante (ease "none" só em barra de progresso).
- O quadro principal (título ou marca) segura pelo menos 1,5 s no fim.

## Proibido
- Cor que não está em "Cores", neon, brilho forte, gradiente colorido.
- Logo desenhado de memória: logo só do arquivo da marca.
- Math.random e Date.now na composição.
