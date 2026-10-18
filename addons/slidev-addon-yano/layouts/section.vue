<!-- 章扉。標準テーマの section を同名で上書きし、見出しを左寄せ・配色をデッキに揃える -->
<template>
  <div class="slidev-layout section-yano">
    <div class="section-yano-bar" />
    <slot />
  </div>
</template>

<style scoped>
.section-yano {
  display: flex;
  flex-direction: column;
  justify-content: center;
  height: 100%;
  padding-inline: 3.5rem;
}

.section-yano-bar {
  width: 4rem;
  height: 0.375rem;
  margin-bottom: 1.5rem;
  border-radius: 9999px;
  background: var(--yano-accent);
}

.section-yano :deep(h1) {
  font-size: 3rem;
  font-weight: 900;
  line-height: 1.2;
  color: var(--yano-accent);
}

.section-yano :deep(p) {
  margin-top: 1rem;
  font-size: 1.25rem;
  color: var(--yano-muted);
}
</style>
