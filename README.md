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
export BACKUP_DIR=...
make restore
```

Setup SSH keys:

```bash
./ssh.sh
```

Restart machine.
