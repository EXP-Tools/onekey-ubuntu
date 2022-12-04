FROM ubuntu:20.04

COPY modules /abc
RUN /abc/apt.sh
RUN /abc/python.sh
RUN /abc/env.sh
RUN /abc/vm.sh
RUN /abc/cron.sh


WORKDIR /test_script
CMD ["/bin/bash"]
