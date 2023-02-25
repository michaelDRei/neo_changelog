module NeoChangelog
  ROOT_PATH = File.expand_path "../", __FILE__

  class Application
      def rake_tasks do
        Dir[File.join(ROOT_PATH, "/lib/tasks/", "**/*.rake")].each do |file|
          load file
        end
      end
    end
  end
end
