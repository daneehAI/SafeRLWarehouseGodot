import subprocess
import os

# Get the directory of the current script
script_dir = os.path.dirname(os.path.abspath(__file__))

# Define the path to your executable relative to the script directory
executable_path = os.path.join(script_dir, "MCheck", "MCheck.exe")

if not os.path.isfile(executable_path):
    print(f"Executable not found at {executable_path}")

# Define the paths to your input and output files relative to the script directory
transition_system_path = os.path.join(script_dir, "TransitionSystem.txt")
ctl_path = os.path.join(script_dir, "CTL.txt")
results_path = os.path.join(script_dir, "Results.txt")

if not os.path.isfile(transition_system_path):
    print(f"Input file not found at {transition_system_path}")
elif not os.path.isfile(ctl_path):
    print(f"Input file not found at {ctl_path}")


# Define arguments to pass
args = ["CTL", transition_system_path, ctl_path]

# Open the result file in write mode
with open(results_path, 'w') as result_file:
    # Run the executable and redirect stdout and stderr to the result file
    process = subprocess.Popen(
        [executable_path] + args,
        stdout=result_file,
        stderr=subprocess.PIPE
    )

    # Capture the errors
    _, stderr = process.communicate()
    
    if process.returncode != 0:
        print(f"Process exited with code {process.returncode}")

    # Try decoding with UTF-8 and fallback to latin-1 if needed
    #try:
    #    stderr_decoded = stderr.decode('utf-8')
    #except UnicodeDecodeError:
    #    stderr_decoded = stderr.decode('latin-1', errors='replace')

    # Print the output and errors
    #print("Errors:\n", stderr_decoded)
