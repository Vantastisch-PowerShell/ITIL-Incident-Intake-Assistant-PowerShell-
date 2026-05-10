# ITIL Incident Intake Assistant (PowerShell)

## Overview
This PowerShell script simulates a simple IT Service Desk intake process based on ITIL v4 concepts.

It collects structured user input, applies basic classification logic, and generates a formatted ticket summary.

The goal of this project is to demonstrate practical understanding of IT support workflows and basic automation using PowerShell.

---

## Features

- Interactive incident intake form using Read-Host
- Structured data collection for support cases
- Basic ITIL-style classification logic:
  - Incident
  - Service Request
  - Problem
  - Major Incident
- Clear ticket summary output in the console

---

## Classification Logic

The script classifies incidents based on simple rules such as:

- Number of affected users
- Keywords in the issue description
- Frequency of the issue
- Service impact indicators

This reflects a simplified ITIL v4-inspired decision flow.

---

## Example Output


User: John

Issue: Outlook crash

Working: Teams still works

Not Working: Outlook

Affected Users: 3

Classification: Problem


---

## Usage

Run the script in PowerShell:


## Purpose

This project was created as a portfolio piece for IT Support roles.

It demonstrates:
Basic PowerShell scripting
Structured troubleshooting workflow
ITIL v4 concept understanding
Simple decision-based automation
