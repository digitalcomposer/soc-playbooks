# Playbook: Hash Cracking (Forensik/Authorized Testing)

## Zweck
Hashes klassifizieren und im autorisierten Rahmen Passwoerter wiederherstellen, um Risiko und Impact zu bewerten.

## Voraussetzungen
- Explizite Freigabe
- Hash-Material mit sauberer Chain-of-Custody
- Hashcat und/oder John the Ripper

## Schritte
1. Rechtliche Freigabe validieren
   - Ticket/Scope/Owner dokumentieren.
2. Hash-Typ identifizieren
   - Format, Prefixe, Laenge, Entropie.
3. Eingangsdaten bereinigen
   - Duplikate entfernen, Format normalisieren.
4. Priorisierte Angriffspfade
   - Wordlist zuerst, dann Rules, danach Mask/Bruteforce (kontrolliert).
5. Beispiel Hashcat
   - `hashcat -m <mode> -a 0 hashes.txt wordlist.txt`
6. Ressourcensteuerung
   - Laufzeit, Temperatur, Auslastung ueberwachen.
7. Ergebnisvalidierung
   - Treffer stichprobenartig pruefen, False Positives ausschliessen.
8. Reporting
   - Crack-Rate, Passwortmuster, Risiko, Hardening-Empfehlungen.

## Artefakte
- Trefferliste (gesichert)
- Statistik (cracked vs. total)
- Empfehlungen: MFA, Passwortpolicy, Rotation

## Eskalationskriterien
- Hohe Crack-Rate bei privilegierten Accounts
- Wiederverwendete Passwoerter in kritischen Systemen
- Hinweise auf Credential Stuffing Risiko
