module NeoChangelog
  class Task
    require_relative "utils"

    DIRECTORY = "#{Dir.pwd}/changelogs/develop"
    FILE_CREATED = "file created"

    def initialize(task = nil, i18n = nil)
      self.task = task
      self.i18n = i18n
    end

    def create
      generate_task
    rescue
      nil
    end

    def index
      tasks
    rescue StandardError => e
      logger.error(e.message)
      nil
    end

    private

    def generate_task
      directory.create

      contents = 
      [
        "issue: #{task}",
        "developer: #{developer.name} ",
        "i18n: #{i18n}"
      ]

      File.open("#{DIRECTORY}/#{task}.yml", 'w')
      File.write("#{DIRECTORY}/#{task}.yml", contents.join("\n"), mode: 'a')

      logger.info("#{task}.yml #{FILE_CREATED}")
    end

    def generate_directory
      return if File.directory?(DIRECTORY)

      FileUtils.mkdir_p(DIRECTORY)
      FileUtils.ln(DIRECTORY)
    rescue
      nil
    end

    def tasks
      return logger.info("#{DIRECTORY} not found") unless directory.exist?

      files = []

      tasks = Dir.glob("#{DIRECTORY}/*.yml").each { |file| }

      tasks.map { |name| files.push(name.gsub!("#{DIRECTORY}/", '')) }

      files
    end

    def logger
      Logger.new($stdout)
    end

    def directory
      @directory ||= Directory.new(DIRECTORY)
    end

    def developer
      @developer = NeoChangelog::Config.new()
    end

    attr_accessor :task, :i18n
  end
end
