:: install git, java 8, maven, visual studio community 15 (2017)

set MSBUILD=C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe

if exist build rd /s /q build
if exist librocksdbjni-win64.dll del librocksdbjni-win64.dll
mkdir build && cd build

cmake -G "Visual Studio 17 2022" -DWITH_JNI=1 ..

"%MSBUILD%" rocksdb.sln /p:Configuration=Release /m

cd ..

copy build\java\Release\rocksdbjni-shared.dll librocksdbjni-win64.dll
echo Result is in librocksdbjni-win64.dll