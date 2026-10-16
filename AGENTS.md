# Dotfiles

Personal dotfiles for Windows, Linux and macOS.

This repository is developed incrementally on existing,
actively used machines.

## Principles

- Follow KISS and YAGNI.
- Prefer simple, maintainable solutions.
- Avoid unnecessary dependencies, abstractions and duplication.
- Make small, focused changes.
- Do not implement features that have not been requested.
- Verify unfamiliar features against official documentation.

## Development

- Inspect existing files before making changes.
- Preserve existing functionality and configuration.
- NEVER overwrite or delete existing user configuration without permission.
- Do not install or uninstall software without permission.
- Do not change the default shell or system settings automatically.
- Do not create symlinks without inspecting their destinations.
- Do not introduce installation automation prematurely.
- Validate configuration changes whenever possible.
- Do not claim something works unless it has been verified.

## Platforms

Target platforms:

- macOS desktop
- Linux desktop
- Windows desktop
- Linux servers, where applicable

- Prefer portable configuration when practical.
- Use platform-specific configuration only when necessary.
- Do not assume that every tool is available on every platform.
- Do not assume that desktop configuration belongs on servers.
- Only deploy explicitly selected configuration to servers.
- Avoid hardcoded machine-specific paths.

## Git

Treat the Git commit history as the project's changelog.

- One logical change per commit.
- Create focused commits as work progresses.
- Commits are allowed without asking for permission.
- Write commit messages in English.
- Keep commit subjects short, descriptive and in present tense.
- Prefer commit subjects under 50 characters.
- Describe what changed, not just a version number.
- Add a commit body when additional context is useful.
- NEVER include Co-Authored-By trailers in commits.
- NEVER include AI attribution in commits or pull requests.
- Do not add emojis to commit messages.
- Review staged changes before committing.
- Never commit unrelated changes.
- Never commit secrets or credentials.

### Remote operations

- NEVER push without explicit user approval.
- Always request confirmation before each push operation.
- Approval for one push does not authorize future pushes.
- NEVER force-push without separate explicit approval.
- Do not create or modify remote branches or tags without approval.
- Local commits may be reviewed and refined before pushing.
- Never silently rewrite or discard existing commits.
- Do not enable automatic pushing.

## Configuration

- Prefer native configuration formats.
- Keep configuration readable and maintainable.
- NEVER commit secrets, credentials or private keys.
- Do not add configuration for tools that are not yet in use.
- Keep experimental configuration separate from active configuration.
- Introduce symbolic links incrementally and safely.

## Backlog

BACKLOG.md lists tools by status:

- Candidate `- [ ]`: not yet evaluated or adopted.
- Adopted `- [x]`: in use. Must also be listed in README.md.
- Rejected `- [x] ~~Name~~`: evaluated but not adopted.
  Keep the entry and state the reason.

## AI tools

- Share reusable skills between Codex and Claude Code.
- Maintain a single source of truth for shared instructions.
- Avoid duplicate AGENTS.md and CLAUDE.md content.
- Keep global instructions minimal.
- Keep project-specific instructions within their projects.
- Do not overwrite existing AI tool configuration without permission.

## Communication

- Communicate with the user in Finnish.
- Write commit messages and pull request descriptions in English.
