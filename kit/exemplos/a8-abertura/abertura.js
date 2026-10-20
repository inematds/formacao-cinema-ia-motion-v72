// A mesma coreografia nos dois formatos: só a distância da cabeça de leitura depende da largura.
window.criaAbertura = function () {
  const root = document.getElementById("root");
  const largura = Number(root.dataset.width);
  const corrida = largura * 0.8 - 18; // do começo ao fim do trilho (80% da largura)
  const tl = gsap.timeline({ paused: true });
  tl.fromTo("#trilho", { scaleX: 0 }, { scaleX: 1, duration: 1.2, ease: "power2.inOut" }, 0.4);
  tl.fromTo("#cabeca", { opacity: 0 }, { opacity: 1, duration: 0.3 }, 1.4);
  tl.fromTo("#rotulo", { y: 24, opacity: 0 }, { y: 0, opacity: 1, duration: 0.6, ease: "power2.out" }, 2.0);
  tl.fromTo("#cabeca", { x: 0 }, { x: corrida, duration: 9, ease: "power1.inOut" }, 2.0);
  tl.fromTo("#titulo", { y: 50, opacity: 0 }, { y: 0, opacity: 1, duration: 0.8, ease: "power3.out" }, 4.0);
  tl.fromTo("#apoio", { y: 30, opacity: 0 }, { y: 0, opacity: 1, duration: 0.7, ease: "power2.out" }, 7.5);
  // de 11 s a 15 s o quadro principal segura (regra do DESIGN.md: o fim segura pelo menos 1,5 s)
  return tl;
};
