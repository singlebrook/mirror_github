require 'test_helper'

class GithubBackup::RepositoryTest < Test::Unit::TestCase

  def test_initialize
    r = GithubBackup::Repository.new(:ssh_url => "ssh_url", :private => true)
    assert_equal "ssh_url", r.ssh_url
    assert_equal true, r.private?
  end

end