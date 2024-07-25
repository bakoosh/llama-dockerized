FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    git \
    cmake \
    build-essential \
    wget \
    unzip \
    python3 \
    python3-pip

RUN git clone https://github.com/ggerganov/llama.cpp /opt/llama.cpp
WORKDIR /opt/llama.cpp
RUN mkdir build && cd build && cmake .. && make

COPY model/llama-2-7b-chat.Q3_K_S.gguf /opt/llama.cpp/models/llama-2-7b-chat.Q3_K_S.gguf
COPY query_llama.py /opt/llama.cpp/query_llama.py

WORKDIR /opt/llama.cpp/build

CMD ["python3", "/opt/llama.cpp/query_llama.py"]
