#!/bin/bash
# Detect the project type from context

# Software indicators
if [ -f "package.json" ] || [ -f "pom.xml" ] || [ -f "requirements.txt" ] || [ -f "go.mod" ] || [ -f "Cargo.toml" ]; then
    echo "software"
    exit 0
fi

# Business indicators
if [ -f "business-plan.md" ] || [ -f "market-analysis.md" ] || [ -f "strategy.md" ]; then
    echo "business"
    exit 0
fi

# Personal indicators
if [ -f "goals.md" ] || [ -f "journal.md" ] || [ -d "habits" ]; then
    echo "personal"
    exit 0
fi

# Default
echo "general"
