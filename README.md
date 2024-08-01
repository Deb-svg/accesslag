# AccessLag

**AccessLag** is a hacking simulation project designed for educational purposes. It includes various scripts for demonstrating and simulating security concepts. Use these tools responsibly and only in controlled environments.

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Scripts](#scripts)
- [Contributing](#contributing)
- [License](#license)

## Introduction

AccessLag provides a suite of scripts for educational simulations in cybersecurity. These scripts cover a range of topics including encryption, SQL injection, phishing, and more. They are designed to help users understand various security concepts and should be used solely for learning purposes.

## Installation

### On Linux

1. **Clone the Repository:**

   ```sh
   git clone https://github.com/Deb-svg/accesslag.git
   cd accesslag
   ```
2. **Run the Installation Script**:
   ```sh
   sudo ./forlinux/install.sh
   ```

### On Termux
1. **Clone the Repository**:

   ```sh
   git clone https://github.com/Deb-svg/accesslag.git
   cd accesslag
   ```
   
2. **Run the Termux Installation Script**:

   ```sh
   bash termux-install.sh
   ```

## Usage

After installation, you can use the `acslag` command to interact with the scripts. Here are some example commands:

- **Install Scripts:**
  ```sh
  acslag install
  ```
- **Run a Script:**
  ```sh
  acslag run <script-name>
  ```
- **Update:**
  ```sh
  acslag update
  ```
- **Cleanup:**
  ```sh
  acslag cleanup
  ```
- **Help:**
  ```sh
  acslag -h
  ```

## Scripts

- **file_encryptor.sh**: Encrypts and decrypts files using custom encryption methods.
- **scan.sh**: Scans for vulnerabilities in a given target.
- **spoof.sh**: Simulates network spoofing attacks.
- **sniff.sh**: Captures and analyzes network traffic.
- **sql_injection.sh**: Demonstrates SQL injection techniques.
- **xss.sh**: Shows cross-site scripting vulnerabilities.
- **csrf.sh**: Simulates cross-site request forgery attacks.
- **crack_wpa.sh**: Attempts to crack WPA/WPA2 encryption.
- **deauth.sh**: Sends deauthentication packets to disrupt a network.
- **handshakes.sh**: Captures WPA/WPA2 handshakes for offline cracking.
- **buffer_overflow.sh**: Exploits buffer overflow vulnerabilities.
- **privilege_escalation.sh**: Demonstrates privilege escalation techniques.
- **shellshock.sh**: Shows Shellshock vulnerability exploitation.
- **phishing.sh**: Simulates phishing attacks.
- **keylogger.sh**: Records keystrokes for demonstration purposes.
- **spoofing.sh**: Performs IP and MAC address spoofing

## Contributing
Contributions are welcome! If you would like to contribute to the AccessLag project, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

## License

This project is licensed under the [Educational Hacking License](LICENSE). Please read the license file for more details.

_________________________________________________________________________________________________________________________

***Disclaimer***: *The AccessLag project is intended for educational purposes only. The creators of this project do not endorse or condone the use of these tools for illegal activities. Use these tools responsibly and only in environments where you have explicit permission to test and simulate security scenarios.*
