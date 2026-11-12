#!/bin/sh
# ladbad.html is the source (artifact format, no <html>/<head> wrapper).
# This wraps it into a standalone index.html for GitHub Pages or any static host.
cd "$(dirname "$0")"
{
  printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n<link rel="icon" type="image/png" href="favicon.png">\n<link rel="apple-touch-icon" href="apple-touch-icon.png">\n<meta property="og:image" content="https://yashantgyawali.github.io/ladbad/icon-192.png">\n</head>\n<body>\n'
  cat ladbad.html
  printf '\n</body>\n</html>\n'
} > index.html
