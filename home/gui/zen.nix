{ config, lib, pkgs, ... }:
# Declarative fix for Zen's native <select> dropdown being unreadable under the
# Noctalia theme. See home/files/zen/select-dropdown-fix.css for the rationale.
#
# The youwen5 zen-browser flake ships only packages (no home-manager module), so
# there are no profiles.<name>.userChrome/settings options to use. We therefore:
#   1. install the override stylesheet to a stable, HM-owned path, and
#   2. use an idempotent activation script to (a) @import it from each Zen
#      profile's chrome/userChrome.css and (b) enable legacy stylesheets in a
#      user.js — the same "strip/append-if-missing" pattern Noctalia itself uses,
#      so the two never clobber each other.
#
# We deliberately do NOT let home-manager symlink chrome/userChrome.css directly:
# Noctalia's zenBrowser post_action rewrites that file in place on every theme
# regeneration, which would replace an HM symlink with a plain file and cause
# rebuild churn. Appending our own @import line coexists cleanly instead.
let
  overridePath = "${config.xdg.configHome}/zen-overrides/select-dropdown-fix.css";
in
{
  # 1. The override stylesheet (clean HM-managed symlink; Noctalia never touches
  #    this path). Colors inside are dynamic — they reference Noctalia's live vars.
  xdg.configFile."zen-overrides/select-dropdown-fix.css".source =
    ../files/zen/select-dropdown-fix.css;

  # 2. Wire it into every Zen profile + enable legacy user stylesheets.
  home.activation.zenSelectDropdownFix =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      overrideFile=${lib.escapeShellArg overridePath}
      importLine="@import \"$overrideFile\";"
      prefKey="toolkit.legacyUserProfileCustomizations.stylesheets"
      prefLine="user_pref(\"$prefKey\", true);"

      for base in "$HOME/.zen" "$HOME/.config/zen"; do
        [ -d "$base" ] || continue
        for prof in "$base"/*/; do
          # Only real profile dirs (have prefs.js or times.json), skip stray dirs.
          if [ ! -e "$prof/prefs.js" ] && [ ! -e "$prof/times.json" ]; then
            continue
          fi

          chromeDir="$prof/chrome"
          run mkdir -p "$chromeDir"
          userChrome="$chromeDir/userChrome.css"
          run touch "$userChrome"
          # Append our @import once. userChrome.css contains ONLY @import lines
          # (ours + Noctalia's), so it stays valid CSS regardless of order.
          if ! grep -Fq "$importLine" "$userChrome"; then
            printf '\n%s\n' "$importLine" >> "$userChrome"
          fi

          # Ensure legacy stylesheets are on. user.js is re-applied by Zen on
          # every startup and is not managed/rewritten by Noctalia.
          userJs="$prof/user.js"
          run touch "$userJs"
          if ! grep -Fq "$prefKey" "$userJs"; then
            printf '%s\n' "$prefLine" >> "$userJs"
          fi
        done
      done
    '';
}
