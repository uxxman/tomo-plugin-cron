require "bundler/gem_tasks"
require "rake/testtask"
require "rubocop/rake_task"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

RuboCop::RakeTask.new

task default: %i[test rubocop]

# == "rake release" enhancements ==============================================

Rake::Task["release"].enhance do
  puts "Don't forget to publish the release on GitHub!"
  system "open https://github.com/uxxman/tomo-plugin-cron/releases"
end

task :disable_overcommit do
  ENV["OVERCOMMIT_DISABLE"] = "1"
end

task build: :disable_overcommit

task :verify_gemspec_files do
  git_files = `git ls-files -z`.split("\x0")
  gemspec_files = Gem::Specification.load("tomo-plugin-cron.gemspec").files.sort
  ignored_by_git = gemspec_files - git_files
  next if ignored_by_git.empty?

  raise <<~ERROR

    The `spec.files` specified in tomo-plugin-cron.gemspec include the
    following files that are being ignored by git. Did you forget to add them
    to the repo? If not, you may need to delete these files or modify the
    gemspec to ensure that they are not included in the gem by mistake:

    #{ignored_by_git.join("\n").gsub(/^/, '  ')}

  ERROR
end

task build: :verify_gemspec_files
