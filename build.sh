#!/bin/sh
# ladbad.html is the source (artifact format, no <html>/<head> wrapper).
# This wraps it into a standalone index.html for GitHub Pages or any static host.
cd "$(dirname "$0")"
{
  printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n</head>\n<body>\n'
  cat ladbad.html
  printf '\n</body>\n</html>\n'
} > index.html
