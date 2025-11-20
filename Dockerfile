FROM docker.io/ollama/ollama:0.13.0

RUN nohup bash -c "ollama serve &" && sleep 20 && \
        ollama pull llama3.2:1b && \
        ollama pull nomic-embed-text && \
    mv /root/.ollama/models / && \
    chmod -R og+r /models && \
    rm -rf /root/.ollama

ADD run.sh /

EXPOSE 11434

ENTRYPOINT [ "/run.sh" ]
CMD [ "serve" ]
