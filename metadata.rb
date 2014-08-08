name             'corosync'
maintainer       'Blue Box Group, Inc.'
maintainer_email 'support@bluebox.net'
license          'Apache 2.0'
description      'Installs/Configures corosync'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

supports 'ubuntu', '>= 12.04'
supports 'debian', '>= 7.0'

%w{rhel centos scientific}.each do |os|
  supports os, '>= 6.0'
end
