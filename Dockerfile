ARG GCCVERSION=latest
FROM gcc:${GCCVERSION}
# FROM gcc:8.4

# Installing capd dependencies
RUN apt-get update
# RUN apt-get install -y liblog4cxx-dev 
RUN apt-get install -y libmpfr-dev autoconf libtool zip subversion
RUN apt-get install -y libboost-test-dev libboost-filesystem-dev libboost-tools-dev
RUN apt-get install -y  ssh screen vim
RUN apt-get install -y  gdb valgrind

# Downloading capd
WORKDIR /usr/src/sources

# The latest published version
#RUN wget https://sourceforge.net/projects/capd/files/5.1.2/src/capd-capdDynSys-5.1.2.zip
#RUN unzip capd-capdDynSys-5.1.2.zip
#RUN mv  capd-capdDynSys-5.1.2.zip capd

# The latest version from svn repository
RUN  svn co --non-interactive --trust-server-cert-failures=unknown-ca,cn-mismatch,expired,not-yet-valid,other https://svn.capdnet.ii.uj.edu.pl/capd/
WORKDIR /usr/src/sources/capd
RUN svn co --non-interactive --trust-server-cert-failures=unknown-ca,cn-mismatch,expired,not-yet-valid,other https://svn.capdnet.ii.uj.edu.pl/capdDynSys4
RUN autoreconf -i

# Building CAPD
WORKDIR /usr/src/sources/capdbuild
RUN ../capd/configure 
RUN make -j 4 lib

# Running test 
#RUN make check

# Installing CAPD  
RUN make install
RUN ldconfig

# Cleaning capd
WORKDIR /usr/src/sources
RUN rm -rf capdbuild
RUN rm -rf capd

COPY .bashrc /root/.bashrc

WORKDIR /usr/src/
CMD ["bash"]
