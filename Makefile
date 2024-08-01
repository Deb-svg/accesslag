# Makefile for managing the accesslag project

# Variables
SHELL := /bin/bash
INSTALL_DIR := /usr/local/bin
SCRIPTS := file_encryptor.sh scan.sh spoof.sh sniff.sh sql_injection.sh xss.sh csrf.sh \
           crack_wpa.sh deauth.sh handshakes.sh buffer_overflow.sh privilege_escalation.sh \
           shellshock.sh phishing.sh keylogger.sh spoofing.sh
TERMUX_INSTALL_SCRIPT := termux-install.sh
INSTALL_SCRIPT := install.sh
TERMUX_ACSLAG_SCRIPT := termux-acslag.sh
ACSLAG_SCRIPT := acslag.sh
LOG_FILES := /tmp/encrypted.log /tmp/file_encryptor.log
DEPENDENCIES := openssl base64 awk tr sha256sum

# Default target
all: build

# Build linux target
build_linux: check_dependencies validate_scripts configure_environment compile_code
	@echo "Building for Linux project..."
  	chmod +x forlinux/install.sh
  	./forlinux/install.sh
  	@echo "Successfully building project for Linux."

# Build termux target
build_linux: check_dependencies validate_scripts configure_environment compile_code
	@echo "Building for Termux project..."
  	chmod +x fortermux/termux-install.sh
  	./fortermux/termux-install.sh
  	@echo "Successfully building project for Termux."

# Check for required dependencies
check_dependencies:
	@echo "Checking for required dependencies..."
	for dep in $(DEPENDENCIES); do \
		if ! command -v $$dep &> /dev/null; then \
			echo "Error: $$dep is not installed."; \
			exit 1; \
		fi \
	done
	@echo "All dependencies are installed."

# Validate scripts to ensure they are executable
validate_scripts:
	@echo "Validating scripts..."
	for script in $(SCRIPTS) $(TERMUX_INSTALL_SCRIPT) $(INSTALL_SCRIPT) $(TERMUX_ACSLAG_SCRIPT) $(ACSLAG_SCRIPT); do \
		if [ ! -x $$script ]; then \
			echo "Error: $$script is not executable."; \
			exit 1; \
		fi \
	done
	@echo "All scripts are valid and executable."

# Install target
install: build
	@echo "Installing scripts..."
	for script in $(SCRIPTS) $(TERMUX_INSTALL_SCRIPT) $(INSTALL_SCRIPT) $(TERMUX_ACSLAG_SCRIPT) $(ACSLAG_SCRIPT); do \
		cp $$script $(INSTALL_DIR)/; \
		chmod +x $(INSTALL_DIR)/$$script; \
	done
	@echo "Installation complete."

# Uninstall target
uninstall:
	@echo "Uninstalling scripts..."
	for script in $(SCRIPTS) $(TERMUX_INSTALL_SCRIPT) $(INSTALL_SCRIPT) $(TERMUX_ACSLAG_SCRIPT) $(ACSLAG_SCRIPT); do \
		rm -f $(INSTALL_DIR)/$$script; \
	done
	@echo "Uninstallation complete."

# Clean target
clean:
	@echo "Cleaning up..."
	rm -f $(LOG_FILES)
	@echo "Cleanup complete."

# Update target
update:
	@echo "Updating project..."
	sudo apt-get update -y
	@echo "Update complete."

# Help target
help:
	@echo "Usage: make [target]"
	@echo "Targets:"
	@echo "  all        - Build the project"
	@echo "  install    - Install the scripts to $(INSTALL_DIR)"
	@echo "  uninstall  - Uninstall the scripts from $(INSTALL_DIR)"
	@echo "  clean      - Remove log files and temporary files"
	@echo "  update     - Update the project"
	@echo "  help       - Show this help message"

.PHONY: all build check_dependencies validate_scripts configure_environment compile_code install uninstall clean update help
