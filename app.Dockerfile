# syntax=docker/dockerfile:1.4

FROM base

RUN echo "sleeping in app (child)..."; sleep 10; echo "done"
