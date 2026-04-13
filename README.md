# Configuration Files

This directory contains shell and terminal configuration files for macOS development environment.

## Files

### `.zshrc`

Zsh shell configuration file with customizations and productivity enhancements.

#### Features

**Colors & Readability**

- Enables colored output with `CLICOLOR` and custom `LSCOLORS`
- Provides better visual distinction in terminal

**Plugins**

- **zsh-autosuggestions**: Suggests commands as you type based on history
- **zsh-syntax-highlighting**: Highlights command syntax in real-time

**Aliases**
Navigation shortcuts:

- `ll` - List all files with details (`ls -la`)
- `la` - List all hidden files (`ls -A`)
- `c` - Clear screen
- `..` - Go up one directory
- `...` - Go up two directories

Configuration shortcuts:

- `zshrc` - Open `.zshrc` in VS Code
- `zprofile` - Open `.zprofile` in VS Code
- `reload` - Reload both `.zprofile` and `.zshrc`
- `sc` - Show all aliases in current shell

Git aliases:

- `gs` - Git status short format
- `gf` - Fetch all branches
- `gc` - Commit with message
- `ga` - Add files
- `gb` - List branches
- `gco` - Checkout branch
- `gp` - Push to origin
- `gpull` - Pull from origin
- `ai` - Quick access to Claude AI assistant

Build aliases:

- `jb` - Build Java project with Gradle
- `jbr` - Build with Gradle and refresh dependencies

Database aliases (PostgreSQL):

- `startpg` - Start PostgreSQL service
- `restartpg` - Restart PostgreSQL service
- `pg` - Connect to PostgreSQL
- `pgstatus` - Check PostgreSQL status

**History**

- Maintains 10,000 commands in history
- Ignores duplicate commands
- `AUTO_CD` enabled: type folder name to enter it
- `CORRECT` enabled: auto-suggests typo corrections
- **atuin** integration: Enhanced command history search

**Custom Prompt**

- Displays current git branch with status indicator
- Shows clean status (🐱 cat) or uncommitted changes (😺 cat with open eyes)
- Displays `✓ clean` or `✗ uncommitted changes` indicator
- Clean formatting with green git info and white prompt character

**Editor**

- Default editor set to `nano` for all text editing
- `NVM` (Node Version Manager) integration for Node.js development

---

### `config.ghostty`

Configuration file for [Ghostty](https://ghostty.org/) terminal emulator.

#### Settings

**Appearance**

- **Theme**: Catppuccin Mocha (modern, eye-friendly color scheme)
- **Font**: JetBrains Mono at size 14
- **Font Enhancement**: Font thickening enabled for better readability

**Transparency & Effects**

- **Background Color**: Black (#000000)
- **Background Opacity**: 0.65 (semi-transparent)
- **Background Blur**: 20 (slight blur effect for visual appeal)

**Window Styling**

- **Titlebar**: Hidden macOS titlebar (cleaner interface)
- **Padding**: 12px on both X and Y axes (comfortable spacing)

---

## Installation

### Prerequisites

- macOS with Zsh shell
- [Homebrew](https://brew.sh/) package manager
- Ghostty terminal emulator (optional)

### Setup Steps

1. **zsh plugins** (required for `.zshrc`):

   ```bash
   brew install zsh-autosuggestions zsh-syntax-highlighting atuin
   ```

2. **Node Version Manager** (optional):

   ```bash
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
   ```

3. **Copy configuration files**:

   ```bash
   # For .zshrc
   cp .zshrc ~/.zshrc
   source ~/.zshrc

   # For Ghostty (if installed)
   mkdir -p ~/.config/ghostty
   cp config.ghostty ~/.config/ghostty/config
   ```

4. **PostgreSQL** (if using database aliases):
   ```bash
   brew install postgresql@17
   brew services start postgresql@17
   ```

---

## Customization

### Adding New Aliases

Edit `.zshrc` and add to the aliases section:

```bash
alias shortcut="command --options"
```

Then reload: `reload`

### Changing Ghostty Theme

Edit `config.ghostty` and change:

```
theme = YourThemeName
```

Restart Ghostty to apply changes.

### Adjusting Terminal Transparency

Modify `background-opacity` value (0.0-1.0) where:

- `0.0` = fully transparent
- `1.0` = fully opaque

---

## Notes

- The `.zshrc` file is sourced from the home directory (`~/.zshrc`)
- Ghostty configuration is typically located at `~/.config/ghostty/config`
- `atuin` provides fuzzy history search via `Ctrl+R` by default
- Git aliases provide quick shortcuts for common operations
- Custom prompt includes emoji indicators for git status at a glance
