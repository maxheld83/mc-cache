# syntax=docker/dockerfile:1.4

FROM base
RUN echo "base is sleeping..."; sleep 10; echo "done"
