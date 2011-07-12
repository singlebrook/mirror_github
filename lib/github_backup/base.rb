module GithubBackup

  class Base

    # Backs up all repositories from the organization defined in the config.
    def backup_all
      # github_connection.repositories.each do |repo|
      #      backup repo
      #    end
      backup github_connection.repositories.first
    end

    # Creates a new mirroir repository at the target directory (if necessary)
    # and fetches any updates.
    def backup(repository)
      git = Git.new(target_dir, repository)
      git.create_mirrior unless system.mirror_exists?
      git.update_mirror
    end

    def config
      @config ||= Configuration.new
    end

    def github_connection
      @github_connection ||= Github.new(config.username, config.password, config.org)
    end

  end

end