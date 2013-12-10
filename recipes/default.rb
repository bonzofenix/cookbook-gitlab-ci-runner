rbenv_ruby node['gitlab_ci_runner']['ruby']['version'] do
  global true
end

rbenv_gem 'bundler' do
  ruby_version node['gitlab_ci_runner']['ruby']['version']
end

execute "sudo adduser --disabled-login --gecos 'GitLab CI Runner' gitlab_ci_runner" do
  not_if 'id -u gitlab_ci_runner'
end

git node['gitlab_ci_runner']['app_home'] do
  repository node['gitlab_ci_runner']['git']['url']
  reference node['gitlab_ci_runner']['git']['branch']
  action :checkout
  user 'gitlab_ci_runner'
end

ENV['CI_SERVER_URL'] = node['gitlab_ci_runner']['gitlab_ci_url']
ENV['REGISTRATION_TOKEN'] = node['gitlab_ci_runner']['gitlab_ci_token']

bash 'setup_runner' do
  cwd node['gitlab_ci_runner']['app_home']
  code <<-EOH
          sudo -u gitlab_ci_runner -H bundle install
          sudo rbenv rehash
          bundle exec ./bin/setup
         EOH
   user 'gitlab_ci_runner'
end


bash 'setup_gitlab_ci_daemon' do
  cwd node['gitlab_ci_runner']['app_home']
  code <<-EOH
          sudo cp #{node['gitlab_ci_runner']['app_home']}/lib/support/init.d/gitlab_ci_runner /etc/init.d/gitlab-ci-runner
          sudo chmod +x /etc/init.d/gitlab-ci-runner
          sudo update-rc.d gitlab-ci-runner defaults 21
         EOH
   user 'gitlab_ci_runner'
end

execute 'sudo service gitlab-ci-runner start'

