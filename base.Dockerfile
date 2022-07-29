# syntax=docker/dockerfile:1.4

FROM ubuntu:jammy AS zap
RUN echo "zap is sleeping..."; sleep 100; echo "done"

FROM zap AS builder
RUN echo "builder is sleeping..."; sleep 100; echo "done"
