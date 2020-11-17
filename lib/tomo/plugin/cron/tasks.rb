module Tomo::Plugin::Cron
  class Tasks < Tomo::TaskLibrary
    def hello
      remote.run "echo", "hello, world"
    end
  end
end
