FROM alpine:3.15 as builder

ENV CMAKE_BUILD_TYPE Release

WORKDIR /root

RUN apk add --no-cache git build-base cmake automake autoconf libtool pkgconf coreutils curl unzip gettext-tiny-dev && \
    git clone --depth 1 https://github.com/neovim/neovim && \
    cd neovim && \
    make -j$(nproc) && \
    make install

FROM alpine:3.15

COPY --from=builder /root/neovim/build/bin/nvim /usr/local/bin/
COPY --from=builder /usr/local/share/nvim /usr/local/share/nvim

RUN apk add --no-cache libgcc

ENTRYPOINT ["sh"]
