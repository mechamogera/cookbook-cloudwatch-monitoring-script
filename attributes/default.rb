default["cloudwatch-monitoring-script"]["user"] = "ec2-user"
default["cloudwatch-monitoring-script"]["group"] = "ec2-user"
default["cloudwatch-monitoring-script"]["deploy_dir"] = "/home/ec2-user/script"
default["cloudwatch-monitoring-script"]["cron_path"] = "--mem-util --swap-util --disk-space-util --disk-path=/ --from-cron"
