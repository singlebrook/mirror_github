require 'test_helper'
require 'fakeweb'

class GithubBackup::GithubTest < Test::Unit::TestCase

  def setup
    FakeWeb.allow_net_connect = false
    FakeWeb.register_uri(:get, GithubBackup::Github.api_url, :body => "Unauthorized", :status => ["401", "Unauthorized"])
    FakeWeb.register_uri(:get, 'https://johnnytest:sOOperSecret@api.github.com/orgs/parent_org/repos', :body => organization_json, :content_type => "application/json")
  end

  def teardown
    FakeWeb.allow_net_connect = true
  end

  def test_repositories
    github = GithubBackup::Github.new('johnnytest', 'sOOperSecret', 'parent_org')
    assert github.repositories.respond_to?(:size)
    assert github.repositories.size > 0
    assert !github.repositories.map {|r| r.ssh_url }.compact.empty?
  end

  def organization_json
    @org_contents ||= File.open(File.join(File.expand_path(File.dirname(__FILE__)), 'fixtures', 'repositories_listing.json')).read
  end

end