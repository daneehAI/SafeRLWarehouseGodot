import subprocess

# Define the path to your executable
executable_path = "MCheck\MCheck.exe"

# Define arguments to pass
args = ["CTL", "TransitionSystem.txt", "CTL.txt", "Results.txt"]

# Run the executable
process = subprocess.Popen([executable_path] + args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

# Capture the output and errors
stdout, stderr = process.communicate()

# Print the output and errors
print("Output:\n", stdout.decode())
print("Errors:\n", stderr.decode())
