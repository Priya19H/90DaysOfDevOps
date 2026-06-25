##	Run and record output for at least 6 commands
#	Process Checks:
1.	ps command :
    - Displays information about running processes.
    - Shows all processes with details like PID, user, CPU/memory usage, and command.

2.	Top command:
    - Provides a dynamic, real-time view of system processes.
    - Displays processes sorted by CPU usage, memory consumption, and other metrics.
    - Use q to quit, k to kill a process, and h for help.

##

#	Service checks
1.	Systemctl status:
    >> systemctl status ssh ((or nginx, docker, jenkins depending on availability))
    - Checks the status of a specific service.
    - Shows whether the NGINX service is active, inactive, or failed, along with logs.


2.	Systemctl list-units :
    >> ss -tulnp | grep 80
    - Lists all active units (services, sockets, targets).
    - Displays all running services and their states.

##

Include 2 log commands (journalctl -u <service>, tail -n 50, etc.)
1.  Check logs
    >> tail -f /var/log/nginx/error.log

##
 
** Observation: **
- Identified whether service is running
- Verified port availability
- Inspected logs for errors

📌 Why this matters:
This basic flow is used in real production troubleshooting.  

