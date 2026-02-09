FROM mcr.microsoft.com/devcontainers/javascript-node:1-20

RUN apt-get update \
   && apt-get install -y --no-install-recommends \
       openjdk-17-jre-headless \
       curl \
       jq \
       wget \
       xvfb \
       libgtk-3-0 \
       libnotify4 \
       libxss1 \
       libnss3 \
       libxtst6 \
       libasound2 \
       libatk1.0-0 \
       libatk-bridge2.0-0 \
       libx11-xcb1 \
       libxkbfile1 \
       libxcomposite1 \
       libxdamage1 \
       libxrandr2 \
       libgbm1 \
       libdrm2 \
       libxshmfence1 \
       libxcb-dri3-0 \
   && rm -rf /var/lib/apt/lists/*

RUN wget -q https://github.com/mikefarah/yq/releases/download/v4.44.1/yq_linux_amd64 -O /usr/local/bin/yq \
   && chmod +x /usr/local/bin/yq

RUN apt-get update \
   && apt-get install -y --no-install-recommends \
       apt-transport-https \
       ca-certificates \
       gnupg \
   && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" \
       > /etc/apt/sources.list.d/google-cloud-sdk.list \
   && curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg \
       | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg \
   && apt-get update \
   && apt-get install -y --no-install-recommends google-cloud-cli \
   && rm -rf /var/lib/apt/lists/*

RUN set -e; \
   drawio_url=$(curl -s https://api.github.com/repos/jgraph/drawio-desktop/releases/latest \
      | jq -r '.assets[] | select(.name | endswith(".AppImage")) | .browser_download_url' \
      | head -n 1); \
   echo "Downloading draw.io from $drawio_url"; \
   curl -L "$drawio_url" -o /usr/local/bin/drawio.appimage; \
   chmod +x /usr/local/bin/drawio.appimage; \
   printf '%s\n' \
      '#!/usr/bin/env bash' \
      'set -euo pipefail' \
      'exec xvfb-run -a /usr/local/bin/drawio.appimage "$@"' \
      > /usr/local/bin/drawio; \
   chmod +x /usr/local/bin/drawio

RUN printf '%s\n' \
      '#!/usr/bin/env bash' \
      'set -euo pipefail' \
      'IGTOOLS_DIR="${IGTOOLS_DIR:-/opt/igtools}"' \
      'IGTOOLS_JAR="$IGTOOLS_DIR/igtools.jar"' \
      'IGTOOLS_URL="${IGTOOLS_URL:-https://hl7.org/fhir/tools/igtools.jar}"' \
      'mkdir -p "$IGTOOLS_DIR"' \
      'if [[ ! -f "$IGTOOLS_JAR" ]]; then' \
      '  echo "Downloading igtools from $IGTOOLS_URL"' \
      '  curl -L "$IGTOOLS_URL" -o "$IGTOOLS_JAR"' \
      'fi' \
      'exec java -jar "$IGTOOLS_JAR" "$@"' \
      > /usr/local/bin/igtools \
   && chmod +x /usr/local/bin/igtools
