# syntax=docker/dockerfile:1.4

FROM ubuntu:jammy AS zap
ARG foo=bar
ENV zap=${foo}
RUN echo "zap is sleeping..."; sleep 100; echo "done"
RUN touch zap.txt

FROM zap AS builder
RUN echo "builder is sleeping..."; sleep 100; echo "done"
