# syntax=docker/dockerfile:1.4

FROM base
RUN echo "zzz..."; sleep 10; echo "done"
