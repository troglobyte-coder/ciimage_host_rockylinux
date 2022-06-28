#
# Troglobyte AppHub:
# author: Michael Gene Brockus
# mail: <mailto: michaelbrockus@gmail.com>
#
FROM rockylinux:latest AS dummy

# setting basic image info
ENV DEBIAN_FRONTEND noninteractive
ENV LANG 'C.UTF-8'
ENV CI 1

# setting compiler env vars
ENV CC ccache gcc
ENV CXX ccache g++


FROM dummy AS getter

RUN dnf -y update && dnf -y upgrade --refresh \
    && dnf -y install \
       sudo \
       python39 \
       python39-pip \
       gcc \
       gcc-g++ \
       git \
       ccache \
       cppcheck \
       ncurses-devel

RUN pip3 -q install --upgrade pip \
    && python3 -m pip -q install \
       meson==0.62.0 \
       scan-build==2.0.19 \
       ninja==1.10.0.post2
