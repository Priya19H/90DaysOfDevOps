Day 02 – Linux Architecture, Processes, and systemd

The core components of Linux (kernel, user space, init/systemd)
# Kernel :
 The kernel is the heart of the Linux operating system. It is primarily written in C language. After compilation, the kernel is stored as a binary (machine language) file, usually found in /boot/vmlinuz. The kernel manages hardware resources, memory, processes, and provides system calls for applications.
Kernel and Shell Interaction :
  •	 The kernel talks to hardware via drivers.
  •	 A shell (sh, bash, zsh) lets users interact with it.
  •	 Commands → system calls → kernel executes → results → shell shows output.
      # Command Flow :
      1.	User → types command.
      2.	Shell → sends system calls.
      3.	Kernel → interacts with hardware.
      4.	Hardware → performs task.
      5.	Output → shown to user.

# User Space :
•	User space in Linux means the part of the system where normal programs run, separate from the kernel.
•	User space is where applications like browsers, text editors, and shells (bash, zsh) operate.
•	Kernel space is where the Linux kernel runs — managing memory, devices, and system calls.

# init/system
After boot, the kernel starts the first user-space process: init (traditional) or systemd (modern). This process always has PID 1 and is the ancestor of all other processes.
•	First process (PID 1) → Started directly by the kernel.
•	Parent of all processes → Every other process descends from it.
•	Starts services → Filesystems, daemons, networking, login, GUI.
•	Manages processes → Supervises, restarts, and logs services.

# Explain process states (running, sleeping, zombie, etc.)
>> Process states:
1.	Running → Actively using the CPU or waiting in the run queue.
2.	Sleeping → Waiting for something (like input/output).
        •	Interruptible sleep (S) → Can be interrupted by signals.
        •	Uninterruptible sleep (D) → Cannot be interrupted, usually waiting on hardware.
3.	Stopped → Paused by a signal (e.g., Ctrl+Z), not using CPU.
4.	Zombie → Finished execution but still listed in the process table until the parent reads its exit status.
5.	Traced → Being debugged, controlled by a debugger.

# List 5 commands you would use daily
-	cd (To enter into directory)
-	mkdir (To create directory)
-	touch (Create file with 0 bytes)
-	ls (To view directory contents)
-	cat (To view file contents)


