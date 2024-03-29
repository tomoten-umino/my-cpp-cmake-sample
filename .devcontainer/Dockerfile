# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.0/containers/cpp/.devcontainer/base.Dockerfile

# [Choice] Debian / Ubuntu version (use Debian 11, Ubuntu 18.04/22.04 on local arm64/Apple Silicon): debian-11, debian-10, ubuntu-22.04, ubuntu-20.04, ubuntu-18.04
ARG VARIANT="bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

# [Optional] Install CMake version different from what base image has already installed. 
# CMake reinstall choices: none, 3.21.5, 3.22.2, or versions from https://cmake.org/download/
ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="none"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/
RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
        chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

# [Optional] Uncomment this section to install additional vcpkg ports.
# RUN su vscode -c "${VCPKG_ROOT}/vcpkg install <your-port-name-here>"

# [Optional] Uncomment this section to install additional packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y --no-install-recommends install vim python3-pip lcov

# [User added] Install Google Test ver. 1.12.1
RUN  wget https://github.com/google/googletest/archive/release-1.12.1.tar.gz -O - | tar xzvf - \
     && mkdir -p /usr/local/src \
     && mv ./googletest-release-1.12.1 /usr/local/src/ \
     && cd /usr/local/src/googletest-release-1.12.1 \
     && mkdir ./build \
     && cd ./build \
     && cmake .. \
     && make install \
     && rm -rf /usr/local/src/googletest-release-1.12.1
