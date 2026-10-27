___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Consentl Cookie Consent (Consent Mode v2)",
  "categories": [
    "TAG_MANAGEMENT",
    "UTILITY"
  ],
  "brand": {
    "id": "github.com_STL-Embeded-Creations",
    "displayName": "Consentl",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAABjUlEQVR42u3cwU3DQBCG0WnBNzpIAzSbuiiIKNdISAFh/7M7z5LPwPfikHW8U/VPx/Fx+550VvKYFrsFisBBDEFDCCIGIYQLIggWRBAqjCBSEECgIIIwYQRRAMwFECSMIAYAAE4AMwFW/yOex9IIq0T+6wEgEH0ljNo9eneMmhi/E0JNDN8JoiaH7wBR4mcRSvwsQomfRSjxswi1SvzEz90CoEOE0W9BnV594/4Jd7z0R60DOn/867IaronxX3/H7W5F7HbPHgCA8wDGfy8sPgAAuy92xgB49S8C0DHE59cdQCL6TyeAYPwrEUYCvBP/KgQAAACM+gj6m/hXILgCvAUBAADAOsBK2ErYvSB3Q30fAMBVAAAABM8FAQDg2VDPhno62v4A+wPskLFHzB4xuyTtE7ZP2E55syLMijAtxbwg84JMzDIzbo/wpiaammhu6GFybgOA1edHr/yFjunpAAAAAAAAQjo+AAAAIITjQ2gQH0ADAAjh+BAaxIfQID6IBuEhNIkPo0F0KOfEfgAFWaUaWf1gugAAAABJRU5ErkJggg=="
  },
  "description": "Consentl cookie banner with Google Consent Mode v2: sets regional consent defaults, loads the Consentl banner and forwards the visitor's choices to Google tags. Consent Mode is included on every Consentl plan. Fire on Consent Initialization - All Pages.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "siteKey",
    "displayName": "Site key",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "help": "Consentl dashboard → your site → Setup. Looks like sk_ followed by 24 lower-case letters and digits 2-7. The key is public, not a secret.",
    "valueHint": "sk_xxxxxxxxxxxxxxxxxxxxxxxx",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "REGEX",
        "args": [
          "^sk_[a-z2-7]{24}$"
        ],
        "errorMessage": "Enter the site key from your site's Setup page in the Consentl dashboard (sk_ + 24 lower-case letters and digits 2-7)."
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "language",
    "displayName": "Banner language",
    "simpleValueType": true,
    "help": "Optional. Language code such as en, de, fr, pt-PT. Use a variable for multilingual sites (for example a Data Layer or JavaScript variable that returns document.documentElement.lang). Empty = the site's default language.",
    "valueHint": "en"
  },
  {
    "type": "CHECKBOX",
    "name": "loadBanner",
    "checkboxText": "Load the Consentl banner from this tag",
    "simpleValueType": true,
    "defaultValue": true,
    "help": "Untick when the Consentl snippet is already the first script in the page's &lt;head&gt; (recommended setup: it also holds back non-Google trackers). Add &amp;gcm=ext to the snippet's URL so that only this tag sends Consent Mode commands. This tag then sets the Consent Mode defaults and forwards the visitor's choices to Google tags."
  },
  {
    "type": "GROUP",
    "name": "defaultsGroup",
    "displayName": "Consent Mode defaults",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "LABEL",
        "name": "defaultsLabel",
        "displayName": "Default state before the visitor decides. Mirror the region rules configured in the Consentl dashboard, including the rule for all other regions. Regions are ISO 3166-1 / 3166-2 codes separated by commas (e.g. AT, DE, GB, US-CA); EU (the 27 member states), EEA (EU plus Iceland, Liechtenstein and Norway) and UK (= GB) are accepted as shortcuts. Leave Region empty for the row that applies everywhere else. Without any row, everything is denied everywhere. Consent Mode updates need Google Consent Mode switched on in the Consentl dashboard (every plan); while it is off, Google tags keep these defaults."
      },
      {
        "type": "PARAM_TABLE",
        "name": "regionDefaults",
        "displayName": "",
        "paramTableColumns": [
          {
            "param": {
              "type": "TEXT",
              "name": "region",
              "displayName": "Region (empty = all other regions)",
              "simpleValueType": true,
              "valueValidators": [
                {
                  "type": "REGEX",
                  "args": [
                    "^\\s*(([A-Za-z]{2}(-[A-Za-z0-9]{1,3})?|[Ee][Ee][Aa])(\\s*,\\s*([A-Za-z]{2}(-[A-Za-z0-9]{1,3})?|[Ee][Ee][Aa]))*)?\\s*$"
                  ],
                  "errorMessage": "Use ISO 3166 codes separated by commas, for example AT, DE, US-CA, or EU, EEA, UK."
                }
              ]
            },
            "isUnique": true
          },
          {
            "param": {
              "type": "SELECT",
              "name": "analytics",
              "displayName": "Analytics (analytics_storage)",
              "macrosInSelect": false,
              "selectItems": [
                {
                  "value": "denied",
                  "displayValue": "denied"
                },
                {
                  "value": "granted",
                  "displayValue": "granted"
                }
              ],
              "simpleValueType": true,
              "defaultValue": "denied"
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "SELECT",
              "name": "marketing",
              "displayName": "Marketing (ad_storage, ad_user_data, ad_personalization)",
              "macrosInSelect": false,
              "selectItems": [
                {
                  "value": "denied",
                  "displayValue": "denied"
                },
                {
                  "value": "granted",
                  "displayValue": "granted"
                }
              ],
              "simpleValueType": true,
              "defaultValue": "denied"
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "SELECT",
              "name": "preferences",
              "displayName": "Preferences (functionality_storage, personalization_storage)",
              "macrosInSelect": false,
              "selectItems": [
                {
                  "value": "denied",
                  "displayValue": "denied"
                },
                {
                  "value": "granted",
                  "displayValue": "granted"
                }
              ],
              "simpleValueType": true,
              "defaultValue": "denied"
            },
            "isUnique": false
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "waitForUpdate",
        "displayName": "Wait for update",
        "simpleValueType": true,
        "defaultValue": 500,
        "valueUnit": "milliseconds",
        "help": "How long Google tags wait for the visitor's stored choice before using the defaults.",
        "valueValidators": [
          {
            "type": "NON_NEGATIVE_NUMBER"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "advancedGroup",
    "displayName": "Advanced",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "adsDataRedaction",
        "checkboxText": "Redact ads data while ad_storage is denied (ads_data_redaction)",
        "simpleValueType": true,
        "defaultValue": true
      },
      {
        "type": "CHECKBOX",
        "name": "urlPassthrough",
        "checkboxText": "Pass ad click information through URLs (url_passthrough)",
        "simpleValueType": true,
        "defaultValue": false
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Consentl Cookie Consent - Google Tag Manager template (Consent Mode v2).
// Copyright STL Embeded Creations. Licensed under the Apache License, Version 2.0.
// Mapping identical to the Consentl runtime (packages/banner/src/gcm.ts).
//
// This tag owns Consent Mode: it sets the defaults on Consent Initialization and forwards the
// visitor's choices. It loads the banner with `gcm=ext`, so the Consentl runtime sends no Consent
// Mode commands of its own (with the snippet in the page, add `&gcm=ext` to its URL).
// Plan and dashboard switch (D-069, D-156), read from the loader bootstrap once it has run:
// - Consent Mode switched on (every plan): defaults, then the visitor's choices;
// - plan with Consent Mode, switched off by the merchant: no Consent Mode commands at all, so with
//   the snippet first Google tags have no consent state unless the site sets defaults itself (the
//   merchant's choice, D-200); when this tag loads the banner the defaults were already set and
//   Google tags keep them;
// - plan without Consent Mode (Free): the defaults below (fail closed), never an update.
// Until the loader has run the plan is unknown: the defaults are set anyway (fail closed).
// Stored choices come from the runtime, never from the cookie: the runtime has already checked the
// consent revision ("reset all consents"), the expiry, implied decisions and GPC (WEB-06).

const setDefaultConsentState = require('setDefaultConsentState');
const updateConsentState = require('updateConsentState');
const callInWindow = require('callInWindow');
const copyFromWindow = require('copyFromWindow');
const injectScript = require('injectScript');
const gtagSet = require('gtagSet');
const encodeUriComponent = require('encodeUriComponent');
const makeNumber = require('makeNumber');
const makeString = require('makeString');
const queryPermission = require('queryPermission');
const logToConsole = require('logToConsole');

const LOADER = 'https://api.consentl.com/v1/loader.js';
const G = 'granted';
const D = 'denied';
// Region aliases: EU = the 27 member states, EEA = EU + IS, LI, NO, UK = GB (ISO 3166-1).
const EU = ['AT', 'BE', 'BG', 'CY', 'CZ', 'DE', 'DK', 'EE', 'ES', 'FI', 'FR', 'GR', 'HR', 'HU', 'IE', 'IT', 'LT', 'LU', 'LV', 'MT', 'NL', 'PL', 'PT', 'RO', 'SE', 'SI', 'SK'];

// Consentl categories -> Google Consent Mode v2 consent types.
const gcmState = (c) => {
  const m = c.marketing ? G : D;
  const p = c.preferences ? G : D;
  return {
    ad_storage: m,
    ad_user_data: m,
    ad_personalization: c.marketing && c.sale ? G : D,
    analytics_storage: c.analytics ? G : D,
    functionality_storage: p,
    personalization_storage: p,
    security_storage: G
  };
};

const splitRegions = (value) => {
  const out = [];
  const add = (t) => {
    if (out.indexOf(t) < 0) out.push(t);
  };
  makeString(value || '').split(',').forEach((r) => {
    const t = r.trim().toUpperCase();
    if (t === 'EU' || t === 'EEA') {
      EU.forEach(add);
      if (t === 'EEA') ['IS', 'LI', 'NO'].forEach(add);
    } else if (t === 'UK' || t.indexOf('UK-') === 0) {
      add('GB' + t.slice(2));
    } else if (t) {
      add(t);
    }
  });
  return out;
};

// The Consentl runtime is on the page (snippet in <head>, or the loader injected below has run).
const runtimeLoaded = () => !!copyFromWindow('Consentl.version');
// `gcm.on`: Consent Mode is in the plan AND switched on in the dashboard. `gcm.plan`: it is in the
// plan (every plan since D-389), whatever the switch says. Bootstraps published before `gcm.plan` existed
// only carry `gcm.on`: a site without it then counts as a plan without Consent Mode.
const gcmOn = () => copyFromWindow('consentl.c.gcm.on') === true;
const planHasGcm = () => gcmOn() || copyFromWindow('consentl.c.gcm.plan') === true;
// 'on': defaults and updates; 'off': switched off by the merchant; 'free': plan without Consent Mode.
const gcmMode = () => (gcmOn() ? 'on' : planHasGcm() ? 'off' : 'free');

const onConsent = (choices) => {
  if (choices && gcmOn()) updateConsentState(gcmState(choices));
};

const setDefaults = () => {
  const wait = makeNumber(data.waitForUpdate);
  const rows = data.regionDefaults || [];
  let hasGlobal = false;
  rows.forEach((row) => {
    const regions = splitRegions(row.region);
    const state = gcmState({
      analytics: row.analytics === G,
      marketing: row.marketing === G,
      preferences: row.preferences === G,
      sale: row.marketing === G
    });
    if (wait > 0) state.wait_for_update = wait;
    if (regions.length) state.region = regions;
    else hasGlobal = true;
    setDefaultConsentState(state);
  });
  if (!hasGlobal) {
    const strict = gcmState({ analytics: false, marketing: false, preferences: false, sale: false });
    if (wait > 0) strict.wait_for_update = wait;
    setDefaultConsentState(strict);
  }
  if (data.adsDataRedaction) gtagSet({ ads_data_redaction: true });
  if (data.urlPassthrough) gtagSet({ url_passthrough: true });
};

const NO_PLAN = 'Consentl: the banner configuration of this site does not include Google Consent Mode yet. This tag sets the Consent Mode defaults and sends no updates: Google tags keep the defaults, also after the visitor accepts. Save the Regions & laws page in the Consentl dashboard once, or fire those tags on the consentl_update event.';
const OFF = 'Consentl: Google Consent Mode is switched off for this site in the Consentl dashboard (Regions > Google Consent Mode v2). This tag forwards no choices to Google tags. When the snippet runs first it also sets no defaults: Google tags in this container then run without any consent state (Google treats that as granted) unless you set Consent Mode defaults yourself. Switch it on to use this tag.';

// 1. Defaults (Consent Initialization trigger: before any other tag). With the runtime already on
// the page the plan is known: defaults unless the merchant switched Consent Mode off. On Free they
// are the only Consent Mode state Google tags get (fail closed, WEB-37). Otherwise fail closed.
const loadedFirst = runtimeLoaded();
if (!loadedFirst || gcmMode() !== 'off') setDefaults();

// 2. Forward the visitor's choices. "change" fires on every page view once the region is known
// and on every decision; a decision the runtime already accepted is applied at once.
const subscribe = () => {
  if (!runtimeLoaded()) {
    logToConsole('Consentl: the banner did not start (unknown site key, banner switched off or in test mode).');
    return false;
  }
  const mode = gcmMode();
  if (mode !== 'on') {
    logToConsole(mode === 'off' ? OFF : NO_PLAN);
    return true;
  }
  callInWindow('Consentl.on', 'change', onConsent);
  const stored = callInWindow('Consentl.stored');
  if (callInWindow('Consentl.region') || (stored && stored.a !== 'implied')) onConsent(callInWindow('Consentl.get'));
  return true;
};

if (loadedFirst) {
  subscribe();
  data.gtmOnSuccess();
} else if (data.loadBanner) {
  let url = LOADER + '?k=' + encodeUriComponent(makeString(data.siteKey)) + '&gcm=ext';
  if (data.language) url = url + '&l=' + encodeUriComponent(makeString(data.language));
  if (queryPermission('inject_script', url)) {
    injectScript(url, () => {
      if (subscribe()) data.gtmOnSuccess();
      else data.gtmOnFailure();
    }, () => {
      logToConsole('Consentl: the banner could not be loaded');
      data.gtmOnFailure();
    }, 'consentl-loader');
  } else {
    data.gtmOnFailure();
  }
} else {
  // "Load the banner" is unticked, but the snippet has not run before this tag.
  logToConsole('Consentl: the Consentl snippet must be the first script in <head> when this tag does not load the banner.');
  data.gtmOnFailure();
}

___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_consent",
        "versionId": "1"
      },
      "param": [
        {
          "key": "consentTypes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_user_data"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_personalization"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "analytics_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "functionality_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "personalization_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "security_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "wait_for_update"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://api.consentl.com/v1/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "Consentl.on"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "Consentl.get"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "Consentl.region"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "Consentl.stored"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "Consentl.version"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "consentl.c.gcm.on"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "consentl.c.gcm.plan"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "write_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "ads_data_redaction"
              },
              {
                "type": 1,
                "string": "url_passthrough"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Sets strict global defaults when no region rows are configured
  code: |-
    runCode(mockData);
    assertApi('setDefaultConsentState').wasCalledWith({
      ad_storage: 'denied', ad_user_data: 'denied', ad_personalization: 'denied',
      analytics_storage: 'denied', functionality_storage: 'denied', personalization_storage: 'denied',
      security_storage: 'granted', wait_for_update: 500
    });
    assertApi('injectScript').wasCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: Regional rows set region-specific defaults
  code: |-
    mockData.regionDefaults = [
      {region: 'at, DE', analytics: 'denied', marketing: 'denied', preferences: 'denied'},
      {region: '', analytics: 'granted', marketing: 'granted', preferences: 'granted'}
    ];
    runCode(mockData);
    assertApi('setDefaultConsentState').wasCalledWith({
      ad_storage: 'denied', ad_user_data: 'denied', ad_personalization: 'denied',
      analytics_storage: 'denied', functionality_storage: 'denied', personalization_storage: 'denied',
      security_storage: 'granted', wait_for_update: 500, region: ['AT', 'DE']
    });
    assertApi('setDefaultConsentState').wasCalledWith({
      ad_storage: 'granted', ad_user_data: 'granted', ad_personalization: 'granted',
      analytics_storage: 'granted', functionality_storage: 'granted', personalization_storage: 'granted',
      security_storage: 'granted', wait_for_update: 500
    });
- name: An empty wait for update is left out
  code: |-
    mockData.waitForUpdate = '';
    runCode(mockData);
    assertApi('setDefaultConsentState').wasCalledWith({
      ad_storage: 'denied', ad_user_data: 'denied', ad_personalization: 'denied',
      analytics_storage: 'denied', functionality_storage: 'denied', personalization_storage: 'denied',
      security_storage: 'granted'
    });
- name: Snippet first on a plan without Consent Mode (Free) - fail-closed defaults, no updates
  code: |-
    win['Consentl.version'] = '0.1.0';
    win['consentl.c.gcm.on'] = false;
    win['consentl.c.gcm.plan'] = false;
    mockData.loadBanner = false;
    mock('callInWindow', (path) => path === 'Consentl.get' ? {preferences: true, analytics: true, marketing: true, sale: true} : {});
    runCode(mockData);
    assertApi('setDefaultConsentState').wasCalledWith({
      ad_storage: 'denied', ad_user_data: 'denied', ad_personalization: 'denied',
      analytics_storage: 'denied', functionality_storage: 'denied', personalization_storage: 'denied',
      security_storage: 'granted', wait_for_update: 500
    });
    assertApi('updateConsentState').wasNotCalled();
    assertApi('injectScript').wasNotCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: Snippet first, Consent Mode switched off in the dashboard - no Consent Mode commands at all
  code: |-
    win['Consentl.version'] = '0.1.0';
    win['consentl.c.gcm.on'] = false;
    win['consentl.c.gcm.plan'] = true;
    mockData.loadBanner = false;
    mock('callInWindow', (path) => path === 'Consentl.get' ? {preferences: true, analytics: true, marketing: true, sale: true} : {});
    runCode(mockData);
    assertApi('setDefaultConsentState').wasNotCalled();
    assertApi('updateConsentState').wasNotCalled();
    assertApi('gtagSet').wasNotCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: EU, EEA and UK are expanded to ISO 3166-1 codes
  code: |-
    mockData.regionDefaults = [
      {region: 'eu, UK, uk-sct', analytics: 'denied', marketing: 'denied', preferences: 'denied'},
      {region: 'EEA, CH', analytics: 'denied', marketing: 'denied', preferences: 'granted'}
    ];
    runCode(mockData);
    const eu = ['AT', 'BE', 'BG', 'CY', 'CZ', 'DE', 'DK', 'EE', 'ES', 'FI', 'FR', 'GR', 'HR', 'HU', 'IE', 'IT', 'LT', 'LU', 'LV', 'MT', 'NL', 'PL', 'PT', 'RO', 'SE', 'SI', 'SK'];
    assertApi('setDefaultConsentState').wasCalledWith({
      ad_storage: 'denied', ad_user_data: 'denied', ad_personalization: 'denied',
      analytics_storage: 'denied', functionality_storage: 'denied', personalization_storage: 'denied',
      security_storage: 'granted', wait_for_update: 500, region: eu.concat(['GB', 'GB-SCT'])
    });
    assertApi('setDefaultConsentState').wasCalledWith({
      ad_storage: 'denied', ad_user_data: 'denied', ad_personalization: 'denied',
      analytics_storage: 'denied', functionality_storage: 'granted', personalization_storage: 'granted',
      security_storage: 'granted', wait_for_update: 500, region: eu.concat(['IS', 'LI', 'NO', 'CH'])
    });
- name: Snippet first - a decision the runtime accepted is applied at once
  code: |-
    win['Consentl.version'] = '0.1.0';
    win['consentl.c.gcm.on'] = true;
    mockData.loadBanner = false;
    mock('callInWindow', (path) => {
      if (path === 'Consentl.stored') return {a: 'custom'};
      if (path === 'Consentl.get') return {preferences: false, analytics: true, marketing: false, sale: false};
      return undefined;
    });
    runCode(mockData);
    assertApi('setDefaultConsentState').wasCalled();
    assertApi('updateConsentState').wasCalledWith({
      ad_storage: 'denied', ad_user_data: 'denied', ad_personalization: 'denied',
      analytics_storage: 'granted', functionality_storage: 'denied', personalization_storage: 'denied',
      security_storage: 'granted'
    });
- name: Snippet first - nothing is granted when the runtime rejected the stored cookie (old revision, expired, unknown action)
  code: |-
    win['Consentl.version'] = '0.1.0';
    win['consentl.c.gcm.on'] = true;
    mockData.loadBanner = false;
    mock('callInWindow', (path) => path === 'Consentl.get' ? {preferences: true, analytics: true, marketing: true, sale: true} : null);
    runCode(mockData);
    assertApi('updateConsentState').wasNotCalled();
- name: Snippet first - an implied decision waits for the region
  code: |-
    win['Consentl.version'] = '0.1.0';
    win['consentl.c.gcm.on'] = true;
    mockData.loadBanner = false;
    mock('callInWindow', (path) => {
      if (path === 'Consentl.stored') return {a: 'implied'};
      if (path === 'Consentl.get') return {preferences: true, analytics: true, marketing: true, sale: true};
      return null;
    });
    runCode(mockData);
    assertApi('updateConsentState').wasNotCalled();
- name: Forwards Consentl change events after the loader ran
  code: |-
    let listener;
    mock('injectScript', (url, onSuccess) => {
      win['Consentl.version'] = '0.1.0';
      win['consentl.c.gcm.on'] = true;
      onSuccess();
    });
    mock('callInWindow', function (path, ev, fn) {
      if (path === 'Consentl.on' && ev === 'change') listener = fn;
      return undefined;
    });
    runCode(mockData);
    listener({preferences: true, analytics: true, marketing: true, sale: true});
    assertApi('updateConsentState').wasCalledWith({
      ad_storage: 'granted', ad_user_data: 'granted', ad_personalization: 'granted',
      analytics_storage: 'granted', functionality_storage: 'granted', personalization_storage: 'granted',
      security_storage: 'granted'
    });
    assertApi('gtmOnSuccess').wasCalled();
- name: Loaded by the tag on a plan without Consent Mode - defaults stay, no updates
  code: |-
    let subscribed = false;
    mock('injectScript', (url, onSuccess) => {
      win['Consentl.version'] = '0.1.0';
      win['consentl.c.gcm.on'] = false;
      onSuccess();
    });
    mock('callInWindow', (path) => {
      if (path === 'Consentl.on') subscribed = true;
      return {preferences: true, analytics: true, marketing: true, sale: true};
    });
    runCode(mockData);
    assertApi('setDefaultConsentState').wasCalled();
    assertApi('updateConsentState').wasNotCalled();
    assertThat(subscribed).isEqualTo(false);
    assertApi('gtmOnSuccess').wasCalled();
- name: Loaded by the tag, Consent Mode switched off in the dashboard - defaults stay, no updates
  code: |-
    let subscribed = false;
    mock('injectScript', (url, onSuccess) => {
      win['Consentl.version'] = '0.1.0';
      win['consentl.c.gcm.on'] = false;
      win['consentl.c.gcm.plan'] = true;
      onSuccess();
    });
    mock('callInWindow', (path) => {
      if (path === 'Consentl.on') subscribed = true;
      return {preferences: true, analytics: true, marketing: true, sale: true};
    });
    runCode(mockData);
    assertApi('setDefaultConsentState').wasCalled();
    assertApi('updateConsentState').wasNotCalled();
    assertThat(subscribed).isEqualTo(false);
    assertApi('gtmOnSuccess').wasCalled();
- name: An unknown site key fails the tag
  code: |-
    mock('injectScript', (url, onSuccess) => onSuccess());
    runCode(mockData);
    assertApi('gtmOnFailure').wasCalled();
    assertApi('gtmOnSuccess').wasNotCalled();
- name: Fails when the loader may not be injected
  code: |-
    mock('queryPermission', () => false);
    runCode(mockData);
    assertApi('injectScript').wasNotCalled();
    assertApi('gtmOnFailure').wasCalled();
- name: Does not inject the loader when the snippet is already on the page
  code: |-
    win['Consentl.version'] = '0.1.0';
    win['consentl.c.gcm.on'] = true;
    mockData.loadBanner = false;
    runCode(mockData);
    assertApi('injectScript').wasNotCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: Fails when the banner is not loaded by the tag and the snippet has not run
  code: |-
    mockData.loadBanner = false;
    runCode(mockData);
    assertApi('setDefaultConsentState').wasCalled();
    assertApi('gtmOnFailure').wasCalled();
setup: |-
  const mockData = {
    siteKey: 'sk_abcdefghijklmnopqrstuvwx',
    language: 'de',
    loadBanner: true,
    regionDefaults: [],
    waitForUpdate: 500,
    adsDataRedaction: true,
    urlPassthrough: false
  };
  const win = {};
  mock('copyFromWindow', (key) => win[key]);
  mock('queryPermission', () => true);
  mock('injectScript', (url, onSuccess) => {
    win['Consentl.version'] = '0.1.0';
    win['consentl.c.gcm.on'] = true;
    onSuccess();
  });


___NOTES___

Consentl GTM template v1. Source: https://github.com/IonutGoron/consentl (integrations/web/gtm).
