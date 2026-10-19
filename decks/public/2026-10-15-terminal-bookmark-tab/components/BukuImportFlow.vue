<!-- ブラウザのブックマークをbukuに取り込み、一覧で確かめる流れ。stage はスライドのクリック回数 -->
<script setup lang="ts">
import { computed } from 'vue'

const { stage = 0 } = defineProps<{ stage?: number }>()

// 各段階で何が起きるかは、この番号とデータの組み合わせだけで決める
const IMPORT = 1
const PRINT = 2

// 質問文は buku 5.1 の --ai が実際に出すもの。取り込みに成功しても何も表示されない
const prompts = [
  'Generate auto-tag (YYYYMonDD)? (y/n): n',
  'Add parent folder names as tags? (y/n): y',
  'Import bookmarks from Google Chrome? (y/n): y',
]

const bookmarks = [
  { title: 'jarun/buku', url: 'https://github.com/jarun/buku', tags: 'cli,tools' },
  { title: 'junegunn/fzf', url: 'https://github.com/junegunn/fzf', tags: 'cli,tools' },
  { title: 'あとで読む記事A', url: 'https://example.com/a', tags: 'あとで読む' },
]

const captions = [
  'ブックマークはブラウザの中にある',
  'ブラウザのブックマークを buku に一括で取り込む',
  'フォルダ名がそのままタグになる',
]
const caption = computed(() => captions[Math.min(stage, captions.length - 1)])
</script>

<template>
  <div class="flow">
    <TerminalWindow title="bash" class="terminal">
      <div v-if="stage < IMPORT" class="line">
        <span class="prompt">❯</span><span class="cursor" />
      </div>

      <template v-else-if="stage < PRINT">
        <div class="line"><span class="prompt">❯</span> buku --ai</div>
        <div v-for="p in prompts" :key="p" class="line">{{ p }}</div>
        <div class="line"><span class="prompt">❯</span><span class="cursor" /></div>
      </template>

      <template v-else>
        <div class="line"><span class="prompt">❯</span> buku -p</div>
        <div v-for="(b, i) in bookmarks" :key="b.url" class="entry">
          <div class="line"><span class="index">{{ i + 1 }}.</span> <span class="title">{{ b.title }}</span></div>
          <div class="line indent"><span class="dim">&gt;</span> <span class="url">{{ b.url }}</span></div>
          <div class="line indent"><span class="dim">#</span> <span class="tag">{{ b.tags }}</span></div>
        </div>
      </template>
    </TerminalWindow>

    <div class="caption">{{ caption }}</div>
  </div>
</template>

<style scoped>
.flow {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.terminal {
  /* 一覧の段階が一番背が高い。それに揃えて、クリックで下の説明文が上下しないようにする */
  min-height: 18rem;
}

.prompt {
  margin-right: 0.4rem;
  color: var(--yano-term-green);
}

.cursor {
  display: inline-block;
  width: 0.5rem;
  height: 1em;
  vertical-align: text-bottom;
  background: var(--yano-term-fg);
}

.entry + .entry {
  margin-top: 0.6rem;
}

.indent {
  padding-left: 1.6rem;
}

.index {
  color: var(--yano-term-yellow);
}

.title {
  color: var(--yano-term-green);
}

.url {
  color: var(--yano-term-blue);
}

.tag {
  color: var(--yano-term-red);
}

.dim {
  color: var(--yano-term-dim);
}

.caption {
  text-align: center;
  font-size: 1rem;
  font-weight: 700;
  color: var(--yano-accent);
}
</style>
