import type { InjectionKey, Ref } from 'vue'

export const annotatedCodeRootKey: InjectionKey<Ref<HTMLElement | undefined>> = Symbol('annotated-code-root')
