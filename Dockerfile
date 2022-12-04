FROM ubuntu:20.04

COPY modules /abc
RUN ./abc/modules/apt.sh
RUN ./abc/modules/python.sh
RUN ./abc/modules/env.sh
RUN ./abc/modules/vm.sh


CMD ["/bin/bash"]
