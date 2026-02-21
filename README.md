# Running the docker image

#### Build and start container
docker-compose up --build -d

#### Check logs
docker-compose logs -f

# Test via Postman

1. Method: POST
2. URL: http://<SERVER_IP>:8000/describe-image/
3. Body → form-data → Key: file → Type: File → Choose any image
4. Send → you’ll get JSON description from Moondream.
