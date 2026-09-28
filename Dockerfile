FROM python:3.14-slim

WORKDIR /app

COPY pyproject.toml uv.lock ./

RUN pip install uv

RUN uv sync --locked --no-install-project

COPY . .

RUN uv sync --locked

EXPOSE 8000

CMD ["uv", "run", "uvicorn", "docker_practice.main:app", "--host", "0.0.0.0", "--port", "8000"]