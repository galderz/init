emacsd = $(HOME)/.emacs.d
brew = /opt/homebrew/bin/brew

fast: sudoers opt $(emacsd) $(brew) packages

sudoers:
	echo "g          ALL = (ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
.PHONY: sudoers

opt:
	pushd /opt; \
	sudo chown "$(whoami)" .; \
	popd
.PHONY: opt

$(emacsd):
	git clone https://github.com/syl20bnr/spacemacs $@

$(brew):
	./brew.sh

packages:
	brew tap d12frosted/emacs-plus
	brew install \
		1password \
		alfred \
		autoconf \
		clion \
		coreutils \
		dropbox \
		emacs-plus \
		findutils \
		git \
		gnu-sed \
		gpg \
		intellij-idea \
		istat-menus \
		iterm2 \
		kindle \
		make \
		ninja \
		python-yq \
		rust \
		slack \
		skype \
		spotify \
		tunnelblick \
		vlc \
		wget \
		xld \
		zoom \
		zulip
.PHONY: packages

## Backup and restore sections
do-backup += rsync
do-backup += --archive
do-backup += --delete
do-backup += --recursive
do-backup += --verbose

DRY_RUN ?= true

ifeq ($(DRY_RUN),true)
  do-backup += --dry-run
endif

# Requires a $BACKUP_DIR to be defined
backup:
	$(call backup-all,$(do-backup))
.PHONY: backup

define backup-all
$(call backup,${1},.ssh)
$(call backup,${1},.ssh.redhat)
$(call backup,${1},.private.el)
$(call backup,${1},.pypirc)
$(call backup,${1},.authinfo.gpg)
$(call backup,${1},.gnupg)
$(call backup,${1},.emacs.d/.cache/erc-logs)
$(call backup,${1},Documents)
$(call backup,${1},Dropbox)
$(call backup,${1},1)
$(call backup,${1},Downloads)
$(call backup,${1},Music)
endef

define backup
${1} $(HOME)/$(2) $(BACKUP_DIR)
endef

# Requires a $BACKUP_DIR to be defined
restore:
	pushd $(BACKUP_DIR)/; \
	rsync -va .ssh ~/; \
	rsync -va .ssh.redhat ~/; \
	rsync -va .private.el ~/; \
	rsync -va .pypirc ~/; \
	rsync -va .authinfo.gpg ~/; \
	rsync -va .gnupg ~/ || true; \
	mkdir -p .emacs.d/.cache; \
	rsync -va erc-logs ~/.emacs.d/.cache; \
	rsync -va Documents ~/; \
	rsync -va Dropbox ~/; \
	rsync -va 1 ~/; \
	rsync -va Downloads ~/; \
	rsync -va Music ~/;
