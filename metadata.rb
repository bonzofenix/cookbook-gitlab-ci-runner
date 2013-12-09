name             'gitlab-ci-runner'
maintainer       "bonzofenix"
maintainer_email "alan.moran@wmg.com"
license          'All rights reserved'
description      'Installs/Configures gitlab-ci-runner'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'


%w{ apt git build-essential openssl rbenv }.each do |dep|
  depends dep
end
