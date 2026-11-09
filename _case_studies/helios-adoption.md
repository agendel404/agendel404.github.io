---
title: "Growing Helios adoption from 65% to 92%"
slug: helios-adoption
summary: "I helped build the Helios design system at HashiCorp, then drove adoption with a redesigned icon library, documentation, and enablement programs, taking adoption from 65% to 92%."
tags: [Design systems, Adoption, Accessibility, Documentation]
role: "Associate Product Designer to Product Designer II, Design Systems"
team: "Helios design systems team (designers, managers, and engineers) [X: confirm team size and breakdown]"
timeline: "2021 to 2026, HashiCorp (later IBM) [X: confirm dates for this work]"
disciplines: "Design systems, Documentation, Information architecture, Accessibility"
metrics:
  - value: "65% to 92%"
    label: "Helios adoption across HashiCorp product teams"
  - value: "12% to 78%"
    label: "Component reuse"
  - value: "5 min to 90 sec"
    label: "Time for designers to find the right icon"
  - value: "70% fewer"
    label: "Custom icon requests"
short_title: Helios adoption        # big title on the home page slide
company: HashiCorp
year: "2021–2026"
featured: true
order: 3
cover: /assets/img/helios-adoption/cover.svg
cover_alt: "Bar chart: Helios adoption grew from 65 percent to 92 percent."
cover_width: 1200
cover_height: 750
cover_panel: true

---

{% comment %}
TODO FOR ANDREW (remove this block when done; this comment is stripped from the built page):
1. Confirm dates, role, and team size. The old page said "May 2022 to Present" and "12-person team (3 designers, 3 managers, 7 engineers)", which adds to 13, and "Present" is out of date.
2. Fill every [X] below. Until then the [X] text shows on the live page.
3. Four old metrics were left out until you can say how each was measured: design review time 60% faster, feature delivery 35% faster, component bugs down 70%, task completion up 65%. If you can source them, add them to Results.
4. Add figures where marked FIGURE. Use your own redrawn or sanitized visuals.
{% endcomment %}

## Context

HashiCorp's products had grown up on separate teams, and it showed. Each team built its own UI patterns, which confused users and meant developers kept rebuilding the same components. The company needed one source of truth for foundations, components, and patterns across every customer-facing product.

Helios is that system. It is open source and built to meet WCAG 2.2 AA.

## Problem

Three problems fed each other:

- **Inconsistency.** The same interaction looked and behaved differently from product to product.
- **Duplicated work.** Teams rebuilt components instead of reusing them. Component reuse started at 12%.
- **Slow discovery.** Even small things took too long. Designers spent more than five minutes finding the right icon, which led to inconsistent usage and a steady flow of custom icon requests.

A system that nobody adopts doesn't fix any of this. So the work was never only to build components. It was also to make Helios the easiest path.

## My role

I worked across the foundations, the components, the icon library, the documentation, and the adoption programs. [X: which of these did you own end to end, and which did you contribute to with the team?]

## Decisions

### 1. Start with foundations, not components

Teams were diverging at the lowest level, so I started with what I think of as the invisible work: tokens, spacing, and color.

- **Semantic color tokens** such as `text-primary` and `surface-interactive`, which work in light and dark mode. Every combination meets the 4.5:1 contrast minimum.
- **A modular type scale** from 12px to 32px with a clear weight hierarchy.
- **An 8px spacing system** using named tokens such as `space-2`, `space-4`, and `space-8`, plus standard breakpoints.
- **Elevation and border patterns** that signal interactivity and separate content consistently.

Teams pick a name, not a number. That removes guesswork and means a theme change doesn't require touching every screen.

**What I decided against:** [X: what did you consider and reject (for example raw values, a different scale, components first), and why?]

{% include figure.html slot="tokens overview (color, type, spacing) in light and dark. Use a redrawn version." %}

### 2. Treat icon search as a naming and information architecture problem

Designers needed five minutes to find an icon. The shapes were only part of the problem, so I audited and redesigned the library, more than 200 icons:

- Standardized a 1.5px stroke weight at a 16px base size
- Unified corner radii and geometric proportions
- Cut the taxonomy from 12 categories to 6
- Added synonyms and use-case tags, so search matches how designers actually describe what they want

Icon discovery dropped from five minutes to about 90 seconds, and custom icon requests fell 70%. The library became the standard reference.

**What I decided against:** [X: what did you consider and reject (for example only redrawing icons, or leaving the categories alone)?]

{% include figure.html slot="before/after of the icon taxonomy and search." %}

### 3. Make adoption easy, not mandatory

Mandates create resistance, so I built the support around the work:

- **Specification pages** for 20+ components covering anatomy, props, usage guidelines, accessibility, and migration paths, plus templates so future components start from the same structure
- **Office hours** every two weeks to answer questions and gather feedback
- **Token Tuesdays**, workshops on semantic token usage with migration guides
- **Migration support**, with one-on-one help and before/after examples

Designer onboarding improved 30%, UI support tickets dropped 25%, and component reuse rose from 12% to 78%.

**What I decided against:** [X: what did you consider and reject (for example a mandate or deadline), and why?]

{% include figure.html slot="component specification template (anatomy, props, usage, accessibility, migration)." %}

## System and approach

Components were designed around real team pain points, not a generic checklist:

- **Advanced Table** for dense enterprise data: 48px rows (40px compact), subtle zebra striping and hover states, full keyboard navigation with visible focus, and ARIA labels for sortable columns and actions.
- **Accordion** with flush and card variants, consistent padding, clear expand and collapse icons, and keyboard support.
- **Tag** for status, filters, and metadata: 24px tall, color-coded (neutral, success, warning, critical), with an optional dismiss button.
- **Application states** for empty, error, and loading screens, using one pattern (icon, heading, description, action) with consistent messaging and clear next steps.

### Accessibility as the foundation

I ran 50+ component audits with Axe DevTools, VoiceOver, and keyboard testing, checking contrast, keyboard navigation, focus management, and ARIA labels. Each component shipped with accessibility specs and a testing checklist. 95% of components met WCAG 2.2 AA.

{% include figure.html slot="Advanced Table with annotations for keyboard and ARIA behavior." %}

## Results and adoption

- **Adoption:** every HashiCorp product team now uses Helios as its source of truth, up from 65% to 92%.
- **Component reuse:** from 12% to 78%.
- **Icon discovery:** from about five minutes to about 90 seconds.
- **Custom icon requests:** down 70%.
- **Designer onboarding:** 30% better.
- **UI support tickets:** down 25%.
- **Accessibility:** 95% of components meeting WCAG 2.2 AA.

[X: one sentence on how adoption and component reuse were measured]

## What went wrong or surprised me

[X: one real thing that didn't work or surprised you, and what you changed]

## What I learned

- **Build accessibility in early.** Retrofitting is harder than designing for it from the start.
- **Documentation drives adoption.** Clear specs reduce support load and make reuse the easy choice.
- **Relationships beat mandates.** Workshops and office hours did more than requirements.
- **Systematic doesn't mean plain.** Thoughtful details are what make a system feel polished.
- **Solve real problems first.** Dark mode, complex tables, and icon search won over teams because they fixed pain people already had.

## What I'd do next

Helios taught me that a design system only works when the standards are structured, named consistently, and easy to find. That is the thread in my work at Roblox, where I now structure the Foundation Design Kit's documentation so both designers and AI agents can follow the same standards. The next step I'd take with Helios is the same: keep the human-readable and machine-readable versions in sync, and measure drift instead of assuming it.
