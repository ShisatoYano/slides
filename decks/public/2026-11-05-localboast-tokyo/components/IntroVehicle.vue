<!-- 自己紹介で見せる、自動運転の車両の簡単なイラスト(鉱山のダンプトラック / 自律航行する船) -->
<script setup lang="ts">
const { kind } = defineProps<{ kind: 'truck' | 'boat' }>()
</script>

<template>
  <svg class="intro-vehicle" viewBox="0 0 160 100">
    <template v-if="kind === 'truck'">
      <line class="ground" x1="4" y1="92" x2="156" y2="92" />
      <!-- 荷台と積み荷 -->
      <path class="load" d="M16 30 Q 50 6, 88 30 Z" />
      <path class="body" d="M10 30 H 94 L 90 60 H 18 Z" />
      <!-- 運転席(無人なので窓は空) -->
      <path class="body" d="M98 36 H 128 L 140 50 V 64 H 98 Z" />
      <path class="window" d="M104 41 H 125 L 133 50 H 104 Z" />
      <rect class="frame" x="12" y="60" width="132" height="8" rx="2" />
      <!-- 屋根のセンサと、周りを見ている電波 -->
      <rect class="sensor" x="110" y="29" width="10" height="7" rx="2" />
      <path class="signal" d="M124 26 Q 130 32, 124 38" />
      <path class="signal" d="M129 22 Q 138 32, 129 42" />
      <circle class="wheel" cx="36" cy="78" r="14" />
      <circle class="hub" cx="36" cy="78" r="5" />
      <circle class="wheel" cx="122" cy="78" r="14" />
      <circle class="hub" cx="122" cy="78" r="5" />
    </template>

    <template v-else>
      <!-- 船体と操舵室 -->
      <path class="body" d="M12 56 H 150 L 136 76 H 30 Z" />
      <path class="body" d="M58 36 H 108 L 116 56 H 58 Z" />
      <rect class="window" x="64" y="41" width="14" height="9" rx="1" />
      <rect class="window" x="82" y="41" width="14" height="9" rx="1" />
      <!-- マストのGNSSアンテナと、位置を受け取っている電波 -->
      <line class="frame-line" x1="82" y1="36" x2="82" y2="18" />
      <circle class="sensor" cx="82" cy="15" r="5" />
      <path class="signal" d="M74 8 Q 82 2, 90 8" />
      <path class="signal" d="M70 3 Q 82 -5, 94 3" />
      <!-- 波と航跡 -->
      <path class="wave" d="M4 84 Q 14 78, 24 84 T 44 84 T 64 84 T 84 84 T 104 84 T 124 84 T 144 84 T 164 84" />
      <path class="wake" d="M10 68 H -2" />
      <path class="wake" d="M18 74 H 0" />
    </template>
  </svg>
</template>

<style scoped>
.intro-vehicle {
  width: 100%;
  height: auto;
  overflow: visible;
}

.body {
  fill: var(--yano-accent-soft);
  stroke: var(--yano-accent);
  stroke-width: 3;
  stroke-linejoin: round;
}

.load {
  fill: var(--yano-muted);
}

.window {
  fill: white;
  stroke: var(--yano-accent);
  stroke-width: 2;
}

.frame {
  fill: var(--yano-accent);
}

.frame-line {
  stroke: var(--yano-accent);
  stroke-width: 3;
}

.sensor {
  fill: var(--yano-accent);
}

.signal,
.wave,
.wake {
  fill: none;
  stroke: var(--yano-accent);
  stroke-width: 2.5;
  stroke-linecap: round;
}

.signal {
  opacity: 0.7;
}

.wake {
  opacity: 0.5;
}

.ground {
  stroke: var(--yano-muted);
  stroke-width: 2;
  opacity: 0.5;
}

.wheel {
  fill: var(--yano-accent);
}

.hub {
  fill: var(--yano-accent-soft);
}
</style>
