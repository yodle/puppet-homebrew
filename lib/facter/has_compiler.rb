Facter.add(:has_compiler) do
  confine :operatingsystem => :darwin
  setcode do
    File.exists?('/usr/bin/cc') || system('/usr/bin/xcrun -find cc >/dev/null 2>&1')
  end

  # /usr/bin/cc exists in Mavericks, but it's not real
  confine :macosx_productversion_major => "10.9"
  setcode do
    (File.exists?('/Applications/Xcode.app') or File.exists?('/Library/Developer/CommandLineTools/')) and
    (File.exists?('/usr/bin/cc') || system('/usr/bin/xcrun -find cc >/dev/null 2>&1'))
  end
end
