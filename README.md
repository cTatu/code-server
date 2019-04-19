# Visual Studio Code Server

Try it out:
```bash
docker run -d -p 80:80 --name vscode --privileged mmnkl9/vscode
```

- Code on your Chromebook, tablet, and laptop with a consistent dev environment.
	- If you have a Windows or Mac workstation, more easily develop for Linux.
- Take advantage of large cloud servers to speed up tests, compilations, downloads, and more.
- Preserve battery life when you're on the go.
	- All intensive computation runs on your server.
	- You're no longer running excess instances of Chrome.

## Connect your Files System with SSHFS

### Use password
```bash
sshfs -o allow_other [user]@xxx.xxx.xxx.xxx:/path/to/your/code /path/to/mount
```

### Use ssh key file
```bash
sshfs -o allow_other,IdentityFile=~/.ssh/id_rsa [user]@xxx.xxx.xxx.xxx:/path/to/your/code /path/to/mount
```
