class buildservers::sevenzip {
$installsource = '\\server1\installs'
  package { '7-Zip 9.20 (x64 edition)':
         ensure         => present,
         #ensure         => absent,
         source         => "$installsource\7-Zip\7z920-x64.msi",
         install_options => ['/quiet'],
         uninstall_options => ['/quiet'],
        }
}
