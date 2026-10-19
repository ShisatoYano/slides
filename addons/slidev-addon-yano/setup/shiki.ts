import { defineShikiSetup } from '@slidev/types'

// ライトモードでもコードはターミナル(TerminalWindow)と同じく暗い配色で見せる
export default defineShikiSetup(() => ({
  themes: {
    dark: 'vitesse-dark',
    light: 'vitesse-dark',
  },
}))
