#!/bin/bash
cd ./frontend
docker build -t maotai_front:latest .

cd ../backend
docker build -t maotai:latest ../..

cd ..
docker compose up -d
