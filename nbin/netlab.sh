#!/bin/bash

# Define function to display usage
usage() {
    echo "Usage: $0 <hostname>"
    echo "       Where <hostname> is one of the following: netserv1, netserv2, netserv3"
    exit 1
}

# Parse command line arguments
if [ $# -ne 1 ]; then
    usage
fi

HOSTNAME="$1"

# Set the user and IP address based on the hostname
case $HOSTNAME in
    netserv1)
        USER="nclshrnk"
        TARGET_IP="129.69.172.4"
        ;;
    netserv2)
        USER="nclshrnk"
        TARGET_IP="129.69.172.5"
        ;;
    netserv3)
        USER="nclshrnk"
        TARGET_IP="129.69.172.6"
        ;;
    *)
        echo "Invalid hostname."
        usage
        ;;
esac

# Execute knock_lab
knock_lab --target "$TARGET_IP"

# Execute SSH to the IP address
ssh -L 8888:localhost:8888 "$USER"@"$TARGET_IP"
