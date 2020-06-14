FROM bitnami/kubectl:1.13

COPY init-kubectl kubectl /opt/sinlead/kubectl/bin/

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    git config --global user.name "CI bot" && \
    git config --global user.email "ci@devindata.com"

ENV PATH="/opt/sinlead/kubectl/bin:$PATH"

ENTRYPOINT ["kubectl"]

CMD ["--help"]
