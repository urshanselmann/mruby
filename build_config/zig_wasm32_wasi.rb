# usage:
#   CONFIG=zig_wasm32_wasi rake

MRuby::CrossBuild.new('zig-wasm32-wasi') do |conf|
  conf.toolchain :zig, default_command: 'zig c++'

  conf.archiver.command = 'zig ar'

  conf.cc.flags << "-target wasm32-wasi"
  conf.cxx.flags << "-target wasm32-wasi"
  # conf.cxx_compile_flag = '-x c++ -std=gnu++03'
  conf.linker.command = 'zig c++'
  conf.linker.flags << "-target wasm32-wasi -fexceptions -fwasm-exceptions"

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
