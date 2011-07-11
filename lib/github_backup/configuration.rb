module GithubBackup
  class Configuration

    class << self
      attr_writer :config_file_path

      def config_file_path
        @config_file_path ||= File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'config.yml'))
      end
    end

    attr_accessor :username, :password
    attr_reader   :type

    def initialize
      load_config
    end

    def user_type=(val)
      raise ArgumentError, "Invalid option for type, must be #{valid_org_types.join(' or ')} " unless valid_org_types.include?(val)
      @type = val
    end

    private

    def load_config
      config_file = YAML::load_file(GithubBackup::Configuration.config_file_path)
      self.username = config_file['github']['username']
      self.password = config_file['github']['password']  
      self.user_type = config_file['github']['user_type']  
    end

    def valid_org_types
      %w(user organization)
    end

  end
end