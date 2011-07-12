require 'test_helper'

class GithubBackup::GitTest < Test::Unit::TestCase

  def setup
    @tmp_dir = File.join(File.expand_path(File.dirname(__FILE__), '..', 'tmp'))
    Dir.mkdir(@tmp_dir) unless Dir.exists?(@tmp_dir)
  end

  def test_initialize
    r   = GithubBackup::Repository.new(:ssh_url => 'ssh://git@github.com:test')
    git = GithubBackup::Git.new(@tmp_dir, r)
  end

  def teardown
    Dir.delete(@tmp_dir)
  end

end