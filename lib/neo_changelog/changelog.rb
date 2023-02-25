module NeoChangelog
  class Changelog
    require_relative "utils"

    DEVELOP_DIRECTORY = "#{Dir.pwd}/changelogs/develop"
    DIRECTORY = "#{Dir.pwd}/changelogs/release"
    FILE_CREATED = "file created"

    def initialize
      @hash = {}
    end

    def create
      @content ||= read_file_tasks

      generate_file(@content)
    end

    private

    def generate_file(content)
      directory.create

      contents = content_changelog(content)

      File.open("#{DIRECTORY}/description.md", 'w')
      File.write("#{DIRECTORY}/description.md",
        contents.join("\n"), mode: 'a')

      logger.info("description.md #{FILE_CREATED}")

    rescue StandardError => e
      logger.error(e.message)
      nil
    end

    def content_changelog(content)
      developers = content[:tasks]['developers']

      contents = ['## NESTE RELEASE', '']
      contents.concat(content[:description])
      contents.concat(['', '## TASKS', ''])

      developers.each_with_index do |_developer, index|
        contents.concat([
          developers[index], '', content[:tasks][developers[index]], ''
        ])
      end

      contents
    end

    def read_file_tasks
      i18n = []

      @hash = @hash.merge({ 'developers' => [] })

      tasks.each_with_index do |_element, index|
        content_file(index, i18n)
      end

      object(@hash, i18n)
    end

    def object(developers, description)
      {
        tasks: developers,
        description: description
      }
    end

    def content_file(index, i18n)
      line = []

      file = File.open("#{DEVELOP_DIRECTORY}/#{tasks[index]}", 'r')

      file.each_line { |content| line.push(content) }

      developer = line[1].gsub('developer: ', '')
      task = line[0].gsub('issue: ', '')

      i18n.push("- #{line[2].gsub('i18n: ', '')}")

      extract_data_file(developer, task)

      file.close
    end

    def extract_data_file(developer, task)
      developer = developer.gsub("\n", '')
      task = task.gsub("\n", '')

      if @hash[developer.to_s].nil?
        @hash['developers'].push(developer)

        @hash = @hash.merge({ developer.to_s => ["- #{task}"] })
      else
        @hash[developer.to_s].push("- #{task}")
      end
    end

    def tasks
      @tasks ||= task.index
    end

    def task
      @task ||= Task.new()
    end

    def logger
      Logger.new($stdout)
    end

    def directory
      @directory ||= Directory.new(DIRECTORY)
    end

    attr_accessor :hash
  end
end
