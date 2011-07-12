# Make sure our lib is in our load path
$: << File.expand_path(File.dirname(__FILE__))

require 'yaml'
require 'github_backup/configuration'
require 'github_backup/repository'
require 'github_backup/github'
require 'github_backup/git'

module GithubBackup
  
end