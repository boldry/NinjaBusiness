### 2026 Product Assumptions and Inputs

- Purpose: Capture all agreed assumptions and specific numbers for 2026 by product. ARR refers to recurring software only; one-time setup/add-ons and usage are tracked under Total Revenue.
- Reference: MRR comparison sheet `2026_MRR_Product_Comparison.csv` in this folder for EoQ MRR figures (current vs scaled).

---

### Ninja Notes B2C (Self‑Serve)
- Pricing plans (monthly):
  - Entry: $18
  - Pro: $30
- 2026 plan mix (B2C only): 30% Entry, 70% Pro (blended ARPU ≈ $26.40)
- Starting paying subs (Jan 1, 2026): 250
- New adds per quarter (2026): Q1 800, Q2 1,200, Q3 1,800, Q4 2,700
- Churn: 10%/mo at start, improving linearly to 6%/mo by year end
- Billing: Monthly, cancelable (assumed)

### Ninja Notes Enterprise
- Price per seat: $35/user/month
- Average deployment size: 400 seats per new logo
- Contract term: 2–3 years, billed monthly
- New logos per quarter (2026): Q1 2, Q2 2, Q3 3, Q4 3 (total 10)
- Renewal pricing: List prices flat; modest uplift at annual renewal (5–8%) planned
- NRR seat expansion: Not modeled yet (TBD)

### Omni Sales
- Users per customer: 50 users at $75/user/month (= $3,750 MRR/customer)
- Contract: 2–3 years, billed monthly
- New customers per quarter (2026): Q1 4, Q2 4, Q3 5, Q4 6
- Implementation services: $15,000 per customer, 3 phased payments within 45 days (recognized as delivered)
- One‑time add‑ons: $10,000 per customer
- Recurring software base: $45,000 ARR per customer (ex‑services/add‑ons)

### Omni Service
- Users per customer: 500 users at $75/user/month (= $37,500 MRR/customer)
- Contract: 2–3 years, billed monthly
- New customers per quarter (2026): Q1 0, Q2 2, Q3 3, Q4 4
- Implementation services: $25,000 per customer
- One‑time add‑ons: $15,000 per customer

### Omni Concierge
- Vendor plan pricing:
  - One‑time setup: $3,000
  - Subscription: $250/month per vendor (one QR code)
  - Usage: $9 per talk‑hour
  - Annual content update: $1,500 one‑time per year
- Vendor customers added (2026): Q1 0, Q2 25, Q3 40, Q4 60 (total 125)
- Vendor usage model per vendor (4 events/year):
  - 1 large event/year: ~2,500 interactions (≈ 750 in‑booth + 1,750 QR) × 10 min → ~416.7 talk‑hours
  - 3 standard events/year: avg 191 attendees × 5% engagement × 10 min → ~1.59 talk‑hours/event (~4.77 hours total)
- Full‑show deployments (entire venue): 12 shows in 2026, quarterly split 0/3/4/5
  - Setup fee per show: $75,000
  - Engagement model per show: ~110,000 attendees × 10% engagement × 10 min → ~1,833.3 talk‑hours/show at $9/hour

### Sona (Hardware)
- ASP (device): $65; landed COGS: $30
- 2026 software fee: None (future: small monthly for OTA upgrades)
- Packaging: Optional; not bundled by default with Notes
- Attach rule (2026): 5% of total Ninja Notes Enterprise seats sold in 2026
  - Seats sold (2026): 10 logos × 400 seats = 4,000 seats
  - Estimated devices (2026): 5% × 4,000 = 200 devices

---

### Revenue Treatment (for modeling)
- ARR/MRR: Recurring software only (Notes B2C, Notes Enterprise seats, Omni Sales/Service seats, Concierge vendor subscription)
- One‑time: Implementation, setup, and add‑ons (recognized as delivered)
- Usage: Concierge talk‑hours at $9/hour (recognized in month of service)
- NRR: Enterprise renewal uplifts (5–8%) and seat expansion to be modeled separately (TBD)

### Files
- Current vs Scaled EoQ MRR: `2026_MRR_Product_Comparison.csv`
- This assumptions doc: `2026_Product_Assumptions.md`
