#!/usr/bin/env python3
import os
import subprocess

# This program creates copies of itself with decremented counter
i = 5
source = '#!/usr/bin/env python3\nimport os\nimport subprocess\n\n# This program creates copies of itself with decremented counter\ni = %d\nsource = %r\n\nif i >= 0:\n    filename = f"Sully_{i - 1}.py"\n    with open(filename, "w") as f:\n        f.write(source %% (i - 1, source))\n    \n    if i > 0:\n        # Make executable\n        os.chmod(filename, 0o755)\n        # Run the new program\n        subprocess.run(["python3", filename])\n'

if i >= 0:
    filename = f"Sully_{i - 1}.py"
    with open(filename, "w") as f:
        f.write(source % (i - 1, source))
    
    if i > 0:
        # Make executable
        os.chmod(filename, 0o755)
        # Run the new program
        subprocess.run(["python3", filename])

