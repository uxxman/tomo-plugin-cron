require "test_helper"

class Tomo::Plugin::CronTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil Tomo::Plugin::Cron::VERSION
  end
end
