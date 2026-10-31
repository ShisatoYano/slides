<!-- 自動運転の一連の動作(見る → 位置を知る → 見分ける → 道を決める → 道に沿ってハンドルを切る)を上から見た道路で再生する。play が true になった時点から1回だけ流れる -->
<script setup lang="ts">
const { play = false } = defineProps<{ play?: boolean }>()
</script>

<template>
  <!-- 段階の開始時刻は親が --scene-start / --scene-step で決め、スライド側の箱の点灯と揃える -->
  <svg class="scene" :class="{ playing: play }" viewBox="0 -8 960 190">
    <rect class="road" x="0" y="26" width="960" height="128" rx="8" />
    <line class="lane" x1="0" y1="90" x2="960" y2="90" />

    <g class="obstacle">
      <rect x="520" y="84" width="56" height="36" rx="6" />
    </g>

    <!-- 0: センシング -->
    <g class="step" style="--s: 0">
      <g class="follow">
        <line class="ray" x1="132" y1="90" x2="520" y2="86" />
        <line class="ray" x1="132" y1="90" x2="520" y2="102" />
        <line class="ray" x1="132" y1="90" x2="520" y2="118" />
        <line class="ray" x1="132" y1="90" x2="330" y2="44" />
        <line class="ray" x1="132" y1="90" x2="330" y2="136" />
        <text class="tag" x="160" y="18">センシング</text>
      </g>
    </g>

    <!-- 1: 自己位置推定 -->
    <g class="step" style="--s: 1">
      <g class="follow">
        <ellipse class="estimate" cx="96" cy="90" rx="58" ry="34" />
        <text class="tag" x="20" y="174">自己位置推定</text>
      </g>
    </g>

    <!-- 2: 認識 -->
    <g class="step" style="--s: 2">
      <rect class="bbox" x="512" y="76" width="72" height="52" rx="4" />
      <text class="tag warn" x="500" y="148">認識: 障害物</text>
    </g>

    <!-- 3: 経路計画 -->
    <g class="step" style="--s: 3">
      <path class="route" d="M132 90 C 300 90, 360 46, 470 46 L 630 46 C 720 46, 770 90, 920 90" pathLength="1" />
      <text class="tag" x="760" y="174">経路計画</text>
    </g>

    <!-- 4: 制御。ハンドルを切りながら経路に沿って走る。車は通過点を keyframes で近似して経路の線に乗せる -->
    <g class="car">
      <rect x="60" y="72" width="72" height="36" rx="8" />
      <g class="step" style="--s: 4">
        <g class="wheel">
          <circle cx="96" cy="90" r="11" />
          <line x1="85" y1="90" x2="107" y2="90" />
          <line x1="96" y1="90" x2="96" y2="101" />
        </g>
        <text class="tag" x="74" y="64">制御</text>
      </g>
    </g>
  </svg>
</template>

<style scoped>
.scene {
  width: 100%;
  height: auto;
  overflow: visible;
}

.road {
  fill: color-mix(in srgb, var(--yano-muted) 15%, transparent);
}

.lane {
  stroke: var(--yano-muted);
  stroke-width: 2;
  stroke-dasharray: 16 14;
  opacity: 0.5;
}

.obstacle rect {
  fill: var(--yano-muted);
}

.car rect {
  fill: var(--yano-accent);
}

.wheel {
  fill: none;
  stroke: white;
  stroke-width: 3;
  transform-box: fill-box;
  transform-origin: center;
}

.ray {
  stroke: var(--yano-accent);
  stroke-width: 2;
  stroke-dasharray: 4 4;
}

.estimate {
  fill: color-mix(in srgb, var(--yano-accent) 15%, transparent);
  stroke: var(--yano-accent);
  stroke-width: 2;
  stroke-dasharray: 6 4;
}

.bbox {
  fill: none;
  stroke: var(--yano-emphasis);
  stroke-width: 3;
}

.route {
  fill: none;
  stroke: var(--yano-accent);
  stroke-width: 4;
  stroke-linecap: round;
  stroke-dasharray: 1;
  stroke-dashoffset: 1;
}

.tag {
  font-size: 18px;
  font-weight: 900;
  fill: var(--yano-accent);
}

.tag.warn {
  fill: var(--yano-emphasis);
}

.step {
  opacity: 0;
}

/* 各段階は自分の番に現れ、以降は残る */
.playing .step {
  animation: appear 0.4s both;
  animation-delay: calc(var(--scene-start) + var(--s) * var(--scene-step));
}

.playing .route {
  animation: draw var(--scene-step) both;
  animation-delay: calc(var(--scene-start) + 3 * var(--scene-step));
}

/* 走行と同じ時間で、経路の曲がりに合わせて左 → 戻す → 右 → 戻す と切る */
.playing .wheel {
  animation: steer calc(var(--scene-step) * 2) ease-in-out both;
  animation-delay: calc(var(--scene-start) + 4 * var(--scene-step));
}

/* 出発点に置いた表示(光線・推定範囲)は、車が走り出したら消す */
.playing .follow {
  animation: vanish 0.3s both;
  animation-delay: calc(var(--scene-start) + 4 * var(--scene-step));
}

.playing .car {
  animation: drive calc(var(--scene-step) * 2) ease-in-out both;
  animation-delay: calc(var(--scene-start) + 4 * var(--scene-step));
}

@keyframes appear {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes vanish {
  from { opacity: 1; }
  to { opacity: 0; }
}

@keyframes draw {
  to { stroke-dashoffset: 0; }
}

@keyframes steer {
  0%, 45%, 100% { transform: rotate(0deg); }
  20% { transform: rotate(-35deg); }
  75% { transform: rotate(35deg); }
}

@keyframes drive {
  0% { transform: translate(0, 0); }
  30% { transform: translate(300px, -42px); }
  60% { transform: translate(500px, -44px); }
  100% { transform: translate(760px, 0); }
}
</style>
