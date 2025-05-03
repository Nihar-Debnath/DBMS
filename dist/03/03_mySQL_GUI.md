Perfect! Let's get you set up so you can access **MySQL installed inside WSL** from **Windows GUI tools** like **MySQL Workbench**.

---

## ✅ Goal:
Run MySQL inside WSL, but access it **graphically from Windows** using **MySQL Workbench**.

---

## 🛠️ Step-by-Step Setup

---

### 🔸 Step 1: Make sure MySQL is running inside WSL

Inside your WSL terminal, run:

```bash
sudo service mysql start
```

You can check status with:

```bash
sudo service mysql status
```

---

### 🔸 Step 2: Enable MySQL to listen on all interfaces

By default, MySQL inside WSL only listens to `localhost` (127.0.0.1). You need to make it listen on all IPs so that Windows (which is like a separate OS) can connect to it.

#### Edit the config file:

```bash
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
```

Find this line:

```
bind-address = 127.0.0.1
```

Change it to:

```
bind-address = 0.0.0.0
```

> This makes MySQL listen on **all network interfaces**, including the virtual interface between WSL and Windows.

Save and exit (press `Ctrl + X`, then `Y`, then `Enter`).

---

### 🔸 Step 3: Allow root login with password from remote (needed for Workbench)

Login to MySQL from WSL:

```bash
sudo mysql
```

Inside the MySQL shell, run:

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'yourpassword';
FLUSH PRIVILEGES;
EXIT;
```

> Replace `'yourpassword'` with a strong password.

---

### 🔸 Step 4: Get your WSL IP address

In WSL, run:

```bash
ip addr show eth0
```

Or a simpler version:

```bash
hostname -I
```

You'll get an IP like `172.22.50.1` – copy this.

This is the **virtual IP** of your WSL distro, which you'll use to connect from Windows.

---

### 🔸 Step 5: Open MySQL Workbench (on Windows)

1. Open **MySQL Workbench**.
2. Click **"New Connection"**.
3. Fill in:

   - **Connection Name**: Anything you like (e.g., "WSL MySQL")
   - **Hostname**: Paste the WSL IP you got (`172.xx.xx.xx`)
   - **Port**: `3306`
   - **Username**: `root`
   - **Password**: Click "Store in Vault" and enter the password you set earlier.

4. Click **Test Connection**. If all went well, it should say **"Successfully made the MySQL connection"**.

---

### 🔒 Optional: Secure the MySQL server

Run this command in WSL to secure the MySQL installation:

```bash
sudo mysql_secure_installation
```

It will help you:
- Set a root password
- Remove anonymous users
- Disallow root login remotely (optional)
- Remove test database
- Reload privileges

---

## 🧠 Bonus Tip: Use `localhost` instead of WSL IP

If you **install a MySQL server on Windows** and one inside WSL, there may be port conflicts on `localhost:3306`.

But if you're only using WSL's MySQL, you can **forward port 3306** to Windows `localhost` using this command in PowerShell:

```powershell
netsh interface portproxy add v4tov4 listenaddress=127.0.0.1 listenport=3306 connectaddress=<WSL-IP> connectport=3306
```

(Replace `<WSL-IP>` with the actual IP you got from `hostname -I`)

This will let you connect using `localhost` from Workbench!

---

Would you like help automating this setup or adding a script to start MySQL and get IP every time WSL launches?