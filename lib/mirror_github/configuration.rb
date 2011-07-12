require 'yaml'

module MirrorGithub
  class Configuration

    class << self
      attr_writer :config_file_path

      def config_file_path
        @config_file_path ||= File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'config.yml'))
      end
    end

    attr_accessor :username, :password, :org, :backup_directory

    def initialize
      raise "Please create a config.yml file, see test/config_example.yml for an example." unless File.exists?(Configuration.config_file_path)
      load_config
    end

    private

    def load_config
      config_file = YAML::load_file(Configuration.config_file_path)
      self.username = config_file['github']['username']
      self.password = config_file['github']['password']  
      self.org      = config_file['github']['org']
      self.backup_directory = config_file['system']['backup_directory']
    end

  end
end