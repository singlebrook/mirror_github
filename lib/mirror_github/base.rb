module MirrorGithub

  class Base

    # Backs up all repositories from the organization defined in the config.
    def mirror_all
      puts "Mirroring #{github_connection.repositories.size} repositories..."
      github_connection.repositories.each do |repo|
        puts "Beginning #{repo.name}"
        mirror repo
        puts "Finished #{repo.name}"
        puts ""
      end
    end

    # Creates a new mirroir repository at the target directory (if necessary)
    # and fetches any updates.
    def mirror(repository)
      git = Git.new(config.backup_directory, repository)
      git.create_mirror unless git.mirror_exists?
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