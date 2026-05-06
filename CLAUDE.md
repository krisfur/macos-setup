# Global instructions

## General behaviour
- Don't create extra markdown files (READMEs, summaries, notes) unless asked.
- Match the existing code style in a file rather than imposing a preferred style. 
- Minimal changes over large additions where possible.

## Git
- Never add "Co-Authored-By: Claude" or any co-author trailer to commits.
- Never add "🤖 Generated with Claude Code" or similar attribution to commits or PRs.
- Write commit messages as if I authored them always ending with a full stop ".".

## Python
- Use type hints on function signatures.
- Use `pytest` for tests where applicable.
- Use `uv` for dependency and environment management (`uv add`, `uv run`, `uv sync`) instead of pip/venv/poetry.
- Use `ruff` for formatting and linting (`ruff format`, `ruff check --fix`).
- Check for typing issues with `Ty`.
- Prefer `uv run <script>` over activating venvs manually unless otherwise specified.
- Check `uv audit` for CVEs.

## TypeScript
- Use `prettier` for formatting.
- Infer whether to use `npm` or `bun` from a repo's lock file: `package-lock.json` -> `npm`, `bun.lockb` -> `bun`.
- In new projects prefer `bun` over `npm`.
- Use `ES modules`, not `CommonJS`, in new code.
- Avoid `any`; use `unknown` and narrow.
- Use `eslint` alongside `prettier` if already present in the repo `.json`.
- Check `npm audit` or `bun audit` (matching the package manager) for CVEs.

## Go
- Run `gofmt` and `go vet` before considering work done.
- Use the standard library where possible before reaching for dependencies.
- Errors are values — wrap with fmt.Errorf("...: %w", err), don't swallow.
- Check `govulncheck ./...` for CVEs.

## Rust
- Use `cargo fmt` and `cargo clippy` (treat clippy warnings as errors).
- Prefer `?` over `unwrap()` outside of tests and prototypes.
- Check `cargo audit` for CVEs.
