# Day 08 – Cloud Server Setup: Docker, Nginx & Web Deployment

## Task
Today's goal is to **deploy a real web server on the cloud** and learn practical server management.

- Launch a cloud instance (AWS EC2 or Utho)
- Connect via SSH
- Install Nginx
- Configure security groups for web access (port 80 by default for nginx)
- Extract and save logs to a file
- Verify your webpage is accessible from the internet


---

## Expected Output
By the end of today, you should have:

1. A markdown file named: `day-08-cloud-deployment.md`
2. Screenshots showing:
   - SSH connection to your server
   - Nginx welcome page accessible from browser
   - Log file contents
3. The log file: `nginx-logs.txt`

---

## Guidelines

### Part 1: Launch Cloud Instance & SSH Access (15 minutes)

**Step 1: Create a Cloud Instance**


**Step 2: Connect via SSH**


---

### Part 2: Install Docker & Nginx (20 minutes)

**Step 1: Update System**
```
sudo apt-get update
```

**Step 3: Install Nginx**
```
sudo apt-get install nginx -y
```

**Verify Nginx is running:**  
  
<img width="713" height="252" alt="image" src="https://github.com/user-attachments/assets/093a44d3-5370-48c6-9128-182ae1b0ac84" />

---

### Part 3: Security Group Configuration (10 minutes)

**Test Web Access:**
Open browser and visit: `http://<your-instance-ip>`

You should see the **Nginx welcome page**!

📸 **Screenshot this page** - you'll need it for submission

---

### Part 4: Extract Nginx Logs (15 minutes)

**Step 1: View Nginx Logs**

**Step 2: Save Logs to File**

**Step 3: Download Log File to Your Local Machine**
```bash
# On your local machine (new terminal window)
# For AWS:
scp -i your-key.pem ubuntu@<your-instance-ip>:~/nginx-logs.txt .

# For Utho:
scp root@<your-instance-ip>:~/nginx-logs.txt .
```

---


## Commands Used
[List the key commands you used]
```
sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl status nginx
netstat -tunlp | grep 80
sudo ufw status
sudo ufw allow 80,443/tcp

```


## Challenges Faced
- I successfully installed Nginx, but the default web page was not displayed.
- To troubleshoot, I first verified whether the service was enabled using the systemctl command, and confirmed  that it was active.
- Next, I checked if the required ports were listening; ports 80 and 443 were not open.
- I enabled them using the ufw firewall command.
- After updating the firewall rules, I accessed the Nginx web page again, and it loaded successfully.


## What I Learned
**1. Service verification:** Always confirm that the Nginx service is running and enabled using systemctl. Even if installed correctly, the service must be active to serve content.

**2. Port accessibility:** Web servers rely on ports 80 (HTTP) and 443 (HTTPS). If these are not open, the server cannot respond to client requests.

**3. Firewall configuration:** Firewalls like UFW can block traffic even when the service is running. Opening the correct ports is essential for external access.

**4. Systematic troubleshooting:** By checking service status, then ports, then firewall rules, you applied a logical sequence that quickly isolated the issue.

**5. Validation after changes:** Testing the Nginx page after each fix ensures that the problem is resolved and confirms the effectiveness of your actions.
   
---


## Why This Matters for DevOps

This exercise teaches you:
- **Cloud infrastructure provisioning** - launching and configuring servers
- **Remote server management** - SSH, security, access control
- **Service deployment** - installing and running applications
- **Log management** - accessing and analyzing logs
- **Security** - configuring firewalls and security groups

These are core skills for any DevOps engineer working in production.

---


Happy Learning
**TrainWithShubham**
