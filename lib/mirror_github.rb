# Make sure our lib is in our load path
$: << File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'mirror_github/base'
require 'mirror_github/configuration'
require 'mirror_github/repository'
require 'mirror_github/github'
require 'mirror_github/git'
