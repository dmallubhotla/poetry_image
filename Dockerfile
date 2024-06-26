FROM python:3.9

ENV PATH=/root/.local/bin:$PATH \
    POETRY_VERSION=1.8.2

RUN apt-get update && apt-get install --no-install-recommends -y curl \
    && curl -sSL https://install.python-poetry.org | python3 - \
    && rm -rf /var/lib/apt/lists/*


RUN poetry --version
ENTRYPOINT ["poetry"]
CMD ["--help"]
