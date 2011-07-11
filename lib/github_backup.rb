# Make sure our lib is in our load path
$: << File.expand_path(File.dirname(__FILE__))

require 'yaml'
require 'github_backup/configuration'

module GithubBackup
  
end