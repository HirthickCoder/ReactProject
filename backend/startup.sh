#!/bin/bash
# Azure App Service startup script for FastAPI

# Install dependencies
pip install -r requirements.txt

# Run database migrations (if any)
# python migrate.py

# Start uvicorn server
uvicorn main:app --host 0.0.0.0 --port 8000
