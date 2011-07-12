require 'test_helper'

class MirrorGithub::ConfigurationTest < Test::Unit::TestCase

  def test_config_file_default
    assert_not_nil MirrorGithub::Configuration.config_file_path
  end

  def test_loads_config_file
    MirrorGithub::Configuration.config_file_path = File.join(File.expand_path(File.dirname(__FILE__)), 'config_example.yml')
    config = MirrorGithub::Configuration.new
    assert config.username
    assert config.password
    assert config.org
  end

end