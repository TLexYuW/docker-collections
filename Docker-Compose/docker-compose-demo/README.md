# vote
```bash
docker build . -t voting-app
```
```bash
# test
docker run -p 5000:80 voting-app

# link redis
docker run -p 5000:80 --link redis:redis --name=voting-app voting-app
```
# redis
```bash
docker run --name=redis redis
```
# postgre
```bash
docker run -d --name=db -e POSTGRES_HOST_AUTH_METHOD=trust postgres:15-alpine
```
# worker
```bash
docker build . -t worker-app

docker run --link redis:redis --link db:db --name worker-app worker-app
```
# result
```bash
docker build . -t result-app

docker run -p 5001:80 --link db:db --name=result-app result-app
```