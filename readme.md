Build and push image to Docker hub locally:
```bash
docker build -t sheludchenko/samplewebapp:latest .
docker push sheludchenko/samplewebapp:latest
```


Run sample application locally:
```bash
docker run --rm -p 8080:80 --name samplewebapp sheludchenko/samplewebapp:latest
```