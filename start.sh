#!/bin/bash

echo "IP ADDRESS:"
hostname -i

# Run the license server directly with the copied license file.
/usr/local/foundry/LicensingTools7.1/bin/RLM/rlm.foundry -c /opt/foundry_float.lic
