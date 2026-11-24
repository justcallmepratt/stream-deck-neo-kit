# Set up the Stream Deck Neo Kit with Claude

Open this folder in Claude Code on the Mac and say: **"Follow PROMPT.md."**
Everything below is addressed to Claude.

---

You are installing the coding-page scripts for an Elgato Stream Deck Neo and walking the person
through the layout. Read `README.md` and everything in `scripts/` first.

**1. Ask for the five settings in `scripts/config.sh`:** the project folder their IDE opens, the
backend (Maven / Spring Boot) and frontend (npm) folders inside it, the npm script that starts the
frontend dev server (check `package.json`: usually `start` for Angular, `dev` for Next.js or Vite),
and the IDE's app name. Check each folder exists and that the IDE is in `/Applications`, and say if
one isn't.

**2. Install.** Show the plan, then, once they agree:

- Copy `scripts/` to `~/StreamDeck/`. If `~/StreamDeck` already exists, show what would be
  replaced and ask first.
- Write their values into `~/StreamDeck/config.sh`.
- `chmod +x ~/StreamDeck/*.command`
- Clear the download flag: `xattr -dr com.apple.quarantine ~/StreamDeck`

**3. Test the safe keys.** Run `health-check.command` and `git-pull.command` and show the output.
Do not run `git-push.command` or `open-pr.command` as a test; those act on their real repository.

**4. Build the keys with them.** The Stream Deck app has no CLI, so guide them by hand: page 2 is
its own profile tied to the IDE, and each coding key is **System > Open** pointed at a
`.command` file. Pages 1 and 3 are in the README. Mention Key Logic for fitting git pull, push and
pull request on one key.

**Rules**

- Ask before overwriting files or changing anything outside this folder and `~/StreamDeck`.
- Don't push, open pull requests or start servers unless they ask.
