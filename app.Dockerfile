# syntax=docker/dockerfile:1.4

FROM base as foo

FROM foo as builder
RUN echo "sleeping in builder..."; sleep 10; echo "done"
RUN touch builder.txt

FROM builder AS tester
RUN echo "sleeping in tester..."; sleep 10; echo "done"
RUN touch tester.txt  

FROM builder AS runner
RUN echo "sleeping in runner..."; sleep 10; echo "done"
RUN touch runner.txt  
