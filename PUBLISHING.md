# Publishing this site

This folder is already a git repository with everything committed on branch `main`. What remains is to put it on GitHub. Two routes, both fine.

## Route A: GitHub Desktop (easiest, no command line)

1. Install GitHub Desktop from desktop.github.com and sign in to your GitHub account.
2. File > Add Local Repository.
3. Choose this folder: `~/Desktop/DP English Textbooks/lit-site`. It will recognise the existing repository and the existing commit.
4. Click **Publish repository**.
5. Name it, for example `dp-literature`. Leave **Keep this code private** ticked for a private repository, or untick it if you want GitHub Pages.

To publish changes later: make the edit, write a short summary in the bottom left, Commit to main, then Push origin.

## Route B: Terminal

You need a personal access token, because GitHub stopped accepting account passwords over HTTPS. Create one at github.com > Settings > Developer settings > Personal access tokens > Fine-grained tokens, with Contents read and write on the repository you are about to create.

1. On github.com, create a new empty repository. Do not add a README, a .gitignore or a licence, since this folder already has them.
2. In Terminal:

```
cd ~/Desktop/"DP English Textbooks"/lit-site
git remote add origin https://github.com/YOUR-USERNAME/dp-literature.git
git push -u origin main
```

3. When prompted, give your GitHub username and paste the token as the password. macOS will remember it in the keychain.

To publish changes later: `git add -A && git commit -m "what changed" && git push`.

## Turning on GitHub Pages

Repository > Settings > Pages. Under Build and deployment, set Source to **Deploy from a branch**, branch `main`, folder `/ (root)`. Save. The site appears at `https://YOUR-USERNAME.github.io/dp-literature/` within a couple of minutes.

GitHub Pages only publishes from a private repository if you have GitHub Pro, Team or an organisation plan. On a free account the repository must be public for Pages to work. If your school has a GitHub organisation, creating the repository inside it may give you private plus Pages.

## What is deliberately not in this repository

`.gitignore` excludes `teaching-plans/` and all PDFs, so teacher packs, display slides and course textbooks are never pushed. Check `git status` before committing if you add anything new to the folder.
