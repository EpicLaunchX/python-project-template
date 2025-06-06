# 🚀 Project Cheat Sheet: Standards & Conventions

Welcome! This cheat sheet summarizes the most important standards and conventions for contributing to this project. For full details, see the [Standards & Conventions](https://beta.epiclaunchx.io/static/docs/standards-conventions.html).
---

## 📚 Quick Reference Table

| Task                | Command/Convention                | Example/Notes                  |
|---------------------|-----------------------------------|-------------------------------|
| **Branch Naming**   | `launch_{number}_task_{number}`   | `launch_1_task_1`             |
| **Commit Message**  | Conventional Commits              | `feat: add user login`        |
| **Run Tests**       | `make test`                       | Uses pytest                   |
| **Format Code**     | `make format`                     | Run before commit             |
| **Lint Code**       | `make lint`                       | Run before commit             |
| **Type Check**      | `make type-check`                 |                               |
| **Security Check**  | `make secure`                     |                               |

---

## 🏷️ Branch Naming
- Pattern: `launch_{number}_task_{number}`
- Example: `launch_1_task_1`

## 📝 Commit Guidelines
- Use [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- Example: `feat: add user login`

## 🔀 Pull Request (PR) Practices
- Name PRs using Conventional Commits format
- In PR description, include task closure keyword (e.g., `Closes #1`)
- See: [Linking a pull request to an issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue-using-a-keyword)

## ✅ Testing & Quality
- Write and pass unit tests (`make test`)
- Use pytest as the test library
- Ensure code is formatted and linted before committing

## 🛠️ Essential Make Commands
- `make test` — Run unit tests
- `make format` — Format code
- `make lint` — Lint code
- `make secure` — Security check
- `make type-check` — Type check

## 📄 More Details
For comprehensive standards and conventions, see [Standards & Conventions](https://beta.epiclaunchx.io/static/docs/standards-conventions.html).
