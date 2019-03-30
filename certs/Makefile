NAME     ?= localhost
DOMAIN   ?= localhost

KEY      ?= ${NAME}.key
SIGN_REQ ?= ${NAME}.csr
CERT     ?= ${NAME}.crt

SUBJECT = "/C=US/ST=Connecticut/O=/localityName=New Haven/commonName=${DOMAIN}/commonName=*.${DOMAIN}/organizationalUnitName=/emailAddress=/"

all: ${CERT}

install: all
	security import ${CERT}
	security add-trusted-cert ${CERT}

clea:
	$(RM) -rf ${KEY} ${CERT} ${SIGN_REQ}

verify: ${CERT}
	openssl x509 -noout -text -in $<

${KEY}:
	openssl genrsa -out "$@" 2048

${SIGN_REQ}: ${KEY}
	openssl req -new -sha256 -subj $(SUBJECT) -key "$<" -out "$@" -passin pass:""

${CERT}: ${SIGN_REQ} ${KEY}
	openssl x509 -req -days 365 -in "${SIGN_REQ}" -signkey "${KEY}" -out "$@"

.PHONY: all clean verify install
