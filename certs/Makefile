DOMAIN   ?= localhost
NAME     ?= ${DOMAIN}

CAKEY    ?= CAkey.key
CACERT   ?= CAcert.pem

SIGN_REQ ?= ${NAME}.csr
CERT     ?= ${NAME}.crt
PEM      ?= ${NAME}.pem
KEY      ?= ${NAME}.key

CA = "/C=PL/ST=Wlkp/O=/localityName=Poznan/CN=Hauleth/emailAddress=lukasz@niemier.pl"

SUBJECT = "/CN=*.${DOMAIN}"

VERIFY_OPTS = -purpose sslserver -CAfile ${CACERT}

verify: ${PEM} ${CACERT}
	openssl version
	openssl x509 -noout -text -in "$<"
	openssl verify ${VERIFY_OPTS} -verify_hostname ${DOMAIN} $<
	openssl verify ${VERIFY_OPTS} -verify_hostname test.${DOMAIN} $<

clean:
	$(RM) -f "${CERT}" "${SIGN_REQ}" "${PEM}" "${KEY}"

${CAKEY}:
	openssl genrsa -out "$@" 2048

${CACERT}: ${CAKEY}
	openssl req -new -key "$<" -out "$@" \
		-subj ${CA} -x509 -nodes -sha256 -days 1825

installCA: ${CACERT}
	security import "$<"
	security add-trusted-cert "$<"

cleanCA:
	security remove-trusted-cert "${CACERT}"
	$(RM) -f "${CACERT}" "${CAKEY}"

config.conf:
	echo 'subjectAltName=$${ENV::SAN}' > "$@"

${KEY}:
	openssl genrsa -out "$@" 2048

${SIGN_REQ}: ${KEY}
	openssl req -new -sha256 -subj $(SUBJECT) -key "$<" -out "$@" \
		-addext "subjectAltName=DNS:${DOMAIN},DNS:*.${DOMAIN}"

${CERT}: ${SIGN_REQ} ${CACERT} ${CAKEY} config.conf
	SAN="DNS:${DOMAIN},DNS:*.${DOMAIN}" \
		openssl x509 -req -out "$@" -in ${SIGN_REQ} \
		-CA ${CACERT} -CAkey ${CAKEY} -CAcreateserial \
		-days 365 -sha256 \
		-extfile config.conf

${PEM}: ${CERT} ${KEY}
	cat ${CERT} ${KEY} > "$@"

.PHONY: clean verify install installCA cleanCA
