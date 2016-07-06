class buildservers::ie11 {
# Find the IE version installed
 $ieversion = '"C:\Program Files\Internet Explorer\IEinstalled.txt"'
 $installsource = '\\server1\installs'

# Install or uninstall the package with installed/absent
  package { 'Internet Explorer 11':
         #ensure         => installed,
         ensure         => absent,
         source         => "$installsource\InternetExplorer\IE11\IE11-Windows6.1-x64-en-us.exe",
	 # Uncomment the next line if you are ok with an automatic restart
         #install_options => ['/passive', '/closeprograms'],
         install_options => ['/passive', '/closeprograms', '/norestart'],
         uninstall_options => ['/passive', '/closeprograms', '/norestart'],
	 requires       => Exec['define_ieversion'],
	 notify	 => "Installing IE 11 version ${ieversion}"
        }
	

  exec { 'define_ieversion':
         command => "C:\Windows\System32\WindowsPowershell\v1.0\powershell.exe (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Internet Explorer').Version > 'C:\Program Files\Internet Explorer\IEinstalled.txt'",
         creates => $ieversion,
         }

}
