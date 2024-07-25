import subprocess

model_path = "/opt/llama.cpp/models/llama-2-7b-chat.Q3_K_S.gguf"

query = "Привет! Как дела?"

with open('/opt/llama.cpp/query.txt', 'w') as f:
    f.write(query)

result = subprocess.run(
    ['/opt/llama.cpp/build/bin/llama-cli', '--model', model_path, '--prompt', query],
    capture_output=True,
    text=True
)

if result.returncode != 0:
    with open('/opt/llama.cpp/error.log', 'w') as f:
        f.write(result.stderr)

with open('/opt/llama.cpp/result.txt', 'w') as f:
    f.write(result.stdout)

print(result.stdout)