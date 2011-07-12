module MirrorGithub
  class Repository
    attr_accessor :ssh_url, :html_url, :private, :created_at, :pushed_at, :name
    alias :private? :private
    
    def initialize(input = {})
      input.each do |k, v|
        self.send("#{k}=", v)
      end
    end

  end
end