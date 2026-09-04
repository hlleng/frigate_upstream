# syntax=docker/dockerfile:1.6

ARG DEBIAN_FRONTEND=noninteractive
ARG PIP_BREAK_SYSTEM_PACKAGES=1

FROM frigate AS frigate-axcl
ARG TARGETARCH
ARG PIP_BREAK_SYSTEM_PACKAGES

# Install x86 AXCL FFmpeg
RUN if [ "$TARGETARCH" = "amd64" ]; then \
        mkdir -p /usr/lib/ffmpeg/axcl/bin && \
        wget https://github.com/ivanshi1108/assets/releases/download/v0.16.2/ffmpeg-x64 -O /usr/lib/ffmpeg/axcl/bin/ffmpeg && \
        wget https://github.com/ivanshi1108/assets/releases/download/v0.16.2/ffprobe-x64 -O /usr/lib/ffmpeg/axcl/bin/ffprobe && \
        chmod +x /usr/lib/ffmpeg/axcl/bin/ffmpeg /usr/lib/ffmpeg/axcl/bin/ffprobe; \
    fi

RUN echo "/usr/lib/axcl" > /etc/ld.so.conf.d/ax.conf

ENV FRIGATE_AXERA_TARGET="axcl"
ENV PATH="${PATH}:/usr/bin/axcl"
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib/axcl"

ENTRYPOINT ["sh", "-c", "ldconfig && if [ -x /usr/lib/ffmpeg/axcl/bin/ffmpeg ]; then export DEFAULT_FFMPEG_VERSION=axcl; export INCLUDED_FFMPEG_VERSIONS=\"axcl:${INCLUDED_FFMPEG_VERSIONS}\"; fi && exec /init"]
