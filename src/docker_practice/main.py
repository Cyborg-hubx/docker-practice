import os

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def root():
    app_env = os.getenv("APP_ENV", "not set")

    return {
        "message": "Hello from Docker!",
        "environment": app_env,
    }