# KNX Forensics

Records your KNX bus, compares it with the ETS project and shows what is wrong – with evidence and specific advice.

## Setup
1. Start the add-on and open **KNX Forensics** in the sidebar.
2. Enter a name, import your ETS project (`.knxproj`, password-protected projects supported) and choose your KNX IP interface.
3. Recording runs continuously. The free version shows the last 7 days; KNX Forensics Pro (licence key from wagramio.at) unlocks the full history, sending, reports, the ETS reconciliation and more.

## Options
- `allow_send` (default `false`): allows writing to the KNX bus from KNX Forensics. Only enable this in a trusted network – anyone who can open the add-on can then unlock sending.

## Notes
- The add-on uses the host network so that interface discovery and KNX routing (multicast) work.
- Data stays in Home Assistant (`/data`) and is included in Home Assistant backups. Nothing is sent to WAGRAM/IO except the licence check for Pro.
