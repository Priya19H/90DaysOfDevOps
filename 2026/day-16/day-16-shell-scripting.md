# TASK 1: My First Script
* What I Did
  - Created a file hello.sh
  - Added shebang (#!/bin/bash) at the top to tell the kernel which shell interpreter to use
  - Printed "Hello, DevOps!" using echo
  - Made it executable using chmod 754/764
  - Ran the script successfully

__Key Learning__  
__What happens without the shebang?__
he script may run using the default shell instead of bash, which could lead to unexpected behavior if shell-specific syntax is used.

# TASK 2: Variables
* What I Did
  - Created variables.sh with variables for NAME and ROLE
  - Printed a formatted message using variable interpolation
  - Tested the difference between single and double quotes  

__Key Learning: Single Quotes vs Double Quotes__
  - Single quotes ('): Treats everything as literal text — variables are NOT expanded
  - Double quotes ("): Allows variable expansion and displays the actual variable values  
__Result: When using single quotes, no variable values were displayed; with double quotes, all variables expanded correctly.__

# TASK 3: User Input with read
* What I Did
  - Created greet.sh that prompts for user's name and favorite tool
  - Used read -p command to combine prompt and input collection
  - Displayed a personalized greeting with the collected information

__Key Learning__   
The read -p command makes scripts interactive by combining the prompt and input in one line, creating a better user experience.

# TASK 4: If-Else Conditions
__4.1: Number Checker (check_number.sh)__
What I Did:
  - Created a script that takes a number as input
  - Used if-elif-else to check if the number is positive, negative, or zero
  - Printed the appropriate result based on the condition  

__4.2: File Existence Checker (file_check.sh)__
What I Did:
  - Created a script that asks for a filename
  - Used the -f test operator to check if the file exists
  - Displayed appropriate messages based on file existence

__Key Learning__
  - Syntax precision is critical!
  - Proper spacing around brackets is mandatory: [ condition ] not [condition]
  - Indentation improves readability and helps avoid errors
  - Test operators like -gt (greater than), -lt (less than), and -f (file exists) enable conditional logic
  - Commas, brackets, and quotes placement matters significantly

# TASK 5: Combine It All - Service Status Checker
  What I Did
    - Created server_check.sh with a stored service name variable (nginx)
    - Asked user if they want to check the service status (y/n)
    - If 'y': Used systemctl is-active to check if service is running and printed whether it's active or not
    - If 'n': Printed "Skipped"
__Key Learning__
  - Nested conditionals allow for more sophisticated decision-making
  - systemctl is-active efficiently checks service status  
  
# Top 3 Key Takeaways
__1. Syntax Precision:__  
     Spacing, brackets, quotes, and operators must be exact — shell scripting is unforgiving of syntax errors. Even a single missing space can break the entire script.  

__2. Quote Behavior:__  
     Single quotes preserve literal strings, while double quotes enable variable expansion — this is critical for displaying dynamic content and variable values.  

__3. Conditionals Enable Logic:__  
   if-else statements combined with test operators (-f, -gt, -lt) allow scripts to make intelligent decisions based on input and system state, making automation possible.  





