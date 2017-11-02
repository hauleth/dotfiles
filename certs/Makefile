PRIV_KEY = private.key
CERT     = cert.csr

all: ${CERT}

clean:
	$(RM) -rf ${PRIV_KEY} ${CERT}

verify: ${CERT}
	openssl x509 -noout -text -in $<

${PRIV_KEY}:
	openssl genrsa -out $@ 2048

${CERT}: self-signed.conf ${PRIV_KEY}
	openssl req -config $< -new -x509 -sha256 -key ${PRIV_KEY} -days 3650 -out $@ -subj "/C=US/ST=California/L=San Francisco/O=My Company, Inc./CN=localhost/"

.PHONY: all clean verify
