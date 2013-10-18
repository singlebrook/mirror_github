# Make sure our lib is in our load path
$: << File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'minitest/autorun'
require 'mirror_github'
