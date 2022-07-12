#!/bin/bash

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get --allow-releaseinfo-change update -y &&
sudo apt-get update -y &&
sudo apt-get install -y rubygems build-essential &&
sudo apt-get install -y ruby-dev &&
sudo gem install fluentd --no-doc &&
sudo gem install fluent-plugin-lm-logs &&
sudo gem install fluent-plugin-gcloud-pubsub-custom -v 1.4.0 && 
curl  https://raw.githubusercontent.com/choudharypooja/lm-logs-gcp/main/fluentd.conf --output template.conf &&
envsubst < template.conf  | cat > fluentd.conf
fluentd -c ./fluentd.conf
