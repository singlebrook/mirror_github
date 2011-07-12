require 'yaml'

module MirrorGithub
  class Configuration

    class << self
      def config_file_path
        @config_file_path ||= File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'config.yml'))
      end

      def config_file_path=(val)
        @config_file_path = File.expand_path(val)
      end
    end

    attr_accessor :username, :password, :org, :backup_directory

    def initialize
      load_config
    end

    def backup_directory=(val)
      @backup_directory = File.expand_path(val)
    end

    private

    def load_config
      raise "Please create a config.yml file at #{Configuration.config_file_path}, see test/config_example.yml for an example." unless File.exists?(Configuration.config_file_path)
      config_file = YAML::load_file(Configuration.config_file_path)
      if config_file['github']
        self.username = config_file['github']['username']
        self.password = config_file['github']['password']
        self.org      = config_file['github']['org']
      end
      if config_file['system']
        self.backup_directory = config_file['system']['backup_directory']
      end
    end

  end
end