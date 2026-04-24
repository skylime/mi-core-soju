log "Basic variables for soju"
SOJU_HOME='/opt/local/etc/soju/'
SOJU_DATA='/var/lib/soju/'
SVC_NAME='svc:/pkgsrc/soju:default'

log "Modify service to allow listen on priv ports"
svccfg -s svc:/pkgsrc/soju setprop method_context/privileges = astring: "basic,net_privaddr"
svccfg -s svc:/pkgsrc/soju:default refresh

log "Try to obtain Let's Encrypt SSL certificate"
/opt/core/bin/ssl-generator.sh ${SOJU_HOME} soju_ssl soju ${SVC_NAME}

log "Create file upload directory if not exists"
mkdir -p "${SOJU_DATA}/upload"
chown soju:soju "${SOJU_DATA}/upload"

log "Create soju configuration file"
cat >${SOJU_HOME}/config <<-EOF
# Listing on defaults
listen ircs://
listen https://
listen unix+admin://${SOJU_DATA}admin.sock

# Defaults send to the client
hostname ${HOSTNAME}
title ${HOSTNAME}
motd /etc/motd

# TLS / SSL configuration
tls ${SOJU_HOME}soju.crt ${SOJU_HOME}soju.key

# File upload
file-upload fs ${SOJU_DATA}upload
EOF

log "Fix all permissions"
chown -R soju:soju "${SOJU_HOME}"

log "Enable soju service"
svcadm enable "${SVC_NAME}"
