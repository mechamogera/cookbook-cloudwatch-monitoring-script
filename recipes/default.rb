#
# Cookbook Name:: cookbook-cloudwatch-monitoring-script/
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

directory "#{node["cloudwatch-monitoring-script"]["deploy_dir"]}" do
  owner node["cloudwatch-monitoring-script"]["user"]
  group node["cloudwatch-monitoring-script"]["group"]
  action :create
end

script "install_cloudwatch-monitoring-script" do
  interpreter "bash"
  user node["cloudwatch-monitoring-script"]["user"]
  cloudwatchd Dir.tmpdir
  code <<-EOH
    wget http://ec2-downloads.s3.amazonaws.com/cloudwatch-samples/CloudWatchMonitoringScripts-v1.1.0.zip
    unzip CloudWatchMonitoringScripts-v1.1.0.zip
    rm CloudWatchMonitoringScripts-v1.1.0.zip
    mv aws-scripts-mon #{node["cloudwatch-monitoring-script"]["deploy_dir"]}
  EOH
  not_if {File.exists?("#{node["cloudwatch-monitoring-script"]["deploy_dir"]}/aws-scripts-mon")}
end

cron "cloudwatch-monitoring" do
  user node["cloudwatch-monitoring-script"]["user"]
  minute "*/5"
  command %Q!#{node["cloudwatch-monitoring-script"]["deploy_dir"]}/aws-scripts-mon/mon-put-instance-data.pl #{node["cw-monitoring-script"]["cron_options"]}!
  action :create
end
