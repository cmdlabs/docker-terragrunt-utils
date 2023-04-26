FROM alpine:3.17

RUN apk add --update --no-cache ca-certificates curl git openssh terraform aws-cli sudo

ARG TERRAGRUNT_VERSION=v0.40.0
RUN curl -sSL -o /usr/local/bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 && \
    chmod +x /usr/local/bin/terragrunt

ENV TERRAFORM_DOCS_VERSION 0.16.0
RUN curl -sSL https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz | sudo tar -zxf - -C /usr/local/bin && \
    sudo chmod +x /usr/local/bin/terraform-docs

RUN mkdir -p /work

WORKDIR /work
