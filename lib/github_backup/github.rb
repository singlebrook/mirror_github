require 'rest_client'
require 'json'

module GithubBackup
  class Github

    class << self
      def api_url
        'https://api.github.com'
      end
    end

    attr_accessor :connection, :username, :password

    def initialize(username, password)
      self.username   = username
      self.password   = password
      
      self.connection = RestClient::Resource.new Github.api_url, :user => username, :password => password
    end

    # Return a list of the 
    def repositories
      JSON::parse(connection["orgs/#{username}/repos"].get).collect do |repo_hash|
        Repository.new(:ssh_url => repo_hash['ssh_url'], :private => repo_hash['private'])
      end
    end

  end
end