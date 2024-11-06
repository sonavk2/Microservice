from aiohttp.web import Application, run_app, RouteTableDef, Request, Response, FileResponse, StreamResponse
import asyncio
import os

routes = RouteTableDef()

@routes.get('/')
async def index(req : Request) -> StreamResponse:
    return FileResponse(path="index.html")

# TO DO: add more API endpoints here

def setup_app(app):
    os.makedirs('temp', exist_ok=True)
    app.add_routes(routes)
    
# To facilitate testing, do not change anything below this line
if __name__ == '__main__': 
    app = Application()
    setup_app(app)
    run_app(app, host='0.0.0.0', port=5000) # this function never returns
