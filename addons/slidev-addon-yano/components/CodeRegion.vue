<!-- <AnnotatedCode> 内のコードの line 行目から text を探し、色付きの枠とラベルを重ねる -->
<script setup lang="ts">
import { inject, onMounted, onUnmounted, ref } from 'vue'
import { annotatedCodeRootKey } from '../utils/annotated-code'

const {
  line,
  text,
  label = '',
  color = '#0369a1',
  labelPosition = 'above',
} = defineProps<{
  line: number
  text: string
  label?: string
  color?: string
  labelPosition?: 'above' | 'below'
}>()

const root = inject(annotatedCodeRootKey)
const box = ref<{ left: number, top: number, width: number, height: number }>()

function findRange(lineEl: Element): Range | undefined {
  // シンタックスハイライトで1行が複数の span に分かれるため、テキストノードを連結して探す
  const nodes: Text[] = []
  const walker = document.createTreeWalker(lineEl, NodeFilter.SHOW_TEXT)
  while (walker.nextNode())
    nodes.push(walker.currentNode as Text)

  const start = nodes.map(n => n.data).join('').indexOf(text)
  if (start < 0)
    return undefined

  const range = document.createRange()
  let offset = 0
  for (const node of nodes) {
    const end = offset + node.length
    if (start >= offset && start <= end)
      range.setStart(node, start - offset)
    if (start + text.length >= offset && start + text.length <= end) {
      range.setEnd(node, start + text.length - offset)
      break
    }
    offset = end
  }
  return range
}

function measure() {
  const el = root?.value
  const lineEl = el?.querySelectorAll('pre .line')[line - 1]
  if (!el || !lineEl)
    return

  const range = findRange(lineEl)
  if (!range) {
    console.warn(`[CodeRegion] "${text}" が ${line} 行目に見つからない`)
    return
  }

  const r = range.getBoundingClientRect()
  const base = el.getBoundingClientRect()
  // Slidevはスライドを transform で拡大縮小して表示するため、画面上の寸法を元の寸法に戻す
  const scale = base.width / el.offsetWidth || 1
  box.value = {
    left: (r.left - base.left) / scale,
    top: (r.top - base.top) / scale,
    width: r.width / scale,
    height: r.height / scale,
  }
}

let observer: ResizeObserver | undefined
onMounted(() => {
  measure()
  // Webフォントの読み込み後に文字幅が変わるので測り直す
  document.fonts?.ready.then(measure)
  if (root?.value) {
    observer = new ResizeObserver(measure)
    observer.observe(root.value)
  }
})
onUnmounted(() => observer?.disconnect())
</script>

<template>
  <div class="code-region">
    <template v-if="box">
      <div
        class="code-region-box"
        :style="{
          left: `${box.left - 3}px`,
          top: `${box.top - 2}px`,
          width: `${box.width + 6}px`,
          height: `${box.height + 4}px`,
          borderColor: color,
        }"
      >
        <span
          v-if="label"
          class="code-region-label"
          :class="labelPosition === 'below' ? 'is-below' : 'is-above'"
          :style="{ background: color }"
        >{{ label }}</span>
      </div>
    </template>
  </div>
</template>

<style scoped>
.code-region-box {
  position: absolute;
  border: 2px solid;
  border-radius: 0.25rem;
  pointer-events: none;
}

.code-region-label {
  position: absolute;
  left: -2px;
  padding: 0.05rem 0.4rem;
  border-radius: 0.25rem;
  font-size: 0.65rem;
  font-weight: 700;
  line-height: 1.4;
  white-space: nowrap;
  color: #fff;
}

.code-region-label.is-above {
  bottom: calc(100% + 2px);
}

.code-region-label.is-below {
  top: calc(100% + 2px);
}
</style>
