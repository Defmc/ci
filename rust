FROM rust:alpine

RUN apk add llvm llvm-dev libstdc++ musl-dev g++ lld

RUN rustup component add rustfmt
RUN rustup component add clippy

ENV RUSTFLAGS="$RUSTFLAGS -C link-arg=-fuse-ld=lld"
