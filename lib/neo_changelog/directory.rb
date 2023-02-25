module NeoChangelog
  class Directory
    DIRECTORY_CREATED = "create directory"
    def initialize(path = nil)
      self.path = path
    end

    def create
      return if File.directory?(path)

      FileUtils.mkdir_p(path)
      FileUtils.ln(path)

      logger.info("#{DIRECTORY_CREATED} #{path}")
    rescue
      nil
    end

    def delete
      return FileUtils.rm_rf(path) if exist?
    rescue StandardError => e
      logger.error(e.message)
      nil
    end

    def exist?
      Dir.exist?(path)
    end

    private

    def logger
      Logger.new($stdout)
    end

    attr_accessor :path
  end
end
