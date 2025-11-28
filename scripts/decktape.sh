#!/usr/bin/env bash
set -euo pipefail

echo "${QUARTO_PROJECT_OUTPUT_FILES:-}" | while IFS= read -r out; do
  [[ -z "$out" ]] && continue

  case "$out" in
    *.html)
      html="$out"
      pdf="${out%.html}.pdf"

      echo "Decktape: $html -> $pdf"

      # We’re *inside* the quarto container, working_dir is /project
      # QUARTO_PROJECT_OUTPUT_FILES are relative to /project, so this works:
      decktape \
        -s 1600x900 -p 2000 \
        reveal "$html" "$pdf"
      ;;
  esac
done
