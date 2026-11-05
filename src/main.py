from contextlib import asynccontextmanager
from fastapi import FastAPI
from .database import create_db_and_tables
from .models import User
from .route import router as users_router

@asynccontextmanager
async def lifespan(app: FastAPI):
    create_db_and_tables()

    yield

app = FastAPI(lifespan=lifespan)

app.include_router(users_router)

@app.get("/health")
async def health():
    return {"status": "Healthy"}