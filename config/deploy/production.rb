server '35.79.234.81', user: 'ec2-user', roles: %w{app db web}
set :ssh_options, keys: '/Users/suzukishouta/.ssh/aws_lightsail.pem'