# Stream Deck Neo Kit

A layout and a set of key scripts that turn an Elgato Stream Deck Neo into an everyday macro pad
for a Mac that is used for coding (IntelliJ, Spring Boot, Angular).

**Status:** planned, not yet set up on the device. The layout is designed and the scripts are
written and syntax-checked, but they have not been run from a Stream Deck on a Mac yet. Treat this
as a first version to try and adjust.

## The idea

The Neo has eight keys. That is not many, so each key has to earn its place: one press should
replace a chain of clicks I do every day.

## The MVP

Three pages of eight keys, plus the scripts behind the coding page.

**Page 1: every day**

| | | | |
|---|---|---|---|
| Start my day | Capture idea | Action mail | Claude |
| Mute mic | Play / pause | Focus | End my day |

**Page 2: coding** (its own profile, shown automatically when IntelliJ is in front)

| | | | |
|---|---|---|---|
| Open project | Run backend | Run frontend | Run tests |
| Git pull | Git push | Open pull request | Dashboards |

**Page 3: plans.** Eight Website keys for the trackers and wiki pages I open every week.

### Scripts

| Key | File |
|---|---|
| Open project | `scripts/open-project.command` |
| Run backend | `scripts/run-backend.command` |
| Run frontend | `scripts/run-frontend.command` |
| Run tests | `scripts/run-tests.command` |
| Git pull | `scripts/git-pull.command` |
| Git push | `scripts/git-push.command` |
| Open pull request | `scripts/open-pr.command` (needs the GitHub CLI) |
| Health check (spare) | `scripts/health-check.command` |

Setup:

1. Copy `scripts/` to `~/StreamDeck/` and edit the four lines at the top of `config.sh`.
2. If macOS blocks a script as downloaded, clear the flag: `xattr -dr com.apple.quarantine ~/StreamDeck`
3. Double-click one `.command` file to test it. It opens in Terminal.
4. In the Stream Deck app, drag **System > Open** onto a key and point it at the file.

### How each kind of key is built

- **Single links:** the Website action with the page's address.
- **Start my day / End my day:** a Multi Action that opens or closes several things in order.
- **Play / pause, Mute:** system media and hotkey actions, so they work with any player.
- **Focus:** an Apple Shortcut that turns on Do Not Disturb and starts a timer.
- **Coding keys:** the scripts above.

## How we solved it

| Problem | What we did |
|---|---|
| Only eight keys | Three pages by context (every day, coding, plans), with the Touch Points to flip between them. |
| Flipping pages by hand | The coding page is its own profile tied to IntelliJ, so it appears when the IDE is in front. |
| Still short on keys | Key Logic (Stream Deck 7.0+) gives one key a press, a double-press and a hold. Git pull, push and open pull request can share one key. |
| One key, many steps | Multi Action for app chains; small shell scripts for anything with logic. |
| Scripts tied to one project | Every script reads `config.sh`, so switching projects is a four-line edit. |
| A script failing silently | Each script checks its folder first and keeps the Terminal window open with a readable message. |

### What we found out

- The Infobar is display-only and the Touch Points only page. Neither can be given other jobs.
- Automatic profile switching only works while the Stream Deck app window is minimized.
- No plugin turned up for Notion, a Gmail unread count on macOS, Railway or Supabase.

Links: [Key Logic](https://www.elgato.com/explorer/products/stream-deck/key-logic-stream-deck/) ·
[Smart Profiles](https://www.elgato.com/us/en/explorer/products/stream-deck/smart-profiles-stream-deck/) ·
[Plugin SDK](https://docs.elgato.com/streamdeck/sdk/introduction/getting-started) ·
[Neo Infobar guide](https://docs.elgato.com/streamdeck/sdk/guides/neo-infobar)

## What's next

- **Status feed:** one small endpoint returns JSON (deploy state, unread count, tracker counts) and
  a JSON display plugin puts each field on its own key, colored by value.
- **Infobar ticker:** a small custom plugin that rotates one line: next meeting, mail count, deploy state.
- **Windows versions** of the coding keys in PowerShell, kept in this same repo.
- **Plugin pack:** curated profiles per use case (office, dev, gaming) built with the Stream Deck SDK.
