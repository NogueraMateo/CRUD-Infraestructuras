from contextlib import asynccontextmanager
from fastapi import FastAPI, HTTPException
from sqlmodel import text
from .database import create_db_and_tables, engine
from .models import User
from .route import router as users_router

@asynccontextmanager
async def lifespan(app: FastAPI):
    create_db_and_tables()

    yield

app = FastAPI(lifespan=lifespan)

app.include_router(users_router)

@app.get("/health/live")
def health():
    return {"status": "Healthy"}

@app.get("/health/ready")
def readiness():
    try:
        with engine.connect() as connection:
            connection.execute(text("SELECT 1"))

        return {"status": "Ready"}

    except Exception:
        raise HTTPException(
            status_code=503,
            detail="Database unavailable"
        )