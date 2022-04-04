# .init

Install command line tools:

```bash
xcode-select --install
```

Kick off install:

```bash
curl -o- https://raw.githubusercontent.com/galderz/init/master/init.sh | bash
```

Restore initial files and folders:

```bash
cd ~/.init
export BACKUP_DIR=...
make restore
```

Restart machine.
