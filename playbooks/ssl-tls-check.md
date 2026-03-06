# Playbook: SSL/TLS Check

## Zweck
TLS-Konfigurationen auf Schwachstellen, Fehlkonfigurationen und Compliance-Risiken pruefen.

## Voraussetzungen
- Zielhost/FQDN und Port
- OpenSSL, optional `testssl.sh` oder `nmap --script ssl-*`

## Schritte
1. Zertifikat abrufen
   - `openssl s_client -connect <host>:443 -servername <host> </dev/null`
2. Zertifikatsdetails validieren
   - Gueltigkeit, SAN/CN, Kette, Signaturalgorithmus.
3. Protokolle testen
   - TLS 1.2/1.3 erlaubt, alte Versionen deaktiviert.
4. Cipher Suites analysieren
   - Keine schwachen Ciphers, Forward Secrecy bevorzugt.
5. Security-Checks
   - HSTS, OCSP Stapling, Session Resumption Verhalten.
6. Automatisierter Scan
   - `testssl.sh <host>` oder relevante Nmap-Skripte.
7. Bewertung
   - Nach Kritikalitaet: kritisch/hoch/mittel/niedrig.
8. Remediation
   - Unsichere Protokolle/Ciphers deaktivieren, Zertifikat erneuern.

## Artefakte
- Scan-Output
- Konfigurationsabweichungen
- Priorisierte Fix-Liste

## Eskalationskriterien
- TLS 1.0/1.1 aktiv
- Abgelaufenes oder untrusted Zertifikat in Produktion
- Kritische Cipher/Schwachstelle reproduzierbar
