#require "bundler/gem_tasks"
require 'rake/clean'

task :download do
  FileUtils::mkdir_p("deps/src")
  chdir('deps/src') {
    unless /mingw/ =~ RUBY_PLATFORM
      OIS_FILE="ois_v1-3.tar.gz"
      sh "wget http://downloads.sourceforge.net/project/wgois/Source%20Release/1.3/#{OIS_FILE}"
      sh "tar xzvf #{OIS_FILE}"
    end
  }
end

task :compile do
  puts 'run "rake download"' unless Dir.exist?("deps/src")

  unless /mingw/ =~ RUBY_PLATFORM
    chdir("deps/src/ois-v1-3/") {
      sh "sh ./bootstrap"
      sh "./configure --prefix=$PWD/../.."
      sh "make && make install"
    }
  end
end

namespace :build do
  DLEXT = RbConfig::MAKEFILE_CONFIG['DLEXT']

  ## lib/*.#{DLEXT}
  file "lib/ois.#{DLEXT}" => "bindings/ois/ois.#{DLEXT}" do |f|
    cp f.prerequisites, "lib/", :preserve => true
  end
  
  ## ext/**/*.#{DLEXT}
  file "bindings/ois/ois.#{DLEXT}" => FileList["bindings/ois/Makefile"] do |f|
    sh 'cd bindings/ois/ && make clean && make'
  end
  CLEAN.include 'bindings/ois/*.{o,so,dll}'
  
  ## ext/**/Makefile
  file 'bindings/ois/Makefile' => FileList['bindings/ois/interface/ois_wrap.cpp'] do
    chdir('bindings/ois/') { ruby 'extconf.rb' }
  end
  CLEAN.include 'bindings/ois/Makefile'
  
  ## make wrappers with swig.
  file 'bindings/ois/interface/ois_wrap.cpp' do
    chdir('bindings/ois/interface') { sh 'rake' }
  end
  CLEAN.include 'bindings/ois/interface/ois_wrap.{cpp,h,o}'
end

desc "Compile a extension library."
task :build => "lib/ois.#{DLEXT}"

