include_recipe "apt"
include_recipe "sudo"
include_recipe "build-essential"
include_recipe "git"
include_recipe "rbenv::system"
include_recipe "rbenv::ruby_build"


## Create user for Gitlab.
user node['gitlab_ci_runner']['user'] do
  comment "GitLab Ci Runner"
  home node['gitlab_ci_runner']['home']
  shell "/bin/bash"
  supports :manage_home => true
end

user node['gitlab_ci_runner']['user'] do
  action :lock
end
