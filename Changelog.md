# Changelog

## 25.4.0

### Features

- Initial image definition for core-soju

  Adds a mibe-based SmartOS image that deploys soju v0.10.1, a
  multi-user IRC bouncer, as a managed zone service.

  - Installs soju from pkgsrc (skylime-extra, 2025Q4)
  - Provisions ZFS delegated dataset at /var/lib/soju with znapzend
    backup schedules (8h/1d/1w/1m retention tiers)
  - Generates a Let's Encrypt TLS certificate via ssl-generator
    and configures soju to listen on IRCS (6697) and HTTPS
  - Grants net_privaddr privilege to the SMF service so it can
    bind to privileged ports
  - Creates the file-upload directory and wires it into the config



