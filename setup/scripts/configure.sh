#!/bin/bash

# Media Platform Context Network Configuration Script

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Media Platform Context Network Configuration${NC}"
echo "================================================"

# Function to check if a file exists and is not empty
check_file() {
    if [ ! -f "$1" ] || [ ! -s "$1" ]; then
        echo -e "${RED}Error: $1 is missing or empty${NC}"
        exit 1
    fi
}

# Check all questionnaire files exist
echo "Checking questionnaire files..."
check_file "questionnaire/01_core_purpose.md"
check_file "questionnaire/02_content_types.md"
check_file "questionnaire/03_distribution.md"
check_file "questionnaire/04_audience.md"
check_file "questionnaire/05_business_model.md"

# Create base directory structure
echo "Creating base directory structure..."
mkdir -p ../context-network/{foundation,content,distribution,audience,operations,decisions,planning,meta,archive}

# Copy core files
echo "Copying core files..."
cp templates/node_template.md ../context-network/meta/
cp templates/decision_template.md ../context-network/decisions/

# Function to detect platform type from core purpose
detect_platform_type() {
    local purpose_file="questionnaire/01_core_purpose.md"
    if grep -q "\[x\] Commercial Content" "$purpose_file"; then
        echo "commercial"
    elif grep -q "\[x\] Community Building" "$purpose_file"; then
        echo "community"
    elif grep -q "\[x\] Education" "$purpose_file"; then
        echo "educational"
    elif grep -q "\[x\] Documentation" "$purpose_file"; then
        echo "open_source"
    else
        echo "community" # Default to community template
    fi
}

# Function to check if commercial components are needed
needs_commercial() {
    local business_file="questionnaire/05_business_model.md"
    if grep -q "\[x\] Yes (Will include revenue components)" "$business_file" || \
       grep -q "\[x\] Hybrid" "$business_file"; then
        return 0 # true
    else
        return 1 # false
    fi
}

# Detect platform type
PLATFORM_TYPE=$(detect_platform_type)
echo -e "${GREEN}Detected platform type: $PLATFORM_TYPE${NC}"

# Copy appropriate template structure
echo "Applying template structure..."
case $PLATFORM_TYPE in
    commercial)
        cp templates/commercial.md ../context-network/foundation/structure.md
        mkdir -p ../context-network/{products,marketing,revenue,commerce}
        ;;
    community)
        cp templates/community.md ../context-network/foundation/structure.md
        mkdir -p ../context-network/{community,engagement}
        ;;
    educational)
        cp templates/educational.md ../context-network/foundation/structure.md
        mkdir -p ../context-network/{curriculum,courses,learning,educators}
        ;;
    open_source)
        cp templates/open_source.md ../context-network/foundation/structure.md
        mkdir -p ../context-network/{documentation,knowledge_base,community,development}
        ;;
esac

# Add commercial components if needed
if needs_commercial; then
    echo "Adding commercial components..."
    mkdir -p ../context-network/commercial/{products,marketing,revenue,commerce}
fi

# Create initial platform definition
echo "Creating platform definition..."
cat > ../context-network/foundation/platform_definition.md << EOF
# Platform Definition

## Classification
- **Domain:** Core Concept
- **Stability:** Static
- **Abstraction:** Conceptual
- **Confidence:** Established

## Purpose
[Generated from questionnaire/01_core_purpose.md]

## Content
[Generated from questionnaire responses]

## Implementation
Based on the $PLATFORM_TYPE template
$(if needs_commercial; then echo "Including commercial components"; fi)

## Next Steps
1. Review and customize the generated structure
2. Complete the platform definition details
3. Begin implementing specific components
EOF

# Update discovery.md
echo "Updating discovery.md..."
cp templates/$PLATFORM_TYPE.md ../context-network/discovery.md

# Create updates.md
echo "Creating updates log..."
cat > ../context-network/meta/updates.md << EOF
# Context Network Updates

## Initial Setup - $(date +"%Y-%m-%d")
- Created initial context network structure
- Applied $PLATFORM_TYPE template
$(if needs_commercial; then echo "- Added commercial components"; fi)
- Set up base directory structure
- Created initial platform definition
EOF

echo -e "${GREEN}Configuration complete!${NC}"
echo "================================================"
echo "Next steps:"
echo "1. Review generated structure in context-network/"
echo "2. Customize platform_definition.md"
echo "3. Begin implementing specific components"
echo "4. Remove setup/ directory when ready"
