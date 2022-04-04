fast: sudoers opt emacs brew packages

sudoers:
	echo "g          ALL = (ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers

opt:
	pushd /opt; \
	sudo chown "$(whoami)" .; \
	popd

emacs:
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

brew:
	./brew.sh
	brew tap d12frosted/emacs-plus

packages:
	brew install \
		1password \
		alfred \
		autoconf \
		clion \
		coreutils \
		dropbox \
		eclipse-java \
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
