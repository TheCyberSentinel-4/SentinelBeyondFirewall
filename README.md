# SentinelBeyondFirewall- Securing Web Application Infrastructure – A Multi-Layered Approach

## 📌 Project Overview
This project implements a **multi-layered security architecture** to protect a web application from external threats.  
The design covers **network security, application security, monitoring, centralized logging, and data protection** with disaster recovery in mind.

---

## 🛠 Architecture Flow

1. **Router → PFsense Firewall + Suricata IDS/IPS**
   - PFsense acts as the network firewall.
   - Suricata performs intrusion detection and prevention.

2. **Web Server (Apache)**
   - Hosts the application.
   - Only accepts traffic allowed by firewall and IPS rules.

3. **PRTG Network Monitor**
   - Monitors performance, uptime, and device health.
   - Generates alerts for anomalies.

4. **Grafana + Loki + Promtail**
   - Centralized log collection and visualization.
   - Promtail ships logs, Loki stores them, Grafana visualizes them.

5. **Database Layer (MySQL in Private Network)**
   - Isolated private network access.
   - Only web server communicates with the database.

6. **Backup System**
   - Automated backups for logs and database dumps.
   - Ensures disaster recovery.

---

## 🎯 Key Features
- Multi-layered security implementation.
- Real-time monitoring and alerting.
- Centralized logging for incident investigation.
- Secure database isolation.
- Automated backups for business continuity.

---

## 💻 Tools & Technologies Used
- **PFsense** – Network firewall.
- **Suricata** – Intrusion Detection & Prevention.
- **PRTG** – Infrastructure monitoring.
- **Grafana** – Dashboard visualization.
- **Loki** – Centralized log storage.
- **Promtail** – Log shipping agent.
- **MySQL** – Relational database.
- **Debian** – OS for deployment.

---

## ⚠ Challenges Faced
- **Suricata false positives** – Required fine-tuning detection rules.
- **Log normalization** – Standardizing different log formats for Loki.
- **Grafana performance optimization** – Improved dashboard load times.
- **Private network database monitoring** – Securely enabled metric collection.
- **Debian ‘deluser’ issue** – Removing a user with multiple active processes required identifying and terminating them before deletion.

---
