<!-- タブをfzfで選び、bukuに保存して閉じる流れ。stage はスライドのクリック回数 -->
<script setup lang="ts">
import { computed } from 'vue'

const { stage = 0 } = defineProps<{ stage?: number }>()

// 各段階で何が起きるかは、この番号とデータの組み合わせだけで決める
const LIST = 1
const PICK = 2
const SAVE = 3
const CLOSE = 4

const tabs = [
  { id: 101, title: 'Slidev', url: 'sli.dev' },
  { id: 102, title: 'あとで読む記事A', url: 'example.com/a', pick: true },
  { id: 103, title: 'jarun/buku', url: 'github.com/jarun/buku' },
  { id: 104, title: 'あとで読む記事B', url: 'example.com/b', pick: true },
  { id: 105, title: '天気予報', url: 'weather.example' },
  { id: 106, title: 'junegunn/fzf', url: 'github.com/junegunn/fzf' },
]
const picked = tabs.filter(t => t.pick)

const captions = [
  'ブラウザにタブがたまっている',
  'tabctl でタブの一覧をターミナルに出す',
  'fzf で閉じたいタブを Tab で複数選ぶ',
  '選んだタブを buku にタグ付きで保存する',
  '保存したタブを tabctl で閉じる',
]
const caption = computed(() => captions[Math.min(stage, captions.length - 1)])

const isClosed = (t: typeof tabs[number]) => stage >= CLOSE && t.pick
</script>

<template>
  <div class="flow">
    <div class="browser">
      <div
        v-for="t in tabs"
        :key="t.id"
        class="tab"
        :class="{ 'is-closed': isClosed(t), 'is-picked': stage >= PICK && stage < CLOSE && t.pick }"
      >
        {{ t.title }}
      </div>
    </div>

    <TerminalWindow title="tabarchive" class="terminal">
      <div v-if="stage < LIST" class="line">
        <span class="prompt">❯</span><span class="cursor" />
      </div>

      <template v-else-if="stage < SAVE">
        <div class="line"><span class="prompt">❯</span> tabarchive</div>
        <div class="line">
          <span class="fzf-prompt">&gt;</span><span class="dim">{{ stage >= PICK ? `${tabs.length}/${tabs.length} (${picked.length})` : `${tabs.length}/${tabs.length}` }}</span>
        </div>
        <div
          v-for="t in tabs"
          :key="t.id"
          class="line row"
          :class="{ 'is-picked': stage >= PICK && t.pick }"
        >
          <span class="mark">{{ stage >= PICK && t.pick ? '▌' : ' ' }}</span>
          <span class="dim">{{ t.id }}</span> {{ t.title }} <span class="dim">{{ t.url }}</span>
        </div>
      </template>

      <template v-else>
        <div class="line"><span class="prompt">❯</span> tabarchive</div>
        <div v-for="t in picked" :key="`save-${t.id}`" class="line">
          <span class="ok">saved</span> {{ t.title }} <span class="tag">#tab-archive</span>
        </div>
        <div v-for="t in picked" :key="`close-${t.id}`" class="line appear" :class="{ 'is-shown': stage >= CLOSE }">
          <span class="ok">closed</span> tab {{ t.id }}
        </div>
      </template>
    </TerminalWindow>

    <div class="caption">{{ caption }}</div>
  </div>
</template>

<style scoped>
.flow {
  display: flex;
  margin-top: 1rem;
  flex-direction: column;
  gap: 0.75rem;
}

.browser {
  display: flex;
  gap: 0.25rem;
  padding: 0.4rem 0.5rem 0;
  border-radius: 0.5rem 0.5rem 0 0;
  background: #e5e7eb;
}

.tab {
  overflow: hidden;
  flex: 1 1 0;
  max-width: 10rem;
  padding: 0.35rem 0.6rem;
  border-radius: 0.4rem 0.4rem 0 0;
  background: #f9fafb;
  font-size: 0.7rem;
  white-space: nowrap;
  text-overflow: ellipsis;
  transition: flex-grow 0.5s, max-width 0.5s, padding 0.5s, opacity 0.4s, background 0.3s;
}

/* 明るいブラウザを真似ているので、ダークモードでもタブの文字は暗いままにする */
/* :global() で囲むとVueがセレクタ全体をグローバルにして .tab を落とすので使わない(scopedは最後の .tab だけに印を付ける) */
html.dark .tab {
  color: #1f2937;
}

.tab.is-picked {
  background: #dbeafe;
}

/* 幅を0に縮めてから消すことで、残ったタブが詰まっていく様子を見せる */
.tab.is-closed {
  flex-grow: 0;
  max-width: 0;
  padding-inline: 0;
  opacity: 0;
}

.terminal {
  min-height: 15rem;
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

.row {
  transition: background 0.3s;
}

.row.is-picked {
  background: color-mix(in srgb, var(--yano-term-blue) 20%, transparent);
}

.mark {
  display: inline-block;
  width: 1rem;
  color: var(--yano-term-red);
}

.fzf-prompt {
  margin-right: 0.6rem;
  color: var(--yano-term-yellow);
}

.dim {
  color: var(--yano-term-dim);
}

.ok {
  margin-right: 0.4rem;
  color: var(--yano-term-green);
}

.tag {
  color: var(--yano-term-blue);
}

.appear {
  opacity: 0;
  transition: opacity 0.4s;
}

.appear.is-shown {
  opacity: 1;
}

.caption {
  text-align: center;
  font-size: 1rem;
  font-weight: 700;
  color: var(--yano-accent);
}
</style>
