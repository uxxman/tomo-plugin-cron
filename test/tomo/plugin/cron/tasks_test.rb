require "test_helper"

class Tomo::Plugin::Cron::TasksTest < Minitest::Test
  def setup
    @tester = Tomo::Testing::MockPluginTester.new("cron")
  end

  def test_hello
    @tester.run_task("cron:hello")
    assert_equal('echo hello,\ world', @tester.executed_script)
  end
end
