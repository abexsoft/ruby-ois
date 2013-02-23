require_relative "ruby-ois/version"

module Ruby
  module Ois
    def self.get_top_path
      File.dirname(File.dirname(File.expand_path(__FILE__)))
    end

    def self.get_deps_lib_path
      "#{get_top_path}/deps/lib"
    end

    def self.get_lib_path
      File.dirname(File.expand_path(__FILE__))
    end

    def self.get_inc_flags
      "-I#{get_top_path}/deps/include/OIS "
    end

    def self.get_lib_flags
      if (/mingw/ =~ RUBY_PLATFORM)
        return "-L#{get_top_path}/deps/lib/release -lOIS"
      else
        return "-L#{get_top_path}/deps/lib -lOIS"
      end
    end

  end
end
