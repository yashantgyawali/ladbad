#!/bin/sh
# ladbad.html is the source (artifact format, no <html>/<head> wrapper).
# This wraps it into a standalone index.html for GitHub Pages or any static host.
cd "$(dirname "$0")"
{
  printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n<link rel="icon" type="image/png" href="favicon.png">\n<link rel="apple-touch-icon" href="apple-touch-icon.png">\n<meta property="og:image" content="https://ladbad.tumlet.com/icon-192.png">\n<!-- Google Analytics (G-RBBW0WK1B4). Skipped on localhost so testing does not count as visits. -->\n<script>if (!/^(localhost|127\\.0\\.0\\.1|\\[::1\\])$/.test(location.hostname)) (function(){ var g = document.createElement("script"); g.async = true; g.src = "https://www.googletagmanager.com/gtag/js?id=G-RBBW0WK1B4"; document.head.appendChild(g); })();\nwindow.dataLayer = window.dataLayer || []; function gtag(){ dataLayer.push(arguments); } gtag("js", new Date()); gtag("config", "G-RBBW0WK1B4");</script>\n</head>\n<body>\n'
  cat ladbad.html
  printf '\n</body>\n</html>\n'
} > index.html
