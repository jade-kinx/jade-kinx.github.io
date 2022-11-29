# OpenStack Docs

## Documents Layout

```bash title="Directories & Files"
  mkdocs.yml              # mkdocs configuration file
  assets/                 # assets folder
      img/                # images folder
      css/                # css folder
  docs/                   # documents root
      index.md            # home
      usage.md            # usage
      links.md            # Useful Links
      openstack/          # openstack folder
          overview.md     # openstack overview
          installation.md # openstack installation
          ...             # and more
```

## Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.

* `python -m mkdocs serve -a localhost:8080` - live-server on port 8080
