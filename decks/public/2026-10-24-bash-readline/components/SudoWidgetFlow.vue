<!-- bind -x で割り当てた関数が READLINE_LINE / READLINE_POINT を書き換え、行に sudo が付く流れ。stage はスライドのクリック回数 -->
<script setup lang="ts">
import { computed } from 'vue'

const { stage = 0 } = defineProps<{ stage?: number }>()

// 各段階で何が起きるかは、この番号とデータの組み合わせだけで決める
const PRESS = 1
const REWRITE = 2

const before = 'apt install ripgrep'
const prefix = 'sudo '

const done = computed(() => stage >= REWRITE)
// 「カーソルは打ち終えた位置(行末)」の状態から sudo の分だけ右へずれる
const point = computed(() => (done.value ? prefix.length : 0) + before.length)

const captions = [
  '打ち終えてから、sudo の付け忘れに気づいた',
  'Alt + s で、割り当てた関数 _prepend_sudo が呼ばれる',
  '変数を書き換えると、コマンドラインがその場で書き換わる',
]
const caption = computed(() => captions[Math.min(stage, captions.length - 1)])
</script>

<template>
  <div class="flow">
    <TerminalWindow title="bash">
      <div class="line">
        <span class="prompt">$</span><span v-if="done" class="changed">{{ prefix }}</span>{{ before }}<span class="cursor" />
      </div>
      <div class="key" :class="{ 'is-shown': stage >= PRESS }">↓ Alt + s</div>
    </TerminalWindow>

    <div class="vars">
      <div class="var-name">READLINE_LINE</div>
      <div class="var-value">"<span v-if="done" class="changed">{{ prefix }}</span>{{ before }}"</div>
      <div class="var-name">READLINE_POINT</div>
      <div class="var-value"><span :class="{ changed: done }">{{ point }}</span></div>
    </div>

    <div class="caption">{{ caption }}</div>
  </div>
</template>

<style scoped>
.flow {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.line {
  white-space: pre;
  font-size: 1.1rem;
}

.prompt {
  margin-right: 0.4rem;
  color: var(--yano-term-green);
}

.cursor {
  display: inline-block;
  width: 0.55rem;
  height: 1em;
  vertical-align: text-bottom;
  background: var(--yano-term-fg);
}

.changed {
  color: var(--yano-term-yellow);
  font-weight: 700;
}

/* キーの注記は最初から場所を取っておき、クリックで下の要素が上下しないようにする */
.key {
  margin-top: 0.3rem;
  font-size: 0.8rem;
  color: var(--yano-term-blue);
  opacity: 0;
  transition: opacity 0.3s;
}

.key.is-shown {
  opacity: 1;
}

.vars {
  display: grid;
  grid-template-columns: max-content 1fr;
  gap: 0.3rem 1.5rem;
  padding: 0.75rem 1rem;
  border-radius: 0.5rem;
  background: var(--yano-code-bg);
  font-family: var(--slidev-code-font-family, 'JetBrains Mono', monospace);
  font-size: 0.95rem;
  color: var(--yano-term-fg);
}

.var-name {
  color: var(--yano-term-blue);
}

.caption {
  text-align: center;
  font-size: 1.05rem;
  font-weight: 700;
  color: var(--yano-accent);
}
</style>
