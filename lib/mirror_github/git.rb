module MirrorGithub

  class Git
    attr_accessor :repository
    attr_writer   :target_dir

    # Takes a target_dir string and a Repository class
    def initialize(target_dir, repository)
      self.target_dir = target_dir
      raise "GitHub backup directory, #{self.target_dir}, does not exist!" unless File.directory?(self.target_dir)

      self.repository = repository
    end

    def create_mirror
      `#{go_to_target_dir} && git clone --mirror #{repository.ssh_url} #{mirror_directory}`
    end

    def go_to_target_dir
      "cd #{target_dir}"
    end

    def go_to_mirror_dir
      "cd #{File.join(target_dir, mirror_directory)}"
    end

    def mirror_directory
      "#{repository.name}.git"
    end

    def mirror_exists?
      File.exists? File.join(target_dir, "#{mirror_directory}")
    end

    def target_dir
      File.expand_path(@target_dir)
    end

    def update_mirror
      `#{go_to_mirror_dir} && git fetch`
    end

  end
  
end