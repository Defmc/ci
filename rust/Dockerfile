FROM rust:alpine

RUN apk add -U llvm llvm-dev libstdc++ musl-dev g++ lld openssl-dev sccache cargo-outdated cargo-audit

RUN rustup component add rustfmt
RUN rustup component add clippy
RUN rustup install nightly

RUN RUSTFLAGS="-Ctarget-feature=-crt-static" cargo install cargo-udeps
#RUN RUSTFLAGS="-Ctarget-feature=-crt-static" cargo install cargo-audit
#RUN RUSTFLAGS="-Ctarget-feature=-crt-static" cargo install cargo-outdated
#RUN RUSTFLAGS="-Ctarget-feature=-crt-static" cargo install sccache

ENV RUSTFLAGS="$RUSTFLAGS -C link-arg=-fuse-ld=lld"
ENV RUSTC_WRAPPER="sccache"
ENV SCCACHE_CACHE_SIZE="1G"
