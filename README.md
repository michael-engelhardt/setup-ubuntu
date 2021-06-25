# Initial Setup for Ubuntu Server

This Bash Script will 
- Create a Superuser for you
- Add the user to the sudo group
- Allow SSH Connections in Firewall
- Activate the Firewall

At the bottom of this Readme you can follow the steps to activate SSH-Key Authentication.

## How to use

### Make sure the Script is Executable
```bash
chmod +x setupubuntu.sh
```

### Start the script
```bash
./setupubuntu.sh
```

### Delete the Folder

## What now?

### Setup SSH Authentication

**On your local Machine** generate an SSH Key and push it via SSH to your server. You will have to do this for your root and your new user.

#### Use Powershell:
```powershell
ssh-keygen
```

#### Transfer to Root
Change the IP and the also name of the SSH-Key if needed.
```powershell
cat ~/.ssh/id_rsa.pub | ssh root@your_server_ip "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> ~/.ssh/authorized_keys"

```

Change the IP
#### Repeat for your sudo user
Change the IP, the username and the also name of the SSH-Key if needed.
```powershell
cat ~/.ssh/id_rsa.pub | ssh username@your_server_ip "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> ~/.ssh/authorized_keys"

```

#### Deactivate Pssword Authentication on your Server

##### Log into your Server
```bash
ssh username@your_server_ip
```

##### Disable Password Authentication
```bash
sudo nano /etc/ssh/sshd_config
```

Change the line on the bottom of the file:
**. . .**
PasswordAuthentication **no**
**. . .**

Press `Ctrl + X` then `y` then `Enter`

##### Restart the sshd service
```bash
sudo systemctl restart ssh
```
