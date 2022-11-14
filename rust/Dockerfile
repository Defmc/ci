FROM rust:alpine

RUN apk add -U llvm llvm-dev libstdc++ musl-dev g++ lld openssl-dev

RUN rustup component add rustfmt
RUN rustup component add clippy

RUN cargo install sccache
RUN cargo install cargo-audit
RUN cargo install cargo-outdated
RUN RUSTFLAGS="-Ctarget-feature=-crt-static" cargo install cargo-udeps

ENV RUSTFLAGS="$RUSTFLAGS -C link-arg=-fuse-ld=lld"
ENV RUSTC_WRAPPER="sccache"
ENV SCCACHE_CACHE_SIZE="1G"
