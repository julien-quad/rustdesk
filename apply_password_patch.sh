#!/bin/bash
# Script to apply custom password patch for Technic informatique
# Run this after: git submodule update --init --recursive

echo "Applying custom permanent password patch for Technic informatique..."

# Path to the config.rs file in the submodule
CONFIG_FILE="libs/hbb_common/src/config.rs"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: $CONFIG_FILE not found. Make sure submodules are initialized."
    echo "Run: git submodule update --init --recursive"
    exit 1
fi

# Check if patch already applied
if grep -q "Custom default permanent password for Technic informatique" "$CONFIG_FILE"; then
    echo "Patch already applied!"
    exit 0
fi

# Apply the patch
# Find the get_permanent_password function and add the default password
sed -i.bak '/pub fn get_permanent_password() -> String {/,/^    }$/ {
    /^    }$/ i\
        // Custom default permanent password for Technic informatique\
        if password.is_empty() {\
            password = "&aqw1AQW".to_string();\
        }
}' "$CONFIG_FILE"

if [ $? -eq 0 ]; then
    echo "✓ Patch applied successfully!"
    echo "✓ Default permanent password set to: &aqw1AQW"
    rm -f "${CONFIG_FILE}.bak"
else
    echo "✗ Failed to apply patch"
    if [ -f "${CONFIG_FILE}.bak" ]; then
        mv "${CONFIG_FILE}.bak" "$CONFIG_FILE"
        echo "  Restored original file"
    fi
    exit 1
fi
