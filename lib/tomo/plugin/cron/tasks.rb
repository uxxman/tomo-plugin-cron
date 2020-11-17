require "whenever"

module Tomo::Plugin::Cron
  class Tasks < Tomo::TaskLibrary
    def show
      remote.run "crontab -l", raise_on_error: false
    end

    def install
      require_setting :cron_schedule_path

      crontab = Whenever.cron(whenever_options)

      remote.run "echo #{crontab.shellescape} | crontab -"
    end

    def uninstall
      remote.run "crontab -r"
    end

    private

    def whenever_options
      {}.tap do |options|
        options[:file] = settings[:cron_schedule_path]
        options[:set]  = "path=#{paths.current}"
        options[:set] += "&environment=#{settings.dig(:env_vars, :RAILS_ENV) || 'production'}"
      end
    end
  end
end
