# Platform Engineer Intelligence Pack

This folder tracks RSS, YouTube, podcast, GitHub release, and security feeds used in Miniflux.

## Files

- `feeds.yaml` - source of truth
- `Platform-Engineer-Intelligence-Pack.opml` - Miniflux import file
- `build-opml.py` - generates OPML from YAML
- `CHANGELOG.md` - version history

## Import into Miniflux

1. Run `python build-opml.py`
2. Log into Miniflux
3. Go to Feeds > Import
4. Upload `Platform-Engineer-Intelligence-Pack.opml`
