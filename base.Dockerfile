# syntax=docker/dockerfile:1.4

FROM ubuntu:jammy
RUN echo "zzz..."; sleep 10; echo "done"