import {AbsoluteFill, Composition, Easing, interpolate, registerRoot, spring, useCurrentFrame, useVideoConfig} from 'remotion';

// Tudo é função do quadro atual: o mesmo quadro desenha sempre a mesma imagem.
const Abertura: React.FC = () => {
  const frame = useCurrentFrame();
  const {fps} = useVideoConfig();
  // spring: entra com física (0 → 1), começando no quadro 10
  const entra = spring({frame: frame - 10, fps, config: {damping: 200}});
  // interpolate: mapeia quadros para valores; clamp segura o valor nas pontas
  const apoio = interpolate(frame, [30, 50], [0, 1], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'});
  const barra = interpolate(frame, [20, 60], [0, 640], {
    extrapolateLeft: 'clamp',
    extrapolateRight: 'clamp',
    easing: Easing.inOut(Easing.cubic),
  });
  return (
    <AbsoluteFill style={{background: '#0c0c10', justifyContent: 'center', paddingLeft: 200, fontFamily: 'system-ui, sans-serif'}}>
      <h1 style={{color: '#f4f4f5', fontSize: 120, lineHeight: 1.1, margin: 0, opacity: entra, transform: `translateY(${(1 - entra) * 60}px)`}}>
        Vídeo é React
      </h1>
      <div style={{width: barra, height: 6, background: '#e9b949', margin: '36px 0'}} />
      <p style={{color: '#a1a1aa', fontSize: 48, margin: 0, opacity: apoio}}>Um componente, um quadro, um MP4.</p>
    </AbsoluteFill>
  );
};

const Raiz: React.FC = () => (
  <Composition id="Abertura" component={Abertura} durationInFrames={150} fps={30} width={1920} height={1080} />
);

registerRoot(Raiz);
