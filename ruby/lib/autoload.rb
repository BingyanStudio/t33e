require_relative './string_extensions'

class Autoload
  using StringExtensions

  @load_paths = []
  class << self
    attr_accessor :load_paths
  end

  def self.add_path(paths = [], *args)
    @load_paths |= [*paths, *args].map { |e| File.expand_path e }
  end

  def self.init
    klass = self
    Object.singleton_class.send :define_method, :const_missing do |name|
      klass.load_paths.each do |pa|
        files = Dir[pa.sub(/\/\Z/, '') + "/**/#{name.to_s.snakecase}.rb"]
        if !files.empty?
          require files.first
          return const_get name
        end
      end
      raise NameError, "uninitialized constant #{name}"
    end
    self
  end
end
