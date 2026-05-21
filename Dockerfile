# Clean third-party verifier container.
# Has cosign, ots-cli, jq, sha256sum -- no VALIS dependencies.
# Build:  docker build -t valisbench-verify .
# Run:    docker run --rm -v "$(pwd)":/repo:ro valisbench-verify v1.0.0

FROM debian:bookworm-slim

ARG TARGETARCH=arm64
ARG COSIGN_VERSION=v2.5.0

RUN apt-get update && apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      jq \
      coreutils \
      python3 \
      python3-pip \
      python3-venv \
 && rm -rf /var/lib/apt/lists/*

# Install cosign from GitHub releases (arch-aware)
RUN curl -fsSL -o /usr/local/bin/cosign \
    "https://github.com/sigstore/cosign/releases/download/${COSIGN_VERSION}/cosign-linux-${TARGETARCH}" \
 && chmod +x /usr/local/bin/cosign \
 && cosign version

# Install opentimestamps-client in an isolated venv
RUN python3 -m venv /opt/ots-venv \
 && /opt/ots-venv/bin/pip install --no-cache-dir opentimestamps-client \
 && ln -s /opt/ots-venv/bin/ots /usr/local/bin/ots \
 && ots --version

WORKDIR /repo
COPY verify.sh /usr/local/bin/verify.sh
RUN chmod +x /usr/local/bin/verify.sh

ENTRYPOINT ["/usr/local/bin/verify.sh"]
