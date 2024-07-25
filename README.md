В папку models поместите свою модель в моем случае это было llama-2-7b-chat.Q3_K_S.gguf

Запуск docker-compose up --build

Если используете другую модель :
  COPY model/{ваша модель} /opt/llama.cpp/models/{ваша модель}

