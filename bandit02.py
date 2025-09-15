#!/usr/bin/env python3

import paramiko

# --------- CONFIG --------- #
banditNumber = 2
banditPassword = "263JGJPfgU6LtdEvgfWU1XP5yac29mFx"
hostname = "bandit.labs.overthewire.org"
port = 2220

# --------- HELPER FUNCTION --------- #
def ssh_command(command: str) -> str:
    client = paramiko.SSHClient()
    client.load_system_host_keys()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

    try:
        client.connect(
            hostname=hostname,
            port=port,
            username=f"bandit{banditNumber}",
            password=banditPassword,
            allow_agent=False,
            look_for_keys=False
        )
        stdin, stdout, stderr = client.exec_command(command)
        output = stdout.read().decode().strip()
        errors = stderr.read().decode().strip()
        if errors:
            print(f"Error: {errors}")
        return output
    finally:
        client.close()

# --------- MAIN --------- #
bandit_output = ssh_command("cat ./'--spaces in this filename--'")

password = bandit_output.split()[-1]

print(f"The password for bandit{banditNumber + 1} is: {password}")
