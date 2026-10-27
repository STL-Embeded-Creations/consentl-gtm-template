# Consentl Cookie Consent (Consent Mode v2) — Google Tag Manager template

A Google Tag Manager tag template for [Consentl](https://consentl.com), the cookie consent platform
by STL Embeded Creations. It owns Google Consent Mode v2 for your site:

1. It sets **Google Consent Mode v2 defaults** per region, before any other tag runs.
2. It loads the Consentl banner (optional) and forwards the visitor's choices to Consent Mode: a
   returning visitor's choice as soon as the banner has run, then every change.

Consent Mode is on **every Consentl plan**, Free included. You need a Consentl account and a site
key: sign up at <https://app.consentl.com>.

Full documentation: <https://consentl.com/docs/gtm>.

## Which setup to choose

| Setup | Holds back non-Google trackers (Business plan) | Consent Mode (every plan) |
|-------|-------------------------------------------------|---------------------------|
| **Snippet first in `<head>`, no template** (recommended, see [Any website](https://consentl.com/docs/web)) | Yes, from the start of the page | Set by the banner |
| Snippet in `<head>` with `&gcm=ext` **plus this template** with "Load the banner" unticked | Yes | Set by the template; useful when GTM is your single source of tag configuration |
| **This template only** (sites where you can only add GTM) | Only tags added after the banner loaded | Set by the template |

When the template loads the banner, GTM injects it asynchronously, so trackers hard-coded in the
page HTML run, and are requested, before it. Tags managed **inside GTM** are fine: they wait for
Consent Mode.

If the snippet is in your page as well, add `&gcm=ext` to its URL, so that only the template sends
Consent Mode commands:

```html
<script src="https://api.consentl.com/v1/loader.js?k=SITE_KEY&l=LANG&gcm=ext"></script>
```

## Install

1. *Templates → Tag Templates → Search Gallery* → "Consentl" → **Add to workspace**.
2. Create the tag: *Tags → New → Tag configuration → Consentl Cookie Consent (Consent Mode v2)*.
   - **Site key:** from your site's **Setup** page in the Consentl dashboard.
   - **Banner language:** optional, for example `{{Page Language}}`.
   - **Load the Consentl banner from this tag:** untick it if the snippet is already in `<head>`
     (with `&gcm=ext`).
   - **Consent Mode defaults:** one row per group of regions, mirroring your region rules in the
     dashboard, **including the rule for all other regions**. Use ISO 3166 codes (US states are
     written `US-CA`). The shortcuts `EU` (the 27 member states), `EEA` (the EU plus Iceland,
     Liechtenstein and Norway) and `UK` (the same as `GB`) work too. Example: `EEA, GB, CH` all
     denied, plus a row with an empty region for the rest of the world. With no rows, everything is
     denied everywhere, which is the safest choice.
3. **Triggering:** **Consent Initialization – All Pages**. This is the only trigger that runs
   before every other tag.
4. In *Admin → Container settings*, enable **Consent overview**, and make sure every tag has the
   right built-in consent checks or *Additional consent* settings (for example `ad_storage` for
   Meta, TikTok and other advertising pixels).
5. **Preview** (Tag Assistant) → *Consent* tab: you should see defaults on Consent Initialization
   (once) and an update after accepting.
6. **Submit / Publish**.

## Events you can trigger tags on

| Event | When |
|-------|------|
| `consentl_consent` | On **every page view** once the visitor's region is known, and after every choice |
| `consentl_update` | Only when the visitor makes or changes a choice |

Both carry `consentl.preferences`, `consentl.analytics`, `consentl.marketing`, `consentl.sale`,
`consentl.stored` (the visitor has decided) and `consentl.region`.

## How categories map to Consent Mode

| Consentl | Consent Mode |
|----------|--------------|
| marketing | `ad_storage`, `ad_user_data` |
| marketing + sale | `ad_personalization` |
| analytics | `analytics_storage` |
| preferences | `functionality_storage`, `personalization_storage` |
| always | `security_storage` = granted |

## Permissions

| Permission | Why |
|------------|-----|
| Accesses consent state | Writes the consent types and `wait_for_update` |
| Injects scripts | `https://api.consentl.com/v1/*` (the banner loader) |
| Accesses global variables | Calls `Consentl.on`, `Consentl.get`, `Consentl.region`, `Consentl.stored`; reads `Consentl.version`, `consentl.c.gcm.plan` (your plan) and `consentl.c.gcm.on` (the Consent Mode switch) |
| Writes to the data layer | `ads_data_redaction`, `url_passthrough` |
| Logs to console | Debug mode only |

## Data collection

The template itself sends no data. The Consentl banner it loads works as follows. Consentl
(STL Embeded Creations) processes this data on behalf of the site owner, who is the controller.

- **Requests on every page view** to `api.consentl.com`: the banner script (`/v1/loader.js`), its
  interface (`/v1/ui.js`, when the banner or the preferences are shown) and the region lookup
  (`/api/geo`). As with any web request, they carry the visitor's IP address and browser user agent.
  The cookie list in the preferences dialog (`/api/cookies`) and the embeds (`/v1/blocks.js`,
  `/v1/texts`) are loaded when used.
- **Consent record**, sent with every decision as the proof of consent the GDPR requires: a random
  consent ID (also kept in the first-party `consentl` cookie), the action, the four choices, the
  region code (when known), the language, the consent revision, the page path (no query string),
  the website host name, whether a Global Privacy Control signal was sent and, during an A/B test,
  the banner variant. The server adds the date and time, the IP address shortened to its network part
  (IPv4 /24, IPv6 /48) and the browser user agent (up to 400 characters).
- **Banner view count:** when the banner is first shown, an anonymous count with the same fields but
  no consent ID.
- **Storage on the visitor's device:** the `consentl` cookie (the choice), `consentl_r` in session
  storage (the region for the visit) and, during an A/B test, `consentl_ab` in session storage
  (written with the first decision).
- **Retention:** consent records are kept for 425 days on Free and Pro, 730 days on Business and
  1,825 days on Enterprise, and never less than the consent lifetime plus 30 days.
- Privacy policy: <https://consentl.com/legal/privacy>.

## Limitations

- When the banner is loaded by GTM, scripts hard-coded in the page run before it. Put the snippet
  first in `<head>` for strict prior blocking.
- Consentl is not a Google-certified CMP for IAB TCF and does not implement TCF.

## Support

Questions and problems: <https://consentl.com/support> or support@consentl.com. Issues in this
repository are welcome too.

## License

[Apache License 2.0](LICENSE).
