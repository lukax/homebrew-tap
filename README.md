# lukax/homebrew-tap

Homebrew formulae for [llms.ink](https://llms.ink) — turn any link (site, docs section, page, GitHub repo, PDF or video) into `llms.txt` and `llms-full.txt` for your AI.

## Install

```sh
brew install lukax/tap/llms-ink
```

Or `brew tap lukax/tap` and then `brew install llms-ink`.

## Use

```sh
llms-ink https://example.com/docs          # llms.txt
llms-ink https://example.com/docs --full   # llms-full.txt
llms-ink --help
```

Free without a key; set `LLMS_INK_KEY` for higher limits. Docs: https://llms.ink/docs/

## Updating the formula

When a new `@lukax/llms-ink` version is on npm:

```sh
brew bump-formula-pr --url https://registry.npmjs.org/@lukax/llms-ink/-/llms-ink-<ver>.tgz lukax/tap/llms-ink
```

or edit `url` and `sha256` (`curl -sL <url> | shasum -a 256`) in `Formula/llms-ink.rb`.
