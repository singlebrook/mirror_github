require 'rest_client'
require 'json'

module GithubBackup
  class Github

    class << self
      def api_url
        'https://api.github.com'
      end
    end

    attr_accessor :connection, :username, :password, :org

    def initialize(username, password, org = nil)
      self.username   = username
      self.password   = password
      self.org        = org
      self.connection = RestClient::Resource.new Github.api_url, :user => username, :password => password
    end

    # Return a list of the current repositories for an organization
    def repositories
      return [] unless org
      JSON::parse(connection["orgs/#{org}/repos"].get).collect do |repo_hash|
        Repository.new(:ssh_url    => repo_hash['ssh_url'],
                       :private    => repo_hash['private'],
                       :created_at => repo_hash["created_at"],
                       :pushed_at  => repo_hash["pushed_at"],
                       :name       => repo_hash["name"])
      end
    end



  end
end