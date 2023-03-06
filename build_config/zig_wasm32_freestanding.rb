# usage:
#   CONFIG=zig_wasm32_freestanding rake
#
# TODO:
#   implement longjmp alternative based on asyncify.
#   see:
#   - https://bugs.ruby-lang.org/issues/18462
#   - https://kripken.github.io/blog/wasm/2019/07/16/asyncify.html

MRuby::CrossBuild.new('zig-wasm32-freestanding') do |conf|
  conf.toolchain :zig, default_command: 'zig c++'

  conf.archiver.command = 'zig ar'

  conf.cc.flags << "-target wasm32-freestanding-musl"
  conf.cxx.flags << "-target wasm32-freestanding-musl"
  # conf.cxx_compile_flag = '-x c++ -std=gnu++03'
  conf.linker.command = 'zig c++'
  conf.linker.flags << "-target wasm32-freestanding-musl -fexceptions"

  conf.enable_cxx_exception
  # conf.enable_cxx_abi

  # conf.gembox 'default'
  conf.gembox "stdlib"
  conf.gembox "stdlib-ext"
  #conf.gembox "stdlib-io"
  conf.gembox "math"
  conf.gembox "metaprog"

  # Generate mirb command
  #conf.gem :core => "mruby-bin-mirb"

  # Generate mruby command
  conf.gem :core => "mruby-bin-mruby"
end
