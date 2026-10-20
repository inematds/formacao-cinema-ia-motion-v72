# Revisão independente — Motion por código com agente (19/10/2026)

Revisor: subagente sem o contexto do autor, com BRIEF-CURSO.md, CURRICULO.md, AUDITORIA-LOCAL.md e PESQUISA-ESTADO-DA-ARTE.md da formação. Só leitura; conferiu afirmações no `--help` do hyperframes 0.8.176 e rodou `resolver-kit.py --conferir`.

**Nota: 8,5/10**

## Graves (corrigidos)
1. Aula 5: a mudança de licença do Remotion 5.0 aparecia como fato (pesquisa §5 marca [incerto]). → Reescrito como "a página de migração cita…; em 19/10/2026 a 5.0 não tinha saído e a regra não estava confirmada"; explicação do quiz fica só na 4.0.x; PLANO.md corrigido.
2. Aula 1: "mesmos quadros" prometido entre máquinas, provado só na mesma. → Legenda e quiz dizem "no mesmo ambiente"; dica cita `--docker` e `--no-browser-gpu` do 0.8.176 para repetir em outra máquina.

## Menores
- Aula 2 × aula 6 (quem manda na duração): corrigido ("quando a raiz tem data-duration, ela manda"; sem ela, o motor deduz da timeline).
- Aula 2, "seis linhas ◇": corrigido (cinco partes + captura de quadros desligada, `--snapshots` liga).
- Aula 7, `-m small` fora da lista do `--help` e `--engine auto` com Parakeet: aviso acrescentado.
- Aula 8 E3 sem caminho do kit e sem `echo "saída: $?"`: corrigido.
- Aula 3 E3 usa o DESIGN.md antes da aula 4: nota acrescentada.
- Aula 6 `data-no-timeline`: frase sobre o uso documentado acrescentada.
- Abas "Erro comum" só em texto (aulas 1, 2, 6) e tamanhos de download medidos com `du` sem arquivo em kit/saidas: mantidos (não são saídas que o aluno compara); anotado.

## OK (do parecer)
Resolver 29/29 blocos iguais ao kit; as 16 saídas batem com `kit/saidas`; afirmações do CLI conferidas no `--help`; nada desatualizado (Sora, Veo, gpt-*, nome de modelo); [incerto] fora; assuntos com os donos certos (som → curso 2, Three.js → curso 5, sem avatar); todas as práticas com comando → trecho literal; quizzes corretos; aula 8 aponta para o curso 4.
