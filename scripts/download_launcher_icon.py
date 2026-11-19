"""Download the exact favicon advertised by the Mahogany Manor website.

Generates a high resolution PNG for flutter_launcher_icons. This script
intentionally fails instead of substituting a different brand mark.
"""
from __future__ import annotations
from html.parser import HTMLParser
from io import BytesIO
from pathlib import Path
from urllib.parse import urljoin, urlparse
import re
import requests
from PIL import Image, ImageOps

BASE = "https://www.mmanor.ca/"
OUT = Path("assets/branding/launcher_icon.png")

class IconParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.icons = []
    def handle_starttag(self, tag, attrs):
        if tag.lower() != "link":
            return
        d = {k.lower(): (v or "") for k, v in attrs}
        rel = d.get("rel", "").lower()
        if "icon" in rel and d.get("href"):
            self.icons.append((d["href"], d.get("sizes", ""), rel))

session = requests.Session()
session.headers.update({"User-Agent": "Mozilla/5.0 (compatible; MahoganyManorPrototype/1.0)"})
response = session.get(BASE, timeout=25)
response.raise_for_status()
parser = IconParser()
parser.feed(response.text)
print("Declared favicon links:", parser.icons, flush=True)
# Prefer the actual website's declared favicon and larger touch icons.
def priority(item):
    href, sizes, rel = item
    numbers = [int(n) for n in re.findall(r"\d+", sizes)]
    sz = max(numbers) if numbers else (96 if "apple" in rel else 32)
    if href.endswith(".svg"):
        sz = 1024
    return sz
candidates = sorted(parser.icons, key=priority, reverse=True)
candidates.append(("/favicon.ico", "", "fallback"))
errors = []
image = None
for href, _, _ in candidates:
    try:
        url = urljoin(BASE, href)
        if urlparse(url).scheme != "https":
            raise ValueError("Only HTTPS icon links accepted")
        r = session.get(url, timeout=25)
        r.raise_for_status()
        blob = r.content
        if b"<svg" in blob[:1024].lower() or url.split("?")[0].lower().endswith(".svg"):
            import cairosvg
            png = cairosvg.svg2png(bytestring=blob, output_width=1024, output_height=1024)
            image = Image.open(BytesIO(png)).convert("RGBA")
        else:
            image = Image.open(BytesIO(blob))
            # ICO contains several sizes; Pillow chooses the best available frame.
            if image.format == "ICO":
                try:
                    largest = max(image.ico.sizes(), key=lambda x:x[0]*x[1])
                    image = image.ico.getimage(largest)
                except Exception:
                    pass
            image = image.convert("RGBA")
        if image.width < 8 or image.height < 8:
            raise ValueError("Favicon too small")
        print("Selected exact site icon:", url, "size", image.size, flush=True)
        break
    except Exception as exc:
        errors.append(str(exc))
        image = None
if image is None:
    raise RuntimeError("Could not obtain the website favicon. " + "; ".join(errors))
# Resize without distortion; allow transparent padding for Android.
icon = ImageOps.contain(image, (880,880), Image.Resampling.LANCZOS)
canvas = Image.new("RGBA", (1024,1024), (0,0,0,0))
canvas.alpha_composite(icon, ((1024-icon.width)//2,(1024-icon.height)//2))
OUT.parent.mkdir(parents=True, exist_ok=True)
canvas.save(OUT)
print("Launcher icon created:", OUT, OUT.stat().st_size, flush=True)
