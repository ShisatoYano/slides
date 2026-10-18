<!-- スライドの結論の一文。v-click を付ければクリックで出せる -->
<template>
  <div class="key-message">
    <slot />
  </div>
</template>

<style scoped>
/* アドオン内のファイルはUnoCSSの走査対象か保証されないため、ユーティリティクラスではなくCSSで書く */
.key-message {
  position: absolute;
  inset-inline: 0;
  bottom: 3rem;
  padding-inline: 3.5rem;
  text-align: center;
  font-size: 1.25rem;
  font-weight: 900;
  color: var(--yano-emphasis);
}
</style>
