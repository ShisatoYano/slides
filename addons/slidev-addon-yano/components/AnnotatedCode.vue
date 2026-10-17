<!-- コードブロックを包み、中に置いた <CodeRegion> の位置の基準になる -->
<script setup lang="ts">
import { provide, ref } from 'vue'
import { annotatedCodeRootKey } from '../utils/annotated-code'

const root = ref<HTMLElement>()
provide(annotatedCodeRootKey, root)
</script>

<template>
  <div ref="root" class="annotated-code">
    <slot />
  </div>
</template>

<style scoped>
/* CodeRegion のラベルは行の上下に出るため、行間を広げてラベルが隣の行の文字を隠さないようにする。
   Slidevはこの変数を !important で適用するので、line-height を直接指定しても効かない */
.annotated-code {
  position: relative;
  --slidev-code-line-height: 36px;
}
</style>
