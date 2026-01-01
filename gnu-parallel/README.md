# GNU Parallel Demo

sudo apt install parallel

GNU Parallel allows you to run multiple shell commands concurrently using all CPU cores.

Usage:
chmod +x loop.sh
parallel --line-buffer bash loop.sh ::: 1 2 3

Notes:
- --line-buffer enables real-time output
- Output is buffered by default
- Infinite loops may consume high CPU

Stop:
Ctrl + C
