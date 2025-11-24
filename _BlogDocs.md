# Jekyll Blog Workflow (Idiot‑Proof Guide)

This guide walks you through **everything you need to do** to:

1. Create a blog post
2. Run your site locally inside Docker
3. Tweak the design / config
4. Push changes to GitHub
5. Deploy automatically via GitHub Pages + GitHub Actions

Works with:

* **WSL**
* **Docker**
* **No local Ruby installation**

---

# 📁 1. Create a New Blog Post

All blog posts live in the `_posts/` folder.

Each post must use this filename format:

```
YYYY-MM-DD-title-of-post.md
```

Example:

```
_posts/2025-11-24-my-first-blog-post.md
```

Inside the file, add "front matter" at the top:

```yaml
---
layout: post
title: "My First Blog Post"
date: 2025-11-24
---
```

Then add your content below the `---`.

---

# 🚀 2. Serve the Site Locally (Docker)

From inside your project directory:

### **Build (only needed after modifying the Dockerfile):**

```bash
docker build -t jekyll-blog .
```

### **Run your site:**

```bash
docker run --rm -v "$(pwd):/site" -p 4000:4000 jekyll-blog
```

Then visit:

```
http://localhost:4000
```

The site updates when you save files.

---

# 🎨 3. Tweak Appearance / Config

Most of the site behavior is controlled in `_config.yml`.

Things you commonly change:

### **Site title + description**

```yaml
title: "My Blog"
description: "Thoughts, notes, ideas."
```

### **Theme**

The default theme is:

```yaml
theme: minima
```

You can replace it with any Jekyll theme.

### **Plugins**

Example:

```yaml
plugins:
  - jekyll-feed
  - jekyll-seo-tag
```

After editing plugins, rebuild your container:

```bash
docker build -t jekyll-blog .
```

---

# 🧪 4. Test Your Site Locally

Every time you:

* edit posts
* tweak config
* change themes

You can view the results instantly:

```
docker run --rm -v "$(pwd):/site" -p 4000:4000 jekyll-blog
```

Open `http://localhost:4000`.

---

# 📤 5. Push Your Changes to GitHub

1. Check what changed:

```bash
git status
```

2. Add updates:

```bash
git add .
```

3. Commit:

```bash
git commit -m "Update blog"
```

4. Push:

```bash
git push
```

---

# 🌐 6. GitHub Pages Deployment (Automatic)

Your repo already contains a GitHub Actions workflow:

```
.github/workflows/pages.yml
```

Every push to `main` triggers:

1. GitHub builds your site
2. Uploads the `_site/` content
3. Publishes to GitHub Pages

Your live site will be at:

```
https://tobybull.github.io/my-blog
```

You do **not** need to run `jekyll build` yourself — GitHub Actions handles it.

---

# 🩹 Troubleshooting

### **Site doesn't update locally?**

Rebuild Docker image:

```bash
docker build -t jekyll-blog .
```

### **GitHub Pages not updating?**

Check Actions tab → ensure workflow succeeded.

### **Missing gems or plugin errors?**

After changing Gemfile:

```
docker build -t jekyll-blog .
```

---

# ✅ Summary Cheat Sheet

### **Create a post**

```
_posts/YYYY-MM-DD-title.md
```

### **Run locally**

```
docker run --rm -v "$(pwd):/site" -p 4000:4000 jekyll-blog
```

### **Modify theme/config**

Edit `_config.yml` → rebuild image.

### **Deploy**

```
git add .
git commit -m "Update"
git push
```

Pages deploy automatically.

---

If you ever forget steps, just come back to this file — it lists everything you need. 🚀
