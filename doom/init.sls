chocolate-doom:
  pkg.installed

freedoom:
  pkg.installed

doom-wad-shareware:
  pkg.installed

/home/xubuntu/.local/share/chocolate-doom/default.cfg:
  file.managed:
    - source: salt://doom/default.cfg
