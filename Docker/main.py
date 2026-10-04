from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

app = FastAPI()

frontend = Jinja2Templates(directory="frontend")

@app.get("/", response_class=HTMLResponse)
async def read_root(request: Request):
    return frontend.TemplateResponse(name="index.html", request=request)
