#!/bin/bash

# Check for the required argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <Solana address>"
  exit 1
fi

# Set the variables
ADDRESS=$1
BALANCE_URL="https://api.unminable.com/v4/address/$ADDRESS?coin=SOL"

# Make the request to the API
STATS=$(curl -s $BALANCE_URL)

# Check for errors
if [ -z "$STATS" ]; then
  echo "Error: Could not retrieve balance for $ADDRESS"
  exit 1
fi

# Pretty-print the JSON output
echo "$STATS" | python3 -m json.tool
