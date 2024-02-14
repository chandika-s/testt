#!/bin/bash

DEPLOYMENT_ID=$(aws deploy list-deployments --application-name wordpress-app  --deployment-group-name wordpress-ec2 --query "deployments[0]" --output text)
DEPLOYMENT_GROUP_ID=$(aws deploy get-deployment-group --application-name wordpress-app --deployment-group-name wordpress-ec2 | jq .deploymentGroupInfo.deploymentGroupId | xargs)
sudo cp -r /opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive/* /var/www/html/

