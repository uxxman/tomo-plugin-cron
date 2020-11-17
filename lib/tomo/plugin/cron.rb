require "tomo"
require_relative "cron/tasks"
require_relative "cron/version"

module Tomo
  module Plugin
    module Cron
      extend Tomo::PluginDSL

      # TODO: initialize this plugin's settings with default values
      # defaults cron_setting: "foo",
      #          cron_another_setting: "bar"

      tasks Tomo::Plugin::Cron::Tasks
    end
  end
end
