<!-- ラベル付きの囲み枠。自己紹介スライドに「今日のゴール」を置く用途を想定 -->
<script setup lang="ts">
const { label } = defineProps<{ label: string }>()
</script>

<template>
  <div class="callout">
    <div class="callout-label">{{ label }}</div>
    <div class="callout-body">
      <slot />
    </div>
  </div>
</template>

<style scoped>
.callout {
  border-left: 4px solid #0369a1;
  border-radius: 0.25rem;
  background: #f0f9ff;
  padding: 0.75rem 1.25rem;
}

.callout-label {
  font-size: 0.875rem;
  font-weight: 700;
  color: #0369a1;
}

.callout-body {
  margin-top: 0.25rem;
  font-size: 1.125rem;
  font-weight: 700;
}

/* slotの中身がMarkdownの段落になると上下に余白が付くので打ち消す */
.callout-body :deep(p) {
  margin: 0;
}
</style>
