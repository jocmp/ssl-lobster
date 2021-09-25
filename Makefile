SHELL = /bin/bash
HOST ?= example.test

.PHONY: run
run:
	ruby app.rb

.PHONY: install
install:
	brew bundle
	rbenv install --skip-existing
	bundle install

.PHONY: setup
setup:
	mkcert -install
	mkcert -key-file key.pem -cert-file cert.pem $(HOST)

.PHONY: echo-host
echo-host:
	@echo "Enter sudo password to add $(HOST) to /etc/hosts"
	@printf "\n127.0.0.1 $(HOST)" | sudo tee -a /etc/hosts &> /dev/null
	@echo "Done!"
