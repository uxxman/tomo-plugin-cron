module Tomo::Plugin::Cron
  class Tasks < Tomo::TaskLibrary
    def show
      remote.run "crontab -l", raise_on_error: false
    end
  end
end
