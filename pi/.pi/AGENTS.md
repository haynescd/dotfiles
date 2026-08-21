# PI AGENT WORKSPACE

**Generated:** 2026-05-09T00:00:00Z
**Commit:** 871ce6f

npm workspace for pi agent extensions. TypeScript, ESM-only.

## STRUCTURE

```
.pi/
├── package.json          # Workspace root: workspaces = ["agent/extensions/*"]
├── tsconfig.json         # Strict, bundler mode, ESNext, noEmit
├── agent/
│   ├── settings.json     # Provider, model, theme, packages, interview config
│   └── extensions/       # Local TypeScript extensions
│       ├── save-md/              # Save assistant responses as Markdown
```

Skills live in `home/.agents/skills/` and stow to `~/.agents/skills/`. Do not copy them here.

## WHERE TO LOOK

| Task | Location |
|------|----------|
| Change default model/provider | `agent/settings.json` |
| Add pi package | `agent/settings.json` → `packages[]` |
| Create extension | `agent/extensions/<name>/` with `package.json` |
| Create standalone extension | `agent/extensions/<name>.ts` |
| Create skill | `home/.agents/skills/<name>/SKILL.md` |
| Type-check and test local packages | `npm run check` (from .pi root) |

## CONVENTIONS

- Extensions as npm workspace packages: each has own `package.json`
- Standalone extensions: single `.ts` file in `extensions/`
- Skills: `SKILL.md` as entry under `home/.agents/skills/`, optional bundled resources
- ESM only: `"type": "module"` everywhere
- Dependencies: `@earendil-works/pi-ai`, `@earendil-works/pi-coding-agent`, `@earendil-works/pi-tui`
- TypeScript strict mode: `noUncheckedIndexedAccess`, `noImplicitOverride`

## ANTI-PATTERNS

- Installing deps at workspace root for extension-specific needs (use per-package)
- Committing `node_modules/` (gitignored per-extension)
- Editing `agent/settings.json` outside dotfiles repo (stow overwrites)
- Adding runtime state files to git (most of `agent/*` is gitignored, only extensions/settings un-ignored)
- Duplicating skills under `agent/skills/` — they belong in `home/.agents/skills/`
- Writing any model ID from a local `opencode-cloudflare` overlay into tests, fixtures, docs, examples, source comments, tracked configuration, or any other version-controlled file. Overlay models are internal/private; use public catalog models or generic placeholders in tracked artifacts.

## KEY SETTINGS

```jsonc
// agent/settings.json
{
  "defaultProvider": "opencode.cloudflare.dev",
  "defaultModel": "claude-opus-4-6",
  "defaultThinkingLevel": "high",
  "theme": "catppuccin-macchiato",
  "packages": ["npm:pi-extmgr", "npm:@plannotator/pi-extension"]
}
```

## GITIGNORE PATTERN
Most of `agent/` is gitignored by default. Tracked files are explicitly un-ignored:
- `agent/settings.json`, `agent/cloak.json`, `agent/tsconfig.json`, `agent/package.json`
- `agent/extensions/**` (but `node_modules/` within are re-ignored)
- `agent/themes/*.json`

## NOTES
- pi-skill-toggle has a full UI layer (overlay, render, view-model)
