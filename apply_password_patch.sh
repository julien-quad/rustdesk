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
# Find the line with just "password" (return statement) and add semicolon + default password logic
awk '
/pub fn get_permanent_password\(\) -> String \{/ { in_func=1 }
in_func && /^[[:space:]]*password[[:space:]]*$/ {
    print "    password;";
    print "    // Custom default permanent password for Technic informatique";
    print "    if password.is_empty() {";
    print "        password = \"&aqw1AQW\".to_string();";
    print "    }";
    in_func=0;
    next;
}
{ print }
' "$CONFIG_FILE" > "${CONFIG_FILE}.new"

if [ $? -eq 0 ] && [ -s "${CONFIG_FILE}.new" ]; then
    mv "${CONFIG_FILE}.new" "$CONFIG_FILE"
    echo "✓ Patch applied successfully!"
    echo "✓ Default permanent password set to: &aqw1AQW"
else
    echo "✗ Failed to apply patch"
    rm -f "${CONFIG_FILE}.new"
    exit 1
fi
