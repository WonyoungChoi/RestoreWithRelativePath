# Different behavior of "NuGet Restore with -Source <Relative Path>" between 5.4.0 and 5.5.1

When specifying a relative path with `-Source` option in `nuget restore`, an error occurs in 5.5.1 version.
Because the 5.5.1 version tries to resolve the relative path based on the project file location.

Reported Issue: [NuGet.Home#9406](https://github.com/NuGet/Home/issues/9406)

## Run Test
```sh
./restore_test.sh
```

## Result
```
+ echo '#### Restore with nuget 5.4.0 ###'
#### Restore with nuget 5.4.0 ###
+ mono tools/nuget_5.4.0.exe locals all -clear
Clearing NuGet HTTP cache: /home/user/.local/share/NuGet/v3-cache
Clearing NuGet global packages folder: /home/user/.nuget/packages/
Clearing NuGet Temp cache: /tmp/NuGetScratch
Clearing NuGet plugins cache: /home/user/.local/share/NuGet/plugins-cache
Local resources cleared.
+ mono tools/nuget_5.4.0.exe restore ConsoleApp1.sln -Source ./NuGets
MSBuild auto-detection: using msbuild version '15.0' from '/usr/lib/mono/msbuild/15.0/bin'.
Restoring packages for /home/user/RestoreWithRelativePath/ConsoleApp1/ConsoleApp1.csproj...
Installing Microsoft.NETCore.App.Ref 3.0.0.
Installing Newtonsoft.Json 12.0.3.
Committing restore...
Assets file has not changed. Skipping assets file writing. Path: /home/user/RestoreWithRelativePath/ConsoleApp1/obj/project.assets.json
Restore completed in 404.66 ms for /home/user/RestoreWithRelativePath/ConsoleApp1/ConsoleApp1.csproj.

NuGet Config files used:
    /home/user/.config/NuGet/NuGet.Config

Feeds used:
    /home/user/RestoreWithRelativePath/NuGets

Installed:
    1 package(s) to /home/user/RestoreWithRelativePath/ConsoleApp1/ConsoleApp1.csproj

+ echo '#### Restore with nuget 5.5.1 ###'
#### Restore with nuget 5.5.1 ###
+ mono tools/nuget_5.5.1.exe locals all -clear
Clearing NuGet HTTP cache: /home/user/.local/share/NuGet/v3-cache
Clearing NuGet global packages folder: /home/user/.nuget/packages/
Clearing NuGet Temp cache: /tmp/NuGetScratch
Clearing NuGet plugins cache: /home/user/.local/share/NuGet/plugins-cache
Local resources cleared.
+ mono tools/nuget_5.5.1.exe restore ConsoleApp1.sln -Source ./NuGets
MSBuild auto-detection: using msbuild version '15.0' from '/usr/lib/mono/msbuild/15.0/bin'.
Restoring packages for /home/user/RestoreWithRelativePath/ConsoleApp1/ConsoleApp1.csproj...
The local source '/home/user/RestoreWithRelativePath/ConsoleApp1/NuGets' doesn't exist.
```
