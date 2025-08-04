FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install common tools
RUN apt-get update && apt-get install -y \
    # Docker
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    # Git and version control
    git \
    git-lfs \
    # Common utilities
    wget \
    vim \
    nano \
    htop \
    tree \
    jq \
    unzip \
    zip \
    tar \
    gzip \
    bzip2 \
    xz-utils \
    # Network tools
    net-tools \
    iputils-ping \
    dnsutils \
    telnet \
    netcat \
    traceroute \
    # Build essentials
    build-essential \
    make \
    gcc \
    g++ \
    # Python
    python3 \
    python3-pip \
    python3-venv \
    # Node.js setup
    nodejs \
    npm \
    # Other useful tools
    tmux \
    screen \
    rsync \
    openssh-client \
    sudo \
    locales \
    && rm -rf /var/lib/apt/lists/*

# Install Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update \
    && apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin \
    && rm -rf /var/lib/apt/lists/*

# Configure locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Set working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"]