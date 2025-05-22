FROM docker.io/ollama/ollama:0.7.0

RUN nohup bash -c "ollama serve &" && sleep 10 && \
        ollama pull llama3.2:1b && \
        ollama pull gemma3:4b && \
    mv /root/.ollama/models / && \
    chmod -R og+r /models && \
    rm -rf /root/.ollama

ADD run.sh /

ENTRYPOINT [ "/run.sh" ]
CMD [ "serve" ]
