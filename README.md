"# AIML-Series

A collection of AI/ML learning notebooks covering fundamental concepts in data visualization and machine learning.

## Contents

### 📊 Notebooks

#### 1. **linear_regression.ipynb**

Linear regression implementation and analysis.

#### 2. **data_detox.ipynb**

Comprehensive guide to data visualization with matplotlib and NumPy. Covers:

- **Basic Plotting**: Simple line plots and visualization setup
- **Sigmoid Function**: Implementation and plotting of the sigmoid activation function
- **Plot Parameters**: Demonstrating different line styles, colors, and markers
- **Mathematical Functions**: Grid visualization of 6 key functions (sine, cosine, tangent, exponential, logarithm, sigmoid)
- **Feature Analysis**: Scatter plots for analyzing relationships between features and target variables
  - 4-feature visualization
  - 10-feature comprehensive analysis with shared y-axis

## Installation

No external setup required. Uses standard libraries:

- NumPy
- Matplotlib

## Usage

Open any notebook with Jupyter or JupyterLab to run cells interactively.

## Auto-Commit Feature

This repository includes an automatic commit script that watches for file changes and commits them to Git without manual intervention.

### How It Works

The `auto-commit.ps1` script monitors your workspace for changes and automatically commits them. Here's what it does:

1. **File Watcher**: Watches all files in the repository for changes (file modifications, new files, deletions)
2. **Commit Interval**: Checks every 10 seconds if changes exist
3. **Automatic Staging**: If changes are detected, it stages all modified files (`git add -A`)
4. **Auto Commit**: Creates a commit with a timestamp message (e.g., "Auto-commit: 2026-03-31 14:23:45")
5. **Logging**: Displays commit activity in the terminal for visibility

### Starting Auto-Commit

Run this command in your terminal:

```powershell
cd "c:\Tanmay\Code\AIML Series"
powershell -ExecutionPolicy Bypass -File .\auto-commit.ps1
```

### Stopping Auto-Commit

Press `Ctrl+C` in the terminal where the script is running.

### Features

- ✅ Automatically commits notebook changes every 10 seconds if modifications exist
- ✅ Includes timestamps in commit messages for tracking when changes occurred
- ✅ Skips commits if no changes are detected (prevents empty commits)
- ✅ Watches all file types in the repository (notebooks, scripts, markdown, etc.)
- ✅ Runs continuously until manually stopped

### Example Output

```
[14:23:45] Auto-committed changes
[14:23:55] Auto-committed changes
[14:24:05] Auto-committed changes
```

### Notes

- The script runs in the background - keep the terminal window open
- All commits bypass pre-commit hooks (`--no-verify` flag)
- Changes are committed exactly as they are when detected
- Useful for development workflows where you want continuous history tracking"
