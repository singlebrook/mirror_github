# Make sure our lib is in our load path
$: << File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'test/unit'
require 'lib/mirror_github'
