FROM hashicorp/terraform:0.13.3

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT [ "/entrypoint.sh" ]
