server '54.95.120.138', user: 'ec2-user', roles: %w{app db web}
set :ssh_options, keys: '/Users/suzukishouta/.ssh/id_rsa'