#!/bin/sh
echo "Creating scratch org..."
sfdx force:org:create -f config/project-scratch-def.json -d 30 -s -a $1
echo "Pushing project in progress..."
sfdx force:org:open -p 'lightning/setup/DeployStatus/home'

sfdx force:source:push -f

echo "Post Setup"
sfdx force:apex:execute -f scripts/post-setup.apex