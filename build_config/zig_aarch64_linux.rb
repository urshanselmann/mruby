# usage:
#   CONFIG=zig_aarch64_linux rake

MRuby::CrossBuild.new('zig-aarch64-linux') do |conf|
  conf.toolchain :zig, default_command: 'zig cc'

  conf.cc.flags << "-target aarch64-linux"
  conf.linker.flags << "-target aarch64-linux"

  # conf.gembox 'default'
  conf.gembox "stdlib"
  conf.gembox "stdlib-ext"
  conf.gembox "stdlib-io"
  conf.gembox "math"
  conf.gembox "metaprog"

  # Generate mirb command
  conf.gem :core => "mruby-bin-mirb"

  # Generate mruby command
  conf.gem :core => "mruby-bin-mruby"
end
