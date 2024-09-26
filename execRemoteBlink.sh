#!/bin/bash

# Configuration
PI_IP="192.168.1.241"
PI_USER="exdanris"
LOCAL_SCRIPT_PATH="./remoteBlink.py"
REMOTE_SCRIPT_PATH="/home/exdanris/Desktop/remoteBlink.py"
VENV_PATH="/home/exdanris/global-venv"


# Copy the script to Raspberry Pi
scp "$LOCAL_SCRIPT_PATH" "${PI_USER}@${PI_IP}:${REMOTE_SCRIPT_PATH}"

# Execute the script on Raspberry Pi
# ssh "${PI_USER}@${PI_IP}" "python3 ${REMOTE_SCRIPT_PATH}"
ssh "${PI_USER}@${PI_IP}" "source ${VENV_PATH}/bin/activate && python3 ${REMOTE_SCRIPT_PATH} 2>&1"


# Optionally, remove the script from Raspberry Pi after execution
# ssh "${PI_USER}@${PI_IP}" "rm ${REMOTE_SCRIPT_PATH}"

echo "Script execution on Raspberry Pi completed."
