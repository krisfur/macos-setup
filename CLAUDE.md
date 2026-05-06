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
- Run `go test` if tests are present in the repo.

## Rust
- Use `cargo fmt` and `cargo clippy` (treat clippy warnings as errors).
- Prefer `?` over `unwrap()` outside of tests and prototypes.
- Check `cargo audit` for CVEs.
- Run `cargo test` if tests are present in the repo.

## Odin
- Keep `.odin` files inside a `src/` directory and use `odin build src` accordingly.
- `Ada_Case` for types, `snake_case` for procs and variables, `SCREAMING_SNAKE_CASE` for constants, `lower_snake` for packages. Visibility is controlled by `@private`, not casing.
- Every `make`, `new`, `strings.clone`, or `fmt.aprintf` needs a matching `delete`/`free`.
- Allocations use `context.allocator` implicitly — don't add explicit allocator parameters to procedures unless the procedure needs to allocate into a different one than the caller's context.
- Prefer `context.temp_allocator` for short-lived allocations within a frame/request, and call `free_all(context.temp_allocator)` at the boundary.
- Wrap `main` with a tracking allocator in debug builds — see `mem.Tracking_Allocator`. 
- Use multiple return values with `ok` booleans, not exceptions: `value, ok := thing()`.
- Use `or_return` for error propagation, `or_else` for defaults.
- Prioritise `for x in slice` — not C-style index loops unless you need the index.
- Use `[dynamic]T`, `map[K]V`, and slices from the language; don't pull in containers from elsewhere.
- Use tagged unions via `union { ... }` plus `switch v in x` — not enum + void pointer.
- Don't reach for OOP patterns; this is data-oriented. No classes, prefer SoA when iterating hot data.
- Don't write generic abstractions speculatively — Odin has parametric polymorphism but the codebase prefers concrete types until duplication is real.
- Don't add Cargo/npm-style dependencies. Vendor anything external into `vendor/` or `shared/`.
- Prefer existing `vendor:` collection bindings (raylib, sdl3, glfw, etc.) over writing your own or pulling community bindings.
- Don't use dynamic array literals (`[dynamic]int{1,2,3}`) — they're disabled by default in current Odin.
- Run `odin test src` if `@(test)` procedures are present.
