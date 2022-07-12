#!/bin/bash

sudo apt-get update -y &&
sudo apt-get install -y rubygems build-essential &&
sudo apt-get install -y ruby-dev &&
sudo gem install fluentd --no-doc &&
sudo gem install fluent-plugin-lm-logs &&
sudo gem install fluent-plugin-gcloud-pubsub-custom=1.4.0 && 
curl  https://raw.githubusercontent.com/choudharypooja/lm-logs-gcp/main/fluentd.conf --output template.conf &&
envsubst < template.conf  | cat > fluentd.conf
fluentd -c ./fluentd.conf
