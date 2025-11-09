#!/bin/bash
set -e

echo "=========================================="
echo "Setting up Claude Flow Codespace..."
echo "=========================================="

# Set workspace directory (use current directory if /workspace doesn't exist)
WORKSPACE_DIR="${WORKSPACE_DIR:-/workspaces/$(basename $(pwd))}"
if [ ! -d "$WORKSPACE_DIR" ]; then
    WORKSPACE_DIR="/workspace"
fi
if [ ! -d "$WORKSPACE_DIR" ]; then
    WORKSPACE_DIR="$(pwd)"
fi

echo "Workspace directory: $WORKSPACE_DIR"

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Install additional dependencies
echo "Installing additional dependencies..."
sudo apt-get install -y curl wget git jq unzip

# Wait for Node.js and npm to be available
echo "=========================================="
echo "Checking Node.js and npm..."
echo "=========================================="
# Wait up to 30 seconds for npm to be available
for i in {1..30}; do
    if command -v npm &> /dev/null; then
        echo "✓ npm found"
        npm --version
        break
    fi
    echo "Waiting for npm... ($i/30)"
    sleep 1
done

if ! command -v npm &> /dev/null; then
    echo "Error: npm not found after waiting. Please check Node.js installation."
    exit 1
fi

# Ensure npm global bin is in PATH
export PATH="$PATH:$HOME/.npm-global/bin:/usr/local/share/npm-global/bin"
npm config set prefix "${NPM_PREFIX:-/usr/local/share/npm-global}"

# Install Python Anthropic SDK for programmatic access
echo "Installing Anthropic Python SDK..."
pip install anthropic
echo "Anthropic Python SDK installed successfully"

# Configure shell environment for convenience
echo "=========================================="
echo "Configuring shell environment..."
echo "=========================================="

# Add npm global bin to PATH in bashrc
if ! grep -q "npm-global/bin" ~/.bashrc 2>/dev/null; then
    echo "" >> ~/.bashrc
    echo "# Add npm global packages to PATH" >> ~/.bashrc
    echo 'export PATH="$PATH:$HOME/.npm-global/bin:/usr/local/share/npm-global/bin"' >> ~/.bashrc
    echo "PATH updated in ~/.bashrc"
fi

echo "Shell PATH settings updated."

# Create helper scripts
echo "=========================================="
echo "Creating helper scripts..."
echo "=========================================="

# Create a verification script
cat > "$WORKSPACE_DIR/verify-setup.sh" << 'EOF'
#!/bin/bash
echo "=========================================="
echo "Verifying Codespace Setup"
echo "=========================================="

echo ""
echo "Node.js:"
node --version

echo ""
echo "npm:"
npm --version

echo ""
echo "Python:"
python3 --version

echo ""
echo "pip:"
pip --version

echo ""
echo "Git:"
git --version

echo ""
echo "Anthropic Python SDK:"
if python3 -c "import anthropic" 2>/dev/null; then
    echo "✓ Anthropic Python SDK installed"
    python3 -c "import anthropic; print(f'Version: {anthropic.__version__}')"
else
    echo "✗ Anthropic Python SDK not found"
fi

echo ""
echo "Environment Variables:"
echo "ANTHROPIC_API_KEY: ${ANTHROPIC_API_KEY:+[SET]}"

echo ""
echo "=========================================="
echo "Setup verification complete!"
echo "=========================================="
EOF
chmod +x "$WORKSPACE_DIR/verify-setup.sh"

echo ""
echo "=========================================="
echo "Tool Installation Complete!"
echo "=========================================="
echo ""
echo "IMPORTANT: Reload your shell to update PATH:"
echo "  source ~/.bashrc"
echo ""
echo "After secrets are configured, run:"
echo "  ./verify-setup.sh           - to verify all installations"
echo "=========================================="
