FROM docker.io/ollama/ollama:0.8.0

RUN nohup bash -c "ollama serve &" && sleep 20 && \
    while ! nc -z localhost 11434; do sleep 1; done && \
    ollama pull llama3.2:1b && \
    ollama pull nomic-embed-text && \
    mv /root/.ollama/models / && \
    chmod -R og+r /models && \
    rm -rf /root/.ollama

ADD run.sh /

EXPOSE 11434

ENTRYPOINT [ "/run.sh" ]
CMD [ "serve" ]
