# SU2 Cross Compilation Container

This container is used to build binaries for all three platforms (linux, darwin (MacOS) and windows).

For Linux and MacOs it uses custom build MPICH libraries using the `x86-64-linux-gnu` or `x86-64-apple-darwin` toolchains (set with the `--host` argument for the `configure` script). See `Dockerfile` and `download_compile_mpich.sh`.
For Windows the MSMPI library is used. 

MPI is linked statically. 

The toolchains can be used by providing meson with an appropriate hostfile (`--cross-file`) which can be found at `/hostfiles`:

- `hostfile_windows` 
- `hostfile_windows_mpi`
- `hostfile_linux`
- `hostfile_linux_mpi`
- `hostfile_darwin`
- `hostfile_darwin_mpi`

In order for meson to use the correct static MPI libraries, the `-Dcustom-mpi=true` option must be given if any of the `*_mpi` hostfiles is used. Otherwise MPI cannot be found.

## Creating the MacOS SDK Package ##

The OSX SDK is created using OSXCROSS: https://github.com/tpoechtrager/osxcross#packaging-the-sdk

## Preparing and creating MSMPI package ##

Here you'll find the instructions on how to create libmsmpi.a for the MinGW-w64 cross-compiler to link against for MPI applications, given the free MS-MPI Redistributable Package. Note: this requires a Windows installation

### Gather MPI distribution from Windows ###

- Download and install Microsoft MPI (SDK and Setup) from https://www.microsoft.com/en-us/download/details.aspx?id=100593 on a Windows machine
- Copy the file `C:\Windows\System32\msmpi.dll` to `C:\Program Files (x86)\Microsoft SDKs\MPI\Lib\x64` 
- Transfer the folder `C:\Program Files (x86)\Microsoft SDKs\MPI\` to a Linux machine

### Create libmsmpi.a on Linux ###

Make sure to install the mingw32 on your linux machine (Ubuntu packages: `mingw-64`, `mingw-64-tools`).
Assuming the MSMPI distribution copied over from Windows, in the previous step, is located at `<msmpi-linux-home>` execute the following steps in a terminal:

- `cd <msmpi-linux-home>/Lib/x64`
- `gendef msmpi.dll`
- `x86_64-w64-mingw32-dlltool -d msmpi.def -l libmsmpi.a -D msmpi.dll`
- Create an archive of folder `<msmpi-linux-home>` named `msmpi_v<version_number>.tar.gz` 
