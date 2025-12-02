#!/bin/bash
# Azure startup script for FastAPI app

echo "Starting FastAPI application..."

# Install dependencies first
pip install fastapi uvicorn[standard] sqlalchemy psycopg2-binary python-multipart python-dotenv pydantic requests

# Start FastAPI with uvicorn
python -m uvicorn main:app --host 0.0.0.0 --port $PORT
