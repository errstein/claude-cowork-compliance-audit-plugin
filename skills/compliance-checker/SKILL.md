---
name: compliance-checker
description: >
  Check Cowork activity and local audit logs for compliance issues, policy
  violations, or anomalies. Use when the user asks for a compliance review,
  audit report, or risk assessment on recent Cowork sessions.
---

Review `~/.compliance-audit/sessions.log` and produce:
```
COMPLIANCE REPORT
=================
Period: <date range>
Sessions reviewed: <count>
Status: PASS / REVIEW NEEDED / FAIL

FINDINGS
--------
[HIGH/MEDIUM/LOW] <finding description>

RECOMMENDATIONS
---------------
<actionable items>
```
