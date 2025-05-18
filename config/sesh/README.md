# Sesh - Session Management Scripts

A collection of scripts for managing terminal sessions and workspaces.

## Features

- Create and manage named terminal sessions
- Automatically restore previous window layouts and working directories
- Support for multiple terminal emulators
- Easy session switching and cleanup
- Pre-configured scripts for common development environments (see below)

## Pre-configured Session Scripts

The `scripts/` directory contains ready-to-use scripts for quickly launching common development environments in a new tmux session. Each script opens a split terminal layout and starts the relevant development server and editor.

### Available Scripts

#### `patissaulotte_python_conf`
- **Purpose:**
  - Sets up a Python (Django) development environment using the `patissaulotte` conda environment.
  - One pane runs the Django development server, the other opens Neovim in the same environment.
- **How it works:**
  1. Splits the tmux window vertically.
  2. In the bottom pane, activates the `patissaulotte` conda environment and runs `django runserver`.
  3. Switches to the top pane, activates the same environment, and opens Neovim.
- **Usage:**
  ```sh
  ./scripts/patissaulotte_python_conf
  ```

#### `angular_conf`
- **Purpose:**
  - Sets up an Angular development environment.
  - One pane runs the Angular dev server (`ng serve`), the other opens Neovim.
- **How it works:**
  1. Splits the tmux window vertically.
  2. In the bottom pane, runs `ng serve`.
  3. Switches to the top pane and opens Neovim.
- **Usage:**
  ```sh
  ./scripts/angular_conf
  ```

#### `fastapi_conf`
- **Purpose:**
  - Sets up a FastAPI Python development environment.
  - One pane runs the FastAPI dev server, the other opens Neovim.
- **How it works:**
  1. Splits the tmux window vertically.
  2. In the bottom pane, activates the Python virtual environment and runs `fastapi dev app/app.py`.
  3. Switches to the top pane, activates the virtual environment, and opens Neovim.
- **Usage:**
  ```sh
  ./scripts/fastapi_conf
  ```

#### `npm_conf`
- **Purpose:**
  - Sets up a generic Node.js (npm) development environment.
  - One pane runs `npm run dev` (or similar), the other opens Neovim.
- **How it works:**
  1. Splits the tmux window vertically and runs `dev` in the bottom pane.
  2. Switches to the top pane and opens Neovim.
- **Usage:**
  ```sh
  ./scripts/npm_conf
  ```

---

## Customization

You can create your own scripts in the `scripts/` directory following the same pattern. Each script should:
- Be executable (`chmod +x scriptname`)
- Use tmux commands to set up your preferred layout and tools

---

## Requirements

- [tmux](https://github.com/tmux/tmux)
- Any other tools required by your scripts (e.g., conda, ng, fastapi, npm, nvim)
