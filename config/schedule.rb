# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
set :output, "log/cron_log.log"
env :PATH, ENV['PATH']
set :environment, 'development'
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

every 1.day, at: '7:00' do
  rake 'blog_mail:daily_digest'
end
#
# every 7.days, at: '7:00' do
#   runner 'ApplicationMailer.weekly_digest'
# end
#
# every 2.minutes do
#   rake "blog_mail:digest_weekly"
# end

# Learn more: http://github.com/javan/whenever
