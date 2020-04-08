# Different behavior of "NuGet Restore with -Source <Relative Path>" between 5.4.0 and 5.5.1

When specifying a relative path with `-Source` option in `nuget restore`, an error occurs in 5.5.1 version.
Because the 5.5.1 version tries to resolve the relative path based on the project file location.

## Run Test
```sh
./restore_test.sh
```

## Result
```
#### Restore with nuget 5.4.0 ###
Clearing NuGet HTTP cache: /home/zzervb/.local/share/NuGet/v3-cache
Clearing NuGet global packages folder: /home/zzervb/.nuget/packages/
Clearing NuGet Temp cache: /tmp/NuGetScratch
Clearing NuGet plugins cache: /home/zzervb/.local/share/NuGet/plugins-cache
Local resources cleared.
MSBuild auto-detection: using msbuild version '15.0' from '/usr/lib/mono/msbuild/15.0/bin'.
Restoring packages for /home/zzervb/Test/DotnetBug/RelativeRestore/ConsoleApp1/ConsoleApp1.csproj...
Installing Microsoft.NETCore.App.Ref 3.0.0.
Installing Newtonsoft.Json 12.0.3.
Committing restore...
Assets file has not changed. Skipping assets file writing. Path: /home/zzervb/Test/DotnetBug/RelativeRestore/ConsoleApp1/obj/project.assets.json
Restore completed in 409.6 ms for /home/zzervb/Test/DotnetBug/RelativeRestore/ConsoleApp1/ConsoleApp1.csproj.

NuGet Config files used:
    /home/zzervb/.config/NuGet/NuGet.Config

Feeds used:
    /home/zzervb/Test/DotnetBug/RelativeRestore/NuGets

Installed:
    1 package(s) to /home/zzervb/Test/DotnetBug/RelativeRestore/ConsoleApp1/ConsoleApp1.csproj
    
#### Restore with nuget 5.5.1 ###
Clearing NuGet HTTP cache: /home/zzervb/.local/share/NuGet/v3-cache
Clearing NuGet global packages folder: /home/zzervb/.nuget/packages/
Clearing NuGet Temp cache: /tmp/NuGetScratch
Clearing NuGet plugins cache: /home/zzervb/.local/share/NuGet/plugins-cache
Local resources cleared.
MSBuild auto-detection: using msbuild version '15.0' from '/usr/lib/mono/msbuild/15.0/bin'.
Restoring packages for /home/zzervb/Test/DotnetBug/RelativeRestore/ConsoleApp1/ConsoleApp1.csproj...
The local source '/home/zzervb/Test/DotnetBug/RelativeRestore/ConsoleApp1/NuGets' doesn't exist.
```
