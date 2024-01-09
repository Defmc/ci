FROM rust:alpine

RUN apk add -U llvm llvm-dev libstdc++ musl-dev g++ lld openssl-dev sccache cargo-outdated cargo-audit

RUN rustup install stable
RUN rustup install beta
RUN rustup install nightly

RUN rustup +stable component add rustfmt
RUN rustup +stable component add clippy

RUN RUSTFLAGS="-Ctarget-feature=-crt-static" cargo install cargo-udeps

ENV RUSTFLAGS="$RUSTFLAGS -C link-arg=-fuse-ld=lld"
ENV RUSTC_WRAPPER="sccache"
ENV SCCACHE_CACHE_SIZE="1G"
