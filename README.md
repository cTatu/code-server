# Visual Studio Code Server

**Run it directly:**
```bash
code-server-[OSversion] --port=80 --allow-http --no-auth
```

**Using Docker:**
```bash
docker run -d -p 80:80 --name vscode --privileged mmnkl9/vscode
```

## Connect your Files System with SSHFS

### Use password
```bash
sshfs -o allow_other [user]@xxx.xxx.xxx.xxx:/path/to/your/code /path/to/mount
```

### Use ssh key file
```bash
sshfs -o allow_other,IdentityFile=~/.ssh/id_rsa [user]@xxx.xxx.xxx.xxx:/path/to/your/code /path/to/mount
```
