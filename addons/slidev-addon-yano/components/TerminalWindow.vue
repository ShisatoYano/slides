<!-- ターミナル画面の枠。中身はスライドごとの部品がスロットに描く -->
<script setup lang="ts">
const { title = 'zsh' } = defineProps<{ title?: string }>()
</script>

<template>
  <div class="terminal-window">
    <div class="terminal-window-bar">
      <span class="dot" style="background: #ff5f57" />
      <span class="dot" style="background: #febc2e" />
      <span class="dot" style="background: #28c840" />
      <span class="terminal-window-title">{{ title }}</span>
    </div>
    <div class="terminal-window-body">
      <slot />
    </div>
  </div>
</template>

<style scoped>
.terminal-window {
  overflow: hidden;
  border-radius: 0.5rem;
  background: #1e1e2e;
  box-shadow: 0 8px 24px rgb(0 0 0 / 0.2);
}

.terminal-window-bar {
  display: flex;
  gap: 0.4rem;
  align-items: center;
  padding: 0.4rem 0.75rem;
  background: #2a2a3c;
}

.dot {
  width: 0.65rem;
  height: 0.65rem;
  border-radius: 9999px;
}

.terminal-window-title {
  margin-left: 0.5rem;
  font-size: 0.7rem;
  color: #9ca3af;
}

.terminal-window-body {
  padding: 0.75rem 1rem;
  font-family: var(--slidev-code-font-family, 'JetBrains Mono', monospace);
  font-size: 0.8rem;
  line-height: 1.6;
  color: #e5e7eb;
}
</style>
