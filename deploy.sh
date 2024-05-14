#!/bin/bash

echo "Deploying to Helios"
# compilation war 
mvn package
## Remove existing deployment
ssh -p 2222 s373059@se.ifmo.ru "rm -rf ~/wildfly/wildfly-preview-26.1.3.Final/standalone/deployments/interactive-graph-ui-1.0-SNAPSHOT.war"
# add new deployment
scp -P 2222 ./target/interactive-graph-ui-1.0-SNAPSHOT.war s373059@se.ifmo.ru:~/wildfly/wildfly-preview-26.1.3.Final/standalone/deployments