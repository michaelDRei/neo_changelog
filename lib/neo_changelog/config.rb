module NeoChangelog
  class Config
    require_relative "utils"

    DIRECTORY = "#{Dir.pwd}/changelogs/config"
    FILE_CREATED = "file created"

    def initialize(developer = nil)
      self.developer = developer
    end

    def create
      generate_file
    rescue
      nil
    end

    def name
      read_file
    end

    private

    def generate_file
      directory.create

      contents = ["nickname: #{developer} "]

      File.open("#{DIRECTORY}/developer.yml", 'w')
      File.write("#{DIRECTORY}/developer.yml", contents.join("\n"), mode: 'a')

      logger.info("developer.yml #{FILE_CREATED}")
    end

    def generate_directory
      return if File.directory?(DIRECTORY)

      FileUtils.mkdir_p(DIRECTORY)
      FileUtils.ln(DIRECTORY)
    rescue
      nil
    end

    def read_file
      return unless File.directory?(DIRECTORY)

      line = []

      file = File.open("#{DIRECTORY}/developer.yml", 'r')

      file.each_line { |content| line.push(content) }

      content = line[0].gsub('nickname: ', '')
      content.gsub(" ", "")
    end

    def logger
      Logger.new($stdout)
    end

    def directory
      @directory ||= Directory.new(DIRECTORY)
    end

    attr_accessor :task, :developer, :i18n
  end
end
