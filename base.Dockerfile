# syntax=docker/dockerfile:1.4

FROM ubuntu:jammy
RUN echo "sleeping in base (parent) ..."; sleep 10; echo "done"
COPY docker-bake.hcl docker-bake.hcl
