#!/bin/bash -e

echo "#### Restore with nuget 5.4.0 ###"
mono tools/nuget_5.4.0.exe locals all -clear
mono tools/nuget_5.4.0.exe restore ConsoleApp1.sln -Source ./NuGets

echo "#### Restore with nuget 5.5.1 ###"
mono tools/nuget_5.5.1.exe locals all -clear
mono tools/nuget_5.5.1.exe restore ConsoleApp1.sln -Source ./NuGets
