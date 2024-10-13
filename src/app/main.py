from fastapi import FastAPI
from auth import router  # Import the router from auth/__init__.py

app = FastAPI()

app.include_router(router)


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/items/{item_id}")
async def get_items(item_id: int):
    return {"item_id": item_id}
