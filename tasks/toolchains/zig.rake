MRuby::Toolchain.new(:zig) do |conf, _params|
  toolchain :gcc, default_command: 'zig cc'

  [conf.cc, conf.objc, conf.asm].each do |cc|
    cc.flags << '-Wzero-length-array' unless ENV['CFLAGS']
  end
  conf.cxx.flags << '-Wzero-length-array' unless ENV['CXXFLAGS'] || ENV['CFLAGS']

  conf.cxx.command = 'zig c++'
end
