FROM alpine:3.17

RUN apk add --update --no-cache ca-certificates curl git openssh-client-default aws-cli

ENV TERRAFORM_VERSION=1.3.9
RUN curl -sSL -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip /tmp/terraform.zip -d /tmp/ && \
    mv /tmp/terraform /usr/local/bin/terraform && \
    chmod +x /usr/local/bin/terraform && \
    rm -rf /tmp/terraform.zip

ARG TERRAGRUNT_VERSION=v0.40.0
RUN curl -sSL -o /usr/local/bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 && \
    chmod +x /usr/local/bin/terragrunt

ENV TERRAFORM_DOCS_VERSION 0.16.0
RUN curl -sSL https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz | tar -zxf - -C /usr/local/bin && \
    chmod +x /usr/local/bin/terraform-docs

RUN mkdir -p /work

WORKDIR /work
