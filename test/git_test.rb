require 'test_helper'

class GithubBackup::GitTest < Test::Unit::TestCase

  def setup
    @tmp_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'tmp'))
    Dir.mkdir(@tmp_dir) unless File.directory?(@tmp_dir)
  end

  def test_initialize
    r   = GithubBackup::Repository.new(:ssh_url => 'ssh://git@github.com:test')
    git = GithubBackup::Git.new(@tmp_dir, r)
  end

  def test_initialize_raises_error_if_directory_does_not_exist
    r   = GithubBackup::Repository.new(:ssh_url => 'ssh://git@github.com:test')
    assert_raise RuntimeError do
      GithubBackup::Git.new('sdfl9ij390', r)
    end
  end

  def teardown
    Dir.delete(@tmp_dir)
  end

end