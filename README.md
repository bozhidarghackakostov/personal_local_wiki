# Personal Wiki — Complete Local Wikipedia Alternative

A local-first, offline-first personal encyclopedia application inspired by Wikipedia, traditional encyclopedias, and personal knowledge management systems.

> **One local database. Many wiki pages. One connected knowledge library. Full control over the information.**

---

## Key Features

1. **Local-First & Offline**:
   - Zero remote backends or cloud databases required.
   - All articles, metadata, categories, tags, sources, revisions, and link relationships are stored directly in **IndexedDB** on your machine.
   - Fully functional without an internet connection.

2. **Wikipedia-Inspired Clean Aesthetic**:
   - Designed for readability and information density: clean serif article typography, Wikipedia-inspired table of contents box, metadata infoboxes, and category footer bars (`.catlinks`).
   - Classic blue links for existing articles and red links for missing/uncreated pages (`[[Missing Article]]`).
   - Responsive layout with desktop and mobile support.
   - Clean print styling (`@media print`) that removes top bars and navigation for paper/PDF export.

3. **Interconnected Knowledge Graph**:
   - **Internal Wiki Links**: Use `[[Page Title]]` or `[[Page Title|Custom Label]]` anywhere in the editor and article prose.
   - **Autocomplete**: Typing `[[` in the editor brings up an instant article suggestions popup.
   - **Backlinks ("What links here")**: Real-time incoming link tracking displayed on every article.
   - **Related Topics**: Calculated dynamically from category, tag, and link relationship graphs.
   - **Missing Links Index**: Discovers all uncreated target titles referenced across articles with a 1-click "Create Page" action.
   - **Orphan Pages Index**: Identifies disconnected articles that have zero incoming links.

4. **Multi-Source Content Collection & Import**:
   - **Method A: Website URL**: Attempts direct extraction. If blocked by cross-origin restrictions or paywalls, preserves the URL and provides a seamless fallback to pasted text without losing entered metadata.
   - **Method B: Pasted Text**:
     - *Mode 1 (Preserve & Format)*: Keeps original wording while formatting paragraphs and headings.
     - *Mode 2 (Structure as Wiki Article)*: Automatically organizes into Lead Summary, Overview & Concepts, Details, and References.
     - *Mode 3 (Custom Editing)*: Opens raw text directly in the Markdown editor.
   - **Method C: Local File Upload**: Multi-file batch import supporting `.md`, `.markdown`, `.txt`, and `.html`. HTML is sanitized using DOMPurify to strip executable scripts and unsafe attributes.
   - **Duplicate Detection**: Identifies matching titles, source URLs, and content similarity before saving, offering options to create separate pages, update existing pages, or merge new material.

5. **Local Full-Text Search Engine**:
   - Offline search index ranking by exact title match, prefix match, aliases, summaries, categories, tags, and content occurrences.
   - Contextual snippets with `<mark>` highlight markers.
   - Filter by category and tag.

6. **Revisions & Trash**:
   - Snapshot revision history recorded automatically on every edit with optional change notes.
   - 1-click revision restore (creates a new snapshot so history is never destroyed).
   - Soft-delete to Trash with instant Restore and Permanent Delete options.

7. **Complete Data Portability & Backup**:
   - **Full JSON Database Export**: Backs up all tables with schema versioning.
   - **Restore**: Offers both a clean replacement mode (with explicit confirmation) and a merge mode.
   - **Bulk Markdown ZIP Export**: Exports all articles as clean `.md` files with YAML frontmatter + `metadata.json`.
   - **Individual Markdown Export**: Download any single article as a `.md` file.

---

## Getting Started

### Prerequisites

- Node.js (v18 or newer recommended)
- npm

### Installation & Development

```bash
# Install dependencies
npm install

# Start local development server
npm run dev
```

Open your browser to `http://localhost:5173`.

### Production Build & Preview

```bash
# Typecheck and compile production bundle
npm run build

# Preview production build locally
npm run preview
```

### Running Automated Tests

The application includes automated tests covering all 15 mandatory scenarios specified in the master prompt (first launch, persistence, import formatting, blocked URL fallback, duplicate detection, internal links, renaming, missing pages, full-text search, categories/tags, revision recovery, backup/restore, large collection performance, HTML sanitization, and TOC extraction):

```bash
npm test
```

---

## Route Overview

- `#/` — Wiki Homepage (live stats, editable intro, search, recent additions, category browsing)
- `#/pages` — All Pages (complete table index, multi-field sorting, filtering, and pagination)
- `#/page/:id` — Individual Article view (TOC, lead summary, prose, infobox, backlinks, related pages, sources)
- `#/page/:id/edit` — Article Editor (split preview, Markdown toolbar, `[[` autocomplete, autosave draft)
- `#/new` — Create Article (with optional `?title=` pre-fill)
- `#/import` — Import Content (URL, Pasted text, Local file batch, duplicate resolution)
- `#/search` — Global Search (ranked results, highlighted snippets, filters)
- `#/categories` & `#/category/:id` — Category Index and Category Articles
- `#/tags` & `#/tag/:id` — Tag Index and Tagged Articles
- `#/sources` & `#/source/:id` — Sources and external attribution tracking
- `#/recent` — Recently Modified and Recently Added articles
- `#/favorites` — Starred articles
- `#/orphans` — Articles with 0 incoming internal links
- `#/missing-links` — Unresolved wiki links
- `#/trash` — Soft-deleted pages
- `#/settings` — Preferences, local storage diagnostics, JSON backup/restore, and Markdown export

---

## Technical Stack

- **Frontend**: React 19 + TypeScript
- **Build Tool**: Vite
- **Storage**: IndexedDB via Dexie.js
- **Markdown & Security**: Marked + DOMPurify
- **Icons**: Lucide React
- **Export**: JSZip
- **Testing**: Vitest + fake-indexeddb + JSDOM
