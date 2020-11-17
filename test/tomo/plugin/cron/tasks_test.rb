require "test_helper"

class Tomo::Plugin::Cron::TasksTest < Minitest::Test
  def setup
    @tester = Tomo::Testing::MockPluginTester.new("cron")
  end

  def test_show
    @tester.run_task("cron:show")

    assert_equal("crontab -l", @tester.executed_script)
  end
end
