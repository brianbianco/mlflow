FROM ghcr.io/mlflow/mlflow:v2.21.0

RUN apt-get update && apt-get install -y \
    apt-utils \
    build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm \
    libncurses5-dev libncursesw5-dev xz-utils tk-dev \
    libffi-dev liblzma-dev python3-openssl \
    python3-psycopg2

RUN useradd -ms /bin/bash ml
USER ml
WORKDIR /home/ml

RUN pip install psycopg2-binary

EXPOSE 5000

ENTRYPOINT ["mlflow"]
