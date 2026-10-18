<!-- ターミナル画面の枠(Ubuntu の Yaru テーマ風)。中身はスライドごとの部品がスロットに描く -->
<script setup lang="ts">
const { title = 'zsh' } = defineProps<{ title?: string }>()
</script>

<template>
  <div class="terminal-window">
    <div class="terminal-window-bar">
      <span class="terminal-window-title">{{ title }}</span>
      <div class="terminal-window-buttons">
        <span class="button">
          <svg viewBox="0 0 16 16"><path d="M4 8h8" /></svg>
        </span>
        <span class="button">
          <svg viewBox="0 0 16 16"><rect x="4.5" y="4.5" width="7" height="7" /></svg>
        </span>
        <span class="button is-close">
          <svg viewBox="0 0 16 16"><path d="M5 5l6 6M11 5l-6 6" /></svg>
        </span>
      </div>
    </div>
    <div class="terminal-window-body">
      <slot />
    </div>
  </div>
</template>

<style scoped>
.terminal-window {
  overflow: hidden;
  border-radius: 0.6rem;
  background: var(--yano-term-bg);
  box-shadow: 0 8px 24px rgb(0 0 0 / 0.2);
}

/* タイトルはバー全体の中央に置き、ボタンだけ右端に寄せる(GNOME のヘッダーバーと同じ配置) */
.terminal-window-bar {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 2rem;
  background: var(--yano-term-bar);
}

.terminal-window-title {
  font-size: 0.75rem;
  font-weight: 700;
  color: rgb(255 255 255 / 0.85);
}

.terminal-window-buttons {
  position: absolute;
  right: 0.6rem;
  display: flex;
  gap: 0.5rem;
}

/* ウィンドウのボタンはOSの見た目を真似たもので、デッキの配色と関係なく変えないため色を直接書いている */
.button {
  display: grid;
  place-items: center;
  width: 1.1rem;
  height: 1.1rem;
  border-radius: 9999px;
  background: rgb(255 255 255 / 0.1);
}

.button.is-close {
  background: #e95420;
}

.button svg {
  width: 0.7rem;
  height: 0.7rem;
  fill: none;
  stroke: rgb(255 255 255 / 0.9);
  stroke-width: 1.5;
  stroke-linecap: round;
}

.terminal-window-body {
  padding: 0.75rem 1rem;
  font-family: var(--slidev-code-font-family, 'JetBrains Mono', monospace);
  font-size: 0.8rem;
  line-height: 1.6;
  color: var(--yano-term-fg);
}
</style>
