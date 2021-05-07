FROM alpine:3.12

RUN apk add --update --no-cache py3-pip ca-certificates curl git openssh-client

ENV TERRAFORM_VERSION=0.14.11
RUN curl -sSL -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip /tmp/terraform.zip -d /tmp/ && \
    mv /tmp/terraform /usr/local/bin/terraform && \
    chmod +x /usr/local/bin/terraform && \
    rm -rf /tmp/terraform.zip

ARG TERRAGRUNT_VERSION=v0.23.40
RUN curl -sSL -o /usr/local/bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 && \
    chmod +x /usr/local/bin/terragrunt

ENV AWSCLI_VERSION=1.18.123
RUN pip3 --no-cache-dir install --upgrade awscli==${AWSCLI_VERSION}

ENV TERRAFORM_DOCS_VERSION 0.9.1
RUN curl -sSL -o /usr/local/bin/terraform-docs https://github.com/segmentio/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64 && \
    chmod +x /usr/local/bin/terraform-docs

RUN mkdir -p /work

WORKDIR /work
