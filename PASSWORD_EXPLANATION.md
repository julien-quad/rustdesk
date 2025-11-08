# Password Configuration Explanation

## What Was Changed

### Previous (Incorrect) Implementation
Initially, I modified the **temporary password** generation functions:
- `get_auto_password()` - Used for generating random temporary passwords
- These passwords change automatically at each connection
- Not what the user wanted

### Current (Correct) Implementation  
Now modified the **permanent password** (mot de passe unique):
- `get_permanent_password()` - Returns the user-configured permanent password
- When no password is configured, returns default: `&aqw1AQW`
- This password stays the same across all connections
- **This is what the user requested**

## How It Works

### Permanent Password Logic
```rust
pub fn get_permanent_password() -> String {
    let mut password = CONFIG.read().unwrap().password.clone();
    if password.is_empty() {
        // Check HARD_SETTINGS (from custom config)
        if let Some(v) = HARD_SETTINGS.read().unwrap().get("password") {
            password = v.to_owned();
        }
    }
    // Custom default for Technic informatique
    if password.is_empty() {
        password = "&aqw1AQW".to_string();
    }
    password
}
```

### Password Priority
1. **User-configured password** (if set in settings)
2. **HARD_SETTINGS password** (from custom client config)  
3. **Default password: `&aqw1AQW`** ← Our customization

## User Experience

When the application starts for the first time:
- No password configured → Uses `&aqw1AQW`
- Password appears in "Security" settings
- User can change it if desired
- Password persists across connections (permanent)

## Difference from Temporary Password

| Feature | Temporary Password | Permanent Password |
|---------|-------------------|-------------------|
| Changes each connection | ✅ Yes | ❌ No |
| User must refresh | ✅ Yes | ❌ No |
| Default value | Random (6-10 chars) | `&aqw1AQW` |
| Setting location | Not saved | Security settings |
| Our modification | ❌ Reverted | ✅ Applied |

## Modified File

**libs/hbb_common/src/config.rs**
- Function: `get_permanent_password()`
- Line: ~1083-1094
- Commit: af94242
