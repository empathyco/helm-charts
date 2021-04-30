FROM devth/helm:v3.5.2

RUN wget https://github.com/mikefarah/yq/releases/download/v4.7.1/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq