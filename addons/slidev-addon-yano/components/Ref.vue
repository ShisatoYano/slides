<!-- 出典・参考リンク。スライド左下に小さく出す -->
<template>
  <div class="ref">
    <span class="ref-label">出典</span>
    <slot />
  </div>
</template>

<style scoped>
.ref {
  position: absolute;
  left: 3.5rem;
  bottom: 1rem;
  display: flex;
  gap: 0.5rem;
  align-items: baseline;
  font-size: 0.75rem;
  color: var(--yano-muted);
}

.ref-label {
  font-weight: 700;
}

.ref :deep(p) {
  margin: 0;
}

.ref :deep(a) {
  color: inherit;
}
</style>
