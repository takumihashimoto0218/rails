directory '/var/www/hanatane_collection'
rackup "/var/www/hanatane_collection/config.ru"
environment 'production'

tag ''

pidfile "/var/www/hanatane_collection/tmp/pids/puma.pid"
state_path "/var/www/hanatane_collection/tmp/pids/puma.state"
stdout_redirect '/var/www/hanatane_collection/log/puma_access.log', '/var/www/hanatane_collection/log/puma_error.log', true

threads 0,16

bind 'unix:///var/www/hanatane_collection/tmp/sockets/puma.sock'

workers 0

restart_command 'bundle exec puma'

prune_bundler

on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = ""
end
