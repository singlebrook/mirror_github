# Make sure our lib is in our load path
$: << File.expand_path(File.dirname(__FILE__))

require 'test/unit'
require 'lib/github_backup'
