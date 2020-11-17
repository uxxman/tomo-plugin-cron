require "test_helper"

class Tomo::Plugin::Cron::TasksTest < Minitest::Test
  def test_show
    tester = Tomo::Testing::MockPluginTester.new("cron")

    tester.run_task("cron:show")

    assert_equal("crontab -l", tester.executed_script)
  end

  def test_install
    schedule  = "every 1.minute do\n"
    schedule += "command 'echo hi'\n"
    schedule += "end"

    temp_file = Tempfile.new
    temp_file << schedule
    temp_file.close

    tester = Tomo::Testing::MockPluginTester.new(
      "cron", settings: { cron_schedule_path: temp_file.path }
    )

    tester.run_task("cron:install")

    assert_equal(
      "echo #{'* * * * * /bin/bash -l -c \'echo hi\''.shellescape}'\n''\n' | crontab -",
      tester.executed_script
    )
  end

  def test_uninstall
    tester = Tomo::Testing::MockPluginTester.new("cron")

    tester.run_task("cron:uninstall")

    assert_equal("crontab -r", tester.executed_script)
  end
end
