require 'mkmf'

require_relative "../../lib/ruby-ois"

# set flags
$CFLAGS += " -g #{Ruby::Ois::get_inc_flags}"

if (/mingw/ =~ RUBY_PLATFORM)
  $LDFLAGS += " -static-libgcc -static-libstdc++ #{Ruby::Ois::get_lib_flags} -lws2_32 -lwinmm"
else
  $LDFLAGS += " -static-libgcc -static-libstdc++ #{Ruby::Ois::get_lib_flags}"
end

$srcs = ["interface/ois_wrap.cpp"]
$objs = $srcs.collect {|o| o.sub(/\.cpp|\.cc|\.cxx/, ".o")}
$cleanfiles = $objs

create_makefile('ois')
