# https://github.com/lambci/docker-lambda#documentation
FROM lambci/lambda:build-provided.al2

RUN yum install -y jq openssl-devel
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
    | CARGO_HOME=/cargo RUSTUP_HOME=/rustup sh -s -- -y --profile minimal
ADD build.sh /usr/local/bin/
VOLUME ["/code"]
WORKDIR /code
ENTRYPOINT ["/usr/local/bin/build.sh"]
