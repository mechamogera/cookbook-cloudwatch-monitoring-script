# cloudwatch-monitoring-script cookbook

This cookbook deploy [The Amazon Cloudwach Monitoring Script](http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/mon-scripts-perl.html) and set up cron for monitoring.

# Requirements

## support platform

 * amazon linux

# Usage

## Example Using Knife-solo and Berkshelf

```
gem install berkshelf knife-solo --no-rdoc --no-ri
knife solo init chef-repo
cd chef-repo
berks init
echo "cookbook 'cloudwatch-monitoring-script', :git => 'https://github.com/mechamogera/cookbook-cloudwatch-monitoring-script.git'" >> Berksfile
berks install --path cookbooks
knife solo prepare hoge
echo '{"run_list":["cloudwatch-monitoring-script"]}' > nodes/hoge.json
knife solo cook hoge
```

# Recipes

## default

Deploy [The Amazon Cloudwach Monitoring Script](http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/mon-scripts-perl.html) and set up cron for monitoring.

# Attributes

## default

 * default values

```
node['cloudwatch-monitoring-script'] = {
  'user' => 'ec2-user',
  'group' => 'ec2-user',
  'deploy_dir' => '/home/ec2-user/script',
  'cron_options' => '--mem-util --swap-util --disk-space-util --disk-path=/ --from-cron'
}
```

# Author

Author:: mechamogera (<mechamosura@gmail.com>)
