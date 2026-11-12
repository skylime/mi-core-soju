# Changelog

## 25.4.3

### Bug Fixes

- Switch to original package with smf manifest [Thomas Merkel]

## 25.4.2

### Features

- Switch to core-base 25.4.1 with better backup support [Thomas Merkel]
- Version bump to 0.11.1 of soju [Thomas Merkel]
  * Add TLS client authentication support for downstream connectionjs.
  * Introduce new soju.im/client-cert IRC extension to configure TLS client certificates.
  * Add support for forwarding downstream client certificates across proxies via PP2_SUBTYPE_SSL_CLIENT_CERT.
  * labeled-response is now supported for downstream clients, for reliable command/reply matching.
  * An icon can be set in the configuration file.
  * Add support for draft/extended-isupport, to advertise bouncer-wide metadata before logging in.
  * Add support for CHATHISTORY AROUND, to query messages before and after a given timestamp.
  * Add support for draft/ACCOUNTREQUIRED, to indicate that an account is required.
- Switch to core-base 25.4.3 [Thomas Merkel]

### Build

- Add workflow template for forgejo [Thomas Merkel]
- Allow manual workflow [Thomas Merkel]
- Allow manual workflow (fix) [Thomas Merkel]
- Modify button for production release [Thomas Merkel]

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



