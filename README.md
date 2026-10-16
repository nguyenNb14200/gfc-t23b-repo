# gfc-t23b

Benign test fixtures for an **authorized** Avisi Atlassian-Marketplace bug-bounty check
(Git for Confluence, OpenAPI render / "absolutify" `$ref` resolution). No payloads, no exploit —
just an OpenAPI spec with one relative `$ref` (control) and two external `$ref`s that point at a
researcher-owned Burp Collaborator listener, to observe whether the vendor backend resolves them.

## Commit instructions
1. Create a **public** repo on **github.com** under your account.
2. Put `root.json` and `child.json` at the **repo root** (same directory — the relative
   `$ref: ./child.json` must resolve to a sibling).
3. Push to `main`.
4. Send back the **blob URL** of root.json, e.g.
   `https://github.com/<you>/<repo>/blob/main/root.json`

## Files
- `root.json`  — OpenAPI 3.0.3 spec. `components.schemas`:
  - `RelControl` → `./child.json`                                   (relative control)
  - `ExtHTTP`    → `http://<collaborator>/gfc-t23b-ext-http.json`   (server-side fetch over http?)
  - `ExtHTTPS`   → `https://<collaborator>/gfc-t23b-ext-https.json` (server-side fetch over https?)
- `child.json` — trivial schema carrying the marker `GFC_T23B_REL_OK`.
