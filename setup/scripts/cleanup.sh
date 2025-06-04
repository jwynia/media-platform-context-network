#!/bin/bash

# Media Platform Context Network Cleanup Script

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Media Platform Context Network Cleanup${NC}"
echo "============================================"

# Check if context network exists
if [ ! -d "../context-network" ]; then
    echo -e "${RED}Error: context-network directory not found${NC}"
    echo "Please run configure.sh first to set up your context network"
    exit 1
fi

# Check if configuration is complete
if [ ! -f "../context-network/foundation/platform_definition.md" ]; then
    echo -e "${RED}Error: Platform definition not found${NC}"
    echo "Please complete the configuration process before cleanup"
    exit 1
fi

# Confirmation prompt
echo -e "${YELLOW}Warning: This will remove the setup directory${NC}"
echo "The configured context network will be preserved"
echo -e "Directory to be removed: ${RED}setup/${NC}"
echo
read -p "Are you sure you want to proceed? (y/N) " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Log cleanup in updates.md
    echo "Logging cleanup..."
    echo -e "\n## Setup Cleanup - $(date +"%Y-%m-%d")" >> ../context-network/meta/updates.md
    echo "- Removed setup directory after successful configuration" >> ../context-network/meta/updates.md
    
    # Remove setup directory
    echo "Removing setup directory..."
    cd ..
    rm -rf setup/
    
    echo -e "${GREEN}Cleanup complete!${NC}"
    echo "============================================"
    echo "Your context network is ready to use."
    echo "Begin by reviewing the documentation in context-network/discovery.md"
else
    echo -e "${YELLOW}Cleanup cancelled${NC}"
    echo "Setup directory has been preserved"
fi
