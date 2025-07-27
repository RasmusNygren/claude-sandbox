FROM node:24-bookworm

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    git \
    python3 \
    python3-pip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g @anthropic-ai/claude-code

RUN groupadd claude && \
    useradd -m -s /bin/bash -g claude claude

RUN mkdir -p /workspace /workspace/.claude && \
    chown -R claude:claude /workspace

USER claude
WORKDIR /workspace

ENV PATH="/home/claude/.local/bin:$PATH"

ENV CLAUDE_CONFIG_PATH="/workspace/.claude"
ENV HOME="/workspace"

CMD ["/bin/bash"]
