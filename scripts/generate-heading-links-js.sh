#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/ig-common.sh"

ig_short="${1:-}"
if [[ -z "$ig_short" ]]; then
  echo "Error: IG short name is required" >&2
  exit 1
fi

load_ig_config "$ig_short"

OUTPUT_JS="$IG_DIR/input/content/assets/js/heading-links.js"
mkdir -p "$(dirname "$OUTPUT_JS")"

cat > "$OUTPUT_JS" <<EOF

// === AUTO-GENERATED FILE ===
// Do not edit by hand; edit scripts/generate-heading-links-js.sh instead.

const newIssueGithubLink = "https://github.com/$GITHUB_REPO/issues/new?template=$IG_TEMPLATE_NAME";
const linkParameter = "$LINK_PARAMETER";
const igTagParameter = "$IG_TAG_PARAMETER";
const igTagValue = "$IG_TAG";

document.addEventListener("DOMContentLoaded", function() {
  setTimeout(function() {
    const headings = document.querySelectorAll("h1, h2, h3, h4, h5, h6");
    headings.forEach(function(heading) {
      const link = document.createElement('a');
      link.className = "bubble-link";
      link.innerHTML = \`
        <svg width="18" height="14" viewBox="0 0 24 20" style="vertical-align:middle; margin-left: 6px;">
          <path d="M2 10c0-4.418 4.477-8 10-8s10 3.582 10 8-4.477 8-10 8c-1.258 0-2.462-.146-3.574-.418l-4.048 1.523c-.326.123-.63-.182-.507-.507l1.523-4.048C2.146 12.462 2 11.258 2 10z" fill="#1818a8"/>
        </svg>
      \`;
      link.href = newIssueGithubLink;
      link.target = "_blank";
      link.title = "Feedback oder Änderung vorschlagen";

      link.addEventListener('click', function(event) {
        event.preventDefault();
        const currentUrl = window.location.href;
        const url = new URL(newIssueGithubLink);
        url.searchParams.set(linkParameter, currentUrl);
        if (igTagValue) {
          url.searchParams.set(igTagParameter, igTagValue);
        }
        window.open(url.toString(), '_blank');
      });

      heading.insertAdjacentElement('beforeend', link);
    });
  }, 200);
});
EOF

echo "heading-links.js generated at $OUTPUT_JS"
