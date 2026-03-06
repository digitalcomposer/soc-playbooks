# Playbook: Wireshark Analyse

## Zweck
Verdaechtigen Netzwerkverkehr identifizieren, korrelieren und fuer Incident Response dokumentieren.

## Voraussetzungen
- `.pcap` oder Live-Capture mit Berechtigung
- Wireshark (aktuelle Version)
- Basisdaten: betroffene IPs, Zeitfenster, Vorfall-ID

## Schritte
1. Scope festlegen
   - Betroffene Hosts, Zeitraum, Protokolle bestimmen.
2. Capture laden
   - Datei oeffnen oder auf Interface mitschneiden.
3. Grundfilter setzen
   - Beispiele:
     - `ip.addr == 10.10.10.10`
     - `tcp.port == 443`
     - `dns`
4. Zeitliche Auffaelligkeiten pruefen
   - Bursts, Beaconing, wiederkehrende Intervalle.
5. Protokoll-spezifisch analysieren
   - DNS: DGA/ungewoehnliche Domains
   - HTTP: C2-Indikatoren, User-Agent, POST-Muster
   - TLS: ungewoehnliche SNI/Ja3-Hinweise
6. Streams rekonstruieren
   - `Follow TCP Stream` fuer Inhalte/Kommandos.
7. IOC-Extraktion
   - IPs, Domains, Hashes, URIs, Zertifikatsdaten.
8. Dokumentation
   - Findings, Zeitstempel, betroffene Assets, Risiko.

## Artefakte
- Exportierte Streams
- IOC-Liste
- Kurzbericht mit Timeline

## Eskalationskriterien
- Exfiltration vermutet
- C2-Muster bestaetigt
- Laterale Bewegung sichtbar
