module GithubBackup
  class Configuration

    class << self
      attr_writer :config_file_path

      def config_file_path
        @config_file_path ||= File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'config.yml'))
      end
    end

    attr_accessor :username, :password, :org

    def initialize
      load_config
    end

    private

    def load_config
      config_file = YAML::load_file(GithubBackup::Configuration.config_file_path)
      self.username = config_file['github']['username']
      self.password = config_file['github']['password']  
      self.org      = config_file['github']['org']
    end

  end
end