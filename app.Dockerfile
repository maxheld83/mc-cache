# syntax=docker/dockerfile:1.4

FROM base

RUN echo "sleeping in builder..."; sleep 10; echo "done"
RUN touch builder.txt
