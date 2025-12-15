# 🚀 Deployment Guide

Complete instructions for deploying your Flutter Web portfolio to production.

---

## Prerequisites

- Flutter 3.0+ with Web support enabled
- Production build tested locally
- Domain name (optional, but recommended)
- Hosting account (see options below)

---

## Step 1: Prepare for Production

### Optimize the Build
```bash
# Clean any previous builds
flutter clean

# Get latest dependencies
flutter pub get

# Build release version
flutter build web --release
```

### Output Location
```
build/web/
├── index.html
├── main.dart.js
├── assets/
└── ... (other files)
```

---

## Step 2: Deploy to Firebase Hosting (Recommended)

### Why Firebase?
- ✅ Free tier available
- ✅ Global CDN
- ✅ HTTPS by default
- ✅ Custom domain support
- ✅ One-command deployment

### Setup

#### 1. Install Firebase CLI
```bash
npm install -g firebase-tools
```

#### 2. Create Firebase Project
```bash
firebase login
firebase init hosting
```

When prompted:
- **Public directory**: `build/web`
- **Configure as SPA**: YES (Single Page App)
- **Set up automatic builds**: NO (we build manually)

#### 3. Update firebase.json
```json
{
  "hosting": {
    "public": "build/web",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**"
    ],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
```

#### 4. Deploy
```bash
flutter build web --release
firebase deploy
```

**Your site is live!** 🎉

### Custom Domain
```bash
firebase hosting:domain:create
# Follow the wizard
```

---

## Alternative: Vercel

### Why Vercel?
- ✅ Excellent for web applications
- ✅ Fast deployment pipeline
- ✅ Preview deployments
- ✅ Generous free tier
- ✅ Easy GitHub integration

### Setup

#### 1. Install Vercel CLI
```bash
npm install -g vercel
```

#### 2. Create vercel.json
```json
{
  "buildCommand": "flutter build web --release",
  "outputDirectory": "build/web",
  "framework": "other",
  "regions": ["sfo1"]
}
```

#### 3. Deploy
```bash
vercel
```

#### 4. Set Production URL
```bash
vercel --prod
```

---

## Alternative: GitHub Pages

### Why GitHub Pages?
- ✅ Free for public repos
- ✅ Easy GitHub integration
- ✅ No build configuration needed
- ✅ Auto-deploys on push

### Setup

#### 1. Create GitHub Repo
```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/yourname/portfolio.git
git branch -M main
git push -u origin main
```

#### 2. Create Deploy Action
Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: ["main"]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.10.0'
          channel: 'stable'
      
      - name: Get dependencies
        run: flutter pub get
      
      - name: Build web
        run: flutter build web --release
      
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./build/web
```

#### 3. Enable GitHub Pages
1. Go to repo Settings
2. Select "Pages"
3. Source: `gh-pages` branch
4. Save

Site will be available at: `https://yourname.github.io/portfolio`

---

## Alternative: Netlify

### Why Netlify?
- ✅ Excellent DX
- ✅ Continuous deployment
- ✅ Form handling
- ✅ Serverless functions
- ✅ Free tier

### Setup

#### 1. Create netlify.toml
```toml
[build]
  command = "flutter build web --release"
  publish = "build/web"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

#### 2. Connect GitHub
1. Sign up at [netlify.com](https://netlify.com)
2. Click "New site from Git"
3. Connect your GitHub repo
4. Netlify auto-detects settings
5. Deploy!

#### 3. Custom Domain (Optional)
Domain settings → Add custom domain

---

## Alternative: Static Hosting (S3 + CloudFront)

### Setup

```bash
# Build
flutter build web --release

# Create S3 bucket
aws s3 mb s3://your-portfolio-bucket

# Upload files
aws s3 sync build/web/ s3://your-portfolio-bucket \
  --delete \
  --cache-control "public,max-age=3600"

# Create CloudFront distribution
# (Use AWS Console - too complex for CLI)
```

---

## Performance Optimization Checklist

Before deploying:

- [ ] Run production build locally
- [ ] Test on multiple browsers (Chrome, Safari, Firefox, Edge)
- [ ] Test on mobile devices
- [ ] Check Lighthouse score
- [ ] Verify all links work
- [ ] Test dark mode rendering
- [ ] Check image optimization
- [ ] Enable compression

### Check Lighthouse Score
1. Build: `flutter build web --release`
2. Serve locally: `python -m http.server 8000`
3. Open DevTools → Lighthouse
4. Run audit

---

## Post-Deployment

### Monitor Performance
```bash
# For Firebase
firebase hosting:channel:list

# Check analytics
firebase console
```

### SEO Optimization

Update `web/index.html`:

```html
<meta name="description" content="Your portfolio description">
<meta name="keywords" content="flutter, developer, portfolio">
<meta name="author" content="Your Name">
<meta property="og:title" content="Your Name - Portfolio">
<meta property="og:description" content="Your portfolio description">
<meta property="og:image" content="https://yoursite.com/og-image.png">
<title>Your Name - Portfolio</title>
```

### Add Google Analytics (Optional)

In `web/index.html`, add inside `<head>`:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

---

## Troubleshooting

### Blank Page After Deploy
- Check browser console for errors
- Verify `index.html` is in root
- Ensure routing/redirects are configured
- Clear browser cache

### Styling Issues
- Verify `web/` folder structure is intact
- Check `pubspec.yaml` for assets
- Rebuild: `flutter build web --release`

### Performance Issues
- Minify JavaScript
- Optimize images
- Enable gzip compression
- Use CDN (Firebase/Vercel/Netlify do this)

### Custom Domain Not Working
- Update DNS records
- Wait 24-48 hours for propagation
- Test with `nslookup yourdomain.com`

---

## Deployment Checklist

- [ ] Personalize portfolio content
- [ ] Test build locally: `flutter build web`
- [ ] Test on multiple devices
- [ ] Choose hosting provider
- [ ] Set up deployment
- [ ] Deploy first version
- [ ] Test live site
- [ ] Add custom domain
- [ ] Set up monitoring
- [ ] Add analytics
- [ ] Share with recruiters! 🎉

---

## Common Deployment Commands

```bash
# Firebase
firebase deploy

# Vercel
vercel --prod

# Netlify (auto on git push)
git push origin main

# GitHub Pages (auto on git push)
git push origin main

# Manual hosting
flutter build web --release
# Upload build/web/ folder to your server
```

---

## Next Steps

After deployment:

1. **Update Resume** - Add your portfolio link
2. **Share Everywhere** - LinkedIn, GitHub bio, Twitter
3. **Send to Recruiters** - Include in job applications
4. **Monitor Analytics** - See who visits
5. **Iterate** - Update projects, improve design

---

## Support

Stuck? Check these resources:

- [Flutter Web Docs](https://flutter.dev/docs/get-started/web)
- [Firebase Hosting Docs](https://firebase.google.com/docs/hosting)
- [Vercel Docs](https://vercel.com/docs)
- [Netlify Docs](https://docs.netlify.com/)

Your portfolio is ready to launch! 🚀
