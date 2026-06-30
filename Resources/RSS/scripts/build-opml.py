from pathlib import Path
import yaml
import xml.etree.ElementTree as ET

SCRIPT_DIR = Path(__file__).resolve().parent
BASE = SCRIPT_DIR.parent
FEEDS = BASE / "feeds.yaml"
OUT = BASE / "Platform-Engineer-Intelligence-Pack.opml"

with FEEDS.open("r", encoding="utf-8") as f:
    data = yaml.safe_load(f)

opml = ET.Element("opml", version="2.0")
head = ET.SubElement(opml, "head")
ET.SubElement(head, "title").text = data.get("metadata", {}).get("name", "Platform Engineer Intelligence Pack")
body = ET.SubElement(opml, "body")

for category in data.get("categories", []):
    category_outline = ET.SubElement(
        body,
        "outline",
        text=category["name"],
        title=category["name"],
    )

    for feed in category.get("feeds", []):
        url = feed.get("url")
        if not url:
            continue

        feed_type = feed.get("type", "rss")

        if feed_type == "website":
            continue

        ET.SubElement(
            category_outline,
            "outline",
            text=feed["name"],
            title=feed["name"],
            type="rss",
            xmlUrl=url,
            htmlUrl=feed.get("website", url),
        )

tree = ET.ElementTree(opml)
ET.indent(tree, space="  ")
tree.write(OUT, encoding="utf-8", xml_declaration=True)

print(f"Generated: {OUT}")
