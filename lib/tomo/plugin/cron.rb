require "tomo"
require_relative "cron/tasks"
require_relative "cron/version"

module Tomo
  module Plugin
    module Cron
      extend Tomo::PluginDSL

      defaults cron_schedule_path: ".tomo/schedule.rb"

      tasks Tomo::Plugin::Cron::Tasks
    end
  end
end
