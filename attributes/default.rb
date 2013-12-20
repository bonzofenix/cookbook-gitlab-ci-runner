default['gitlab_ci_runner']['home'] = "/home/gitlab_ci_runner"
default['gitlab_ci_runner']['app_home'] = "#{default['gitlab_ci_runner']['home']}/gitlab-ci-runner"
default['gitlab_ci_runner']['user'] = "gitlab_ci_runner"
default['gitlab_ci_runner']['gitlab_ci_url'] = 'GITLAB_CI_URL'
default['gitlab_ci_runner']['gitlab_ci_token'] = 'GITLAB_CI_TOKEN'
default['gitlab_ci_runner']['ruby']['version'] = '2.0.0-p247'
default['gitlab_ci_runner']['git']['url'] = '2.0.0-p247'
default['gitlab_ci_runner']['git']['branch'] = '4-0-stable'
default['gitlab_ci_runner']['git']['url'] = "git://github.com/gitlabhq/gitlab-ci-runner.git"



