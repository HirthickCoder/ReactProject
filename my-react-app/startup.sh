#!/bin/bash
# Azure startup script for FastAPI app

echo "Starting FastAPI application..."

# Install dependencies
pip install -r backend/requirements.txt

# Change to backend directory
cd backend

# Start FastAPI with uvicorn
uvicorn main:app --host 0.0.0.0 --port $PORT
