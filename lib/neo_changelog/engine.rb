module NeoChangelog
  class Engine < ::Rails::Engine
    rake_tasks do
      load 'neo_changelog/tasks.rake'
    end
  end
end
