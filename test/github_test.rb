require 'test_helper'
require 'fakeweb'

class MirrorGithub::GithubTest < MiniTest::Unit::TestCase

  def setup
    FakeWeb.allow_net_connect = false
    FakeWeb.register_uri(:get, MirrorGithub::Github.api_url, :body => "Unauthorized", :status => ["401", "Unauthorized"])
    FakeWeb.register_uri(:get, 'https://johnnytest:sOOperSecret@api.github.com/orgs/parent_org/repos?per_page=100&page=1', :body => organization_json, :content_type => "application/json")
    FakeWeb.register_uri(:get, 'https://johnnytest:sOOperSecret@api.github.com/orgs/parent_org/repos?per_page=100&page=2', :body => '[]', :content_type => "application/json")
  end

  def teardown
    FakeWeb.allow_net_connect = true
  end

  def test_repositories
    github = MirrorGithub::Github.new('johnnytest', 'sOOperSecret', 'parent_org')
    assert github.repositories.respond_to?(:size)
    assert github.repositories.size > 0
    assert !github.repositories.map {|r| r.ssh_url }.compact.empty?
  end

  def organization_json
    @org_contents ||= File.open(File.join(File.expand_path(File.dirname(__FILE__)), 'fixtures', 'repositories_listing.json')).read
  end

end