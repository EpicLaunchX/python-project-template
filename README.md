## 👋 Welcome!

This template helps you start Python projects and complete [EpicLaunchX](https://docs.epiclaunchx.io/how-it-works/) tasks. 
Just follow the steps below!

> **Note:** You do **not** need to fork this repository. You have been added as a collaborator, so please work directly in this repo and create your branches here.

---

## 🚦 Standards & Conventions (**Must Read!**)

⚠️ **All contributors must read the [Project Cheat Sheet](./CHEATSHEET.md) before starting any work.**

This cheat sheet summarizes the required branch naming, commit message, PR, and code quality conventions for this project. Following these standards is essential for your work to be accepted!

---

## 🌐 Preferred: Cloud Development with GitHub Codespaces

> **Recommended!**
> For the easiest and most reliable onboarding, **use [GitHub Codespaces](https://github.com/features/codespaces)** for a one-click, cloud-based development environment. This is the preferred way to do tasks in this project.
>
> Just click the **"Code"** button at the top of this repository and select **"Create codespace on main"**. All dependencies and tools will be set up automatically!

---

## ✅ First Steps Checklist

> **Note:** If you use GitHub Codespaces (preferred), some of these steps are handled automatically and can be skipped (e.g., environment setup and dependency installation).

- [ ] Accept the invitation for being a collaborator in this repo
- [ ] Clone the repo *(Codespaces: done for you)*
- [ ] Create and activate virtualenv *(Codespaces: done for you)*
- [ ] Install dependencies *(Codespaces: done for you)*
- [ ] Implement your first task
- [ ] Run tests
- [ ] Open your first Pull Request (pass all checks and earn points upon successful Merge)

---

## 💡 Need help?

If you get stuck, jump in to our [Discord](https://discord.gg/2R4BdaczUG)

---

### Option 2: Manual Local Setup

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd <your-repo-name>
   ```

2. **Create a virtual environment**
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   ```

3. **Install dependencies**
   ```bash
   make install-flit
   make install-dev
   ```

4. **Activate pre-commit hooks**
    ```bash
    make enable-pre-commit-hooks
    ```

5. **Run tests**
   ```bash
   make test
   ```

---

## 🪟 Windows Users

If you are on Windows and can't use `make`, you have two options:

1. **Recommended:** Use [WSL](https://docs.microsoft.com/en-us/windows/wsl/) or [Git Bash](https://gitforwindows.org/) to run Makefile commands.
2. **Manual:** Run the equivalent Python commands below:

| Make Command         | Manual Command(s)                                                                 |
|----------------------|-----------------------------------------------------------------------------------|
| make install-flit    | python -m pip install flit==3.8.0                                                 |
| make install-dev     | python -m flit install -s --env --deps=develop --symlink                          |
| make test            | python -m pytest -svvv -m "not slow and not integration" tests                    |
| make format          | see [Makefile](./Makefile)                                                        |

If you get stuck, ask for help in our [Discord](https://discord.gg/2R4BdaczUG)!


## 🛠️ Project Structure

```
src/
  pytemplate/
    ...              # Layers of the application (domain, service, etc.) 
tests/               # Add your tests here
Makefile             # Common commands (install, run, test, lint, etc.)
.pre-commit-config.yaml  # Pre-commit hooks for code quality
pyproject.toml       # Project configuration and dependencies
```

---

## 💡 Features

- **Modern Python packaging** with [flit](https://flit.readthedocs.io/)
- **Pre-configured code quality tools:** black, isort, flake8, bandit, pytype
- **Easy testing** with pytest
- **Pre-commit hooks** for consistent code style
- **Makefile** for common developer tasks

---

## 🧑‍💻 Development Flow

1. Edit your code in `src/pytemplate/`.
2. Add tests in `tests/`.
3. Use `make format` and `make lint` to keep your code clean.
4. Commit with confidence—pre-commit hooks will check your code!

---

## 📝 FAQ

**Q: I get an error about flit not found!**  
A: Run `make install-flit` first.

**Q: How do I add a new dependency?**  
A: Add it to `pyproject.toml` under `[project.dependencies]` and run `make install-dev`.

**Q: How do I run a specific test?**  
A: Use `pytest tests/test_yourfile.py::test_function_name`.