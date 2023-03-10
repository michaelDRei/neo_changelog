require "rake"
require "bundler"
require_relative "../neo_changelog/utils"

namespace :changelog do
  namespace :index do
    desc "List all tasks"
    task :task do
      task = NeoChangelog::Task.new()
  
      puts task.index
    end
  end

  namespace :create do
    directory = NeoChangelog::Directory

    desc "Create file to describe the issue that is under development"
    task :task, [:task, :i18n] do |t, args|
      task = 
        NeoChangelog::Task.new(args[:task], args[:i18n])

      task.create
    end

    desc "Create config file to store developer name"
    task :config, [:developer] do |t, args|
      config = 
        NeoChangelog::Config.new(args[:developer])

      config.create
    end

    desc "Create directories"
    task :directory do
      directory.new(NeoChangelog::Task::DIRECTORY).create
      directory.new(NeoChangelog::Changelog::DIRECTORY).create
    end
  end

  namespace :delete do
    directory = NeoChangelog::Directory

    desc "Delete tasks directory"
    task :tasks do
      directory.new(NeoChangelog::Task::DIRECTORY).delete
    end

    desc "Delete release directory"
    task :release do
      directory.new(NeoChangelog::Changelog::DIRECTORY).delete
    end

    desc "Delete config directory"
    task :config do
      directory.new(NeoChangelog::Config::DIRECTORY).delete
    end
  end

  desc "Create release file"
  task :create do
    changelog = NeoChangelog::Changelog.new
    changelog.create
  end
end
