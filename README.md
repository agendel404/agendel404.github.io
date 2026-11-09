# Andrew Gendel: portfolio

Live at **https://agendel404.github.io** (repository `agendel404/agendeldesign.com`).

Portfolio site for Andrew Gendel. Plain HTML, CSS and ~4 KB of JavaScript, published with GitHub Pages.
You never run a build: push to `main` and GitHub publishes the site in about a minute.

---

## Where to edit things

| To change… | Edit this file |
|---|---|
| Opener headline and line breaks, intro, bio, location, email, LinkedIn, resume link, "Let's talk" text | `_data/profile.yml` |
| Opener photo | add `assets/img/hero.jpg` (see "Opener image" below) |
| "Where I've worked" statement and company columns (years, role, summary) | `_data/workplaces.yml` |
| Featured writing and talks (hidden while empty) | `_data/writing.yml` |
| A case study | `_case_studies/<slug>.md` |
| Resume | replace `assets/resume/andrew-gendel-resume.pdf` (keep the file name) |
| Colors, fonts, spacing | `assets/css/tokens.css` |
| Layout | `_layouts/`, `_includes/`, `assets/css/main.css` (rarely needed) |

## Case studies

Each case study is one Markdown file in `_case_studies/`. The file name becomes the URL:
`helios-adoption.md` → `agendeldesign.com/work/helios-adoption/`.

The block between the `---` lines at the top fills the opener (title, Role/Team/Timeline/Disciplines), the outcome strip, and the home page card:

```yaml
title: Growing Helios adoption from 65% to 92%
summary: One or two sentences. Shown on the card and under the title.
tags: [Design systems, Adoption]       # chips on the card
role: Product designer, Design Systems
team: The Helios team
timeline: 2023–2025
featured: true                          # show on the home page
order: 3                                # position on the home page
metrics:                                # outcome strip: 2–4 results; the first one shows on the card
  - { value: "92%", label: "Helios adoption, up from 65%" }
cover: /assets/img/helios-adoption/cover.svg
cover_alt: "Describe what the image shows"
cover_width: 1200                       # the image's real size in pixels
cover_height: 750
cover_panel: true                       # put diagrams on the paper panel
# hero: /assets/img/helios-adoption/hero.jpg  # optional opener photo; otherwise the cover diagram is used
# og_image: /assets/img/og/helios-adoption.jpg  # optional; this is the default
# thumb_video: /assets/video/helios-adoption/loop.webm       # optional
# thumb_video_mp4: /assets/video/helios-adoption/loop.mp4    # optional fallback
```

Below that, write normal Markdown with these `##` sections, in order:
Context, Problem, Role, Decisions, System and approach, Evidence, Results and adoption, What went wrong, What I'd do next.
The "On this page" list and section numbers build themselves from your `##` headings.

### Building blocks you can paste into a case study

```liquid
{% include figure.html src="/assets/img/slug/diagram.svg" alt="What it shows" width="1200" height="675" caption="Optional caption" panel="true" wide="true" %}

{% include before-after.html before="/assets/img/slug/before.png" before_alt="…" after="/assets/img/slug/after.png" after_alt="…" width="1200" height="800" caption="…" %}

{% include decision.html title="Where to fix off-system output" options="Option A|Option B|Option C" chosen="Option C" why="Why it won." rejected="Option A: why not|Option B: why not" %}

{% include quote.html text="A line worth pulling out." cite="Name, role" %}

{% include callout.html title="Why it mattered" text="One or two sentences." %}

{% include video.html src="/assets/video/slug/clip.webm" mp4="/assets/video/slug/clip.mp4" poster="/assets/img/slug/clip.jpg" width="1280" height="800" alt="What the clip shows" caption="…" %}

{% include metrics.html %}

{% include todo.html note="TODO (Roblox review): what to check" %}
```

- **Alt text is required.** If you leave it out, the page shows a yellow "Missing alt text" box. Use `alt=""` only for purely decorative images.
- **TODO notes** (`todo.html`) show as yellow boxes and **block publishing** until you delete them. Notes inside `{% comment %}` are never published and don't block.
- **`[X]` gaps** publish as written; the check only warns about them.
- **Figure not ready?** `{% include figure.html slot="What it will show" %}` leaves an empty, labeled slot.
- **Videos never autoplay.** They play while hovered or focused, and always show a Play/Pause button.

### Adding a new case study

1. Copy an existing file in `_case_studies/` and rename it (e.g. `feedback-to-pull-requests.md`).
2. Make an image folder: `assets/img/feedback-to-pull-requests/`.
3. Edit the front matter and text. Set `featured: true` and an `order` to show it on the home page.
   The home page shows every featured case study, so set `featured: false` on one if you want to keep it to three.

## Opener image

The home opener shows `assets/img/hero.jpg` behind a dark scrim and film grain; until that file exists, a cool
ink gradient shows instead. The scrim keeps white text readable (WCAG AA) over any photo, even a white one.

For fast loading, also add resized copies next to it. When `hero-1600.jpg` exists, the site serves the right size automatically:

| File | Width | Notes |
|---|---|---|
| `hero-800.jpg`, `hero-1600.jpg`, `hero-2400.jpg` | 800 / 1600 / 2400 px | JPG quality ~72 (required for the responsive set) |
| `hero-800.webp`, `hero-1600.webp`, `hero-2400.webp` | same | optional |
| `hero-800.avif`, `hero-1600.avif`, `hero-2400.avif` | same | optional, smallest |

squoosh.app can make all of these in the browser. Use your own photo; the image is decorative, so it needs no alt text.

## Social preview images

`assets/img/og/` holds the 1200×630 images LinkedIn, Slack and others show when someone shares a link:
`home.jpg` for the home page and `<slug>.jpg` for each case study. They're screenshots of each page's opener.
Replace them whenever you change a title or add a hero photo.

## Images and video

No tools run on the server, so optimize images when you export them:

- **Diagrams:** SVG (best) or PNG. Export at 2× (e.g. 2400×1500 for a 1200×750 slot). Keep text in diagrams large.
- **Screenshots and photos:** export 2000 px wide. Save a `.jpg` (quality ~75) and, if you can, an `.avif` copy
  (use squoosh.app in the browser). Pass the AVIF with `avif="/path.avif"` and the JPG as `src`.
- **Target:** under 250 KB per image.
- **Card videos:** 5–10 s, no audio, 1280 px wide, `.webm` + `.mp4`, under 1.5 MB. They only play while
  the card is hovered or focused, never with reduced motion, and show the cover image otherwise.
- **Roblox rule:** no internal screenshots, internal tool UI, or unreleased details. Redraw diagrams at a general level.

## Pre-publish check

`scripts/check.sh` fails if any of these are still in your content:

- `TODO` notes
- the placeholder LinkedIn URL (`YOUR-HANDLE`)
- the placeholder resume PDF

It runs automatically on GitHub before every deploy. **If it fails, the site is not published** and the
previous version stays live. To see why, open the repo's **Actions** tab, select the failed run, and expand "Pre-publish check".

Run it yourself any time:

```bash
bash scripts/check.sh
```

## Local preview (optional)

You don't need this to publish. To preview on your own computer, install Ruby (macOS: `brew install ruby`), then, once:

```bash
bundle install
```

Then each time:

```bash
bash scripts/preview.sh
```

Open http://localhost:4000. The preview runs the pre-publish check first. `[X]` gaps print a one-line warning
and publish as written. It **stops** for visible TODO boxes or placeholder files. To look at a draft anyway:

```bash
bash scripts/preview.sh --draft
```

---

## Publish on GitHub Pages

The site publishes free at `https://agendel404.github.io`. For that address, the repository must be named
`agendel404.github.io`, and **Settings → Pages → Source** must be **GitHub Actions**.

### Adding the custom domain later (optional)

When you buy `agendeldesign.com`:
1. Recreate a file named `CNAME` in the repo root containing `agendeldesign.com`.
2. Change `url:` in `_config.yml` to `"https://agendeldesign.com"`.
3. Follow steps 3–5 below (verify, DNS, connect). Old `github.io` links redirect automatically.


### 1. Put the site on GitHub

1. Create a new repository on github.com, for example `agendeldesign.com`. It can be public or private
   (private Pages sites need a paid GitHub plan).
2. Upload this folder. Either drag the files into the repo's **Add file → Upload files** page (include the hidden
   `.github` folder), or from a terminal in this folder:

```bash
git init -b main
git add .
git commit -m "Initial portfolio site"
git remote add origin https://github.com/YOUR-GITHUB-USERNAME/agendeldesign.com.git
git push -u origin main
```

### 2. Turn on Pages

1. In the repo: **Settings → Pages**.
2. Under **Build and deployment → Source**, choose **GitHub Actions**. Do not choose "Deploy from a branch":
   the workflow in `.github/workflows/deploy.yml` is what runs the pre-publish check.
3. Open the **Actions** tab. The "Deploy to GitHub Pages" run will **fail at the pre-publish check** until you clear the
   placeholders. That's expected.

### 3. Verify your domain (protects it from takeover)

1. Click your avatar → **Settings → Pages → Add a domain**, and enter `agendeldesign.com`.
2. GitHub shows a **TXT record**, something like `_github-pages-challenge-YOUR-USERNAME`. Add it at your domain registrar (step 4), wait a few minutes, then click **Verify**.

### 4. Point the domain at GitHub (at your registrar's DNS settings)

Delete any existing `A`, `AAAA` or `CNAME` records for `@` and `www` (for example, the registrar's parking page), then add:

| Type | Host / Name | Value |
|---|---|---|
| A | @ | 185.199.108.153 |
| A | @ | 185.199.109.153 |
| A | @ | 185.199.110.153 |
| A | @ | 185.199.111.153 |
| AAAA | @ | 2606:50c0:8000::153 |
| AAAA | @ | 2606:50c0:8001::153 |
| AAAA | @ | 2606:50c0:8002::153 |
| AAAA | @ | 2606:50c0:8003::153 |
| CNAME | www | YOUR-GITHUB-USERNAME.github.io |
| TXT | _github-pages-challenge-YOUR-USERNAME | (value GitHub gave you in step 3) |

DNS can take from a few minutes up to 24 hours to update.

### 5. Connect the domain to the repo

1. Repo **Settings → Pages → Custom domain**: enter `agendeldesign.com` and click **Save**.
   With the GitHub Actions source, this setting is what counts; the `CNAME` file is a backup.
2. Wait for the DNS check to show a green tick, then turn on **Enforce HTTPS**. The certificate can take up to an hour to appear.
3. `www.agendeldesign.com` will redirect to `agendeldesign.com` automatically.

### 6. Go live

1. Clear every item the check lists (`bash scripts/check.sh`), including replacing the resume PDF and your LinkedIn URL.
2. Push. The **Actions** tab shows the deploy, and the site is live at https://agendeldesign.com about a minute later.

### Troubleshooting

- **Site shows a 404 right after setup:** wait for the first successful Actions run, and check that Source is set to "GitHub Actions".
- **"Domain's DNS record could not be retrieved":** DNS hasn't updated yet. Check it with `dig agendeldesign.com +short`; it should list the four 185.199.x.153 addresses.
- **Enforce HTTPS is greyed out:** the certificate is still being issued. Wait up to an hour, then remove and re-add the custom domain if it's still stuck.

---

Fonts: Newsreader and Inter, self-hosted, SIL Open Font License (see `assets/fonts/`).
