# tomo-plugin-cron

[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/uxxman/tomo-plugin-cron/CI)](https://github.com/uxxman/tomo-plugin-cron/actions?query=workflow%3ACI)
[![Code Climate coverage](https://img.shields.io/codeclimate/coverage/uxxman/tomo-plugin-cron)](https://codeclimate.com/github/uxxman/tomo-plugin-cron)
[![Code Climate maintainability](https://img.shields.io/codeclimate/maintainability/uxxman/tomo-plugin-cron)](https://codeclimate.com/github/uxxman/tomo-plugin-cron)
[![Gem](https://img.shields.io/gem/v/tomo-plugin-cron)](https://rubygems.org/gems/tomo-plugin-cron)

This is a [tomo](https://github.com/mattbrictson/tomo) plugin that provides tasks for managing cron jobs using ruby DSL provided by the awesome [whenever](https://github.com/javan/whenever) gem.

## Installation

Run:

```
$ gem install tomo-plugin-cron
```

Or add it to your Gemfile:

```ruby
gem "tomo-plugin-cron"
```

Then add the following to `.tomo/config.rb`:

```ruby
plugin "cron"
```

Now, create a file **schedule.rb** alongside your tomo config file and start writing cron jobs in ruby.

```ruby
# .tomo/schedule.rb

every 3.hours do
  rake "my:rake:task"
  runner "MyModel.some_process"
  command "/usr/bin/my_great_command"
end

every 1.day, at: '4:30 am' do
  runner "MyModel.task_to_run_at_four_thirty_in_the_morning"
end
```
For more examples, checkout out [whenever](https://github.com/javan/whenever#example-schedulerb-file) gem readme.


## Settings

| Name                  | Required | Purpose | Default |
| --------------------- | -------- | ------- | ------- |
| `cron_schedule_path`  | No       | Schedule file location | `.tomo/schedule.rb`   |

## Tasks

### cron:show

Print out current content of crontab.

### cron:install

Translate schedules defined inside your **schedule.rb** file into cron syntax and write them to your host's crontab.

### cron:uninstall

Delete host's crontab.

## Support

If you want to report a bug, or have ideas, feedback or questions about the gem, [let me know via GitHub issues](https://github.com/uxxman/tomo-plugin-cron/issues/new) and I will do my best to provide a helpful answer. Happy hacking!

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).

## Code of conduct

Everyone interacting in this project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).

## Contribution guide

Pull requests are welcome!
