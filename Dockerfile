FROM node:20.12.0-bookworm as build

ENV FOUNDRY_DIR /usr/local
RUN curl -L https://foundry.paradigm.xyz | bash && \
  /usr/local/bin/foundryup

WORKDIR /

RUN git config --global user.email "hello@settlemint.com" && \
  git config --global user.name "SettleMint" && \
  forge init usecase --template settlemint/solidity-empty && \
  cd usecase && \
  forge build

USER root

FROM cgr.dev/chainguard/busybox:latest

COPY --from=build /usecase /usecase
COPY --from=build /root/.svm /usecase-svm
