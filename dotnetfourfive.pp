class buildservers::dotnetfourfive {
 $installsource = '\\server1\installs'
 $dotnetversion = 'C:\Windows\Microsoft.Net\Framework\dotnet4version.txt'

  package { 'Microsoft .NET Framework 4.5.1 SDK':
        ensure         => installed,
        source         => "$installsource\VS2012_Premium\dotNetFx45.exe",
        install_options => ['/q', '/norestart', '/ChainingPackage "ADMINDEPLOYMENT"'],
	requires       => Exec['define_dotnetversion'],
        }
	

 exec { 'define_dotnetversion':
	command => 'C:\Windows\System32\cmd.exe /c wmic product where "Name like "%Net Framework 4.5.1 SDK" get Name, Version" > $dotnetversion', 
	creates => "$dotnetversion",
	}

}

