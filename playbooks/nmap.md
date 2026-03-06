# Playbook: Nmap Enumeration

## Zweck
Assets, offene Ports, Dienste und potenzielle Angriffsoberflaechen systematisch erfassen.

## Voraussetzungen
- Schriftliche Freigabe fuer Scanbereich
- Ziel-IP/Netzsegment
- Nmap (aktueller Stand)

## Schritte
1. Scope und Safety
   - Zielbereich und Scanintensitaet abstimmen.
2. Host Discovery
   - `nmap -sn <target-range>`
3. Top-Ports Scan
   - `nmap --top-ports 1000 <target>`
4. Service-/Versionserkennung
   - `nmap -sV -sC <target>`
5. Vollstaendiger Portscan (falls freigegeben)
   - `nmap -p- -T3 <target>`
6. OS/Netzwerkfingerprint (optional)
   - `nmap -O <target>`
7. Ergebnisse korrelieren
   - Unnoetige Services, alte Versionen, Exponierung.
8. Bericht erstellen
   - Priorisierte Risiken + empfohlene Massnahmen.

## Artefakte
- XML/grepable/plain Output
- Service-Matrix pro Host
- Priorisierter Finding-Report

## Eskalationskriterien
- Kritischer Dienst offen ins Internet
- Bekannte verwundbare Version identifiziert
- Unerwartete Remote-Admin-Schnittstellen aktiv
