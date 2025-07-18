from fastapi import FastAPI
from datetime import datetime
from pydantic import BaseModel

app = FastAPI()

class APIResponse(BaseModel):
    message: str
    timestamp: datetime
    status: str
    server: str

@app.get("/api/test")
async def test_endpoint():
    return APIResponse(
        message="Hello from FastAPI!",
        timestamp=datetime.now(),
        status="success",
        server="FastAPI"
    )