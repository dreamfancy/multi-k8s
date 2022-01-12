docker build -t dreamfancy1987/multi-client:latest -t dreamfancy1987/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t dreamfancy1987/multi-server:latest -t dreamfancy1987/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t dreamfancy1987/multi-worker:latest -t dreamfancy1987/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push dreamfancy1987/multi-client:latest
docker push dreamfancy1987/multi-server:latest
docker push dreamfancy1987/multi-worker:latest
docker push dreamfancy1987/multi-client:$SHA
docker push dreamfancy1987/multi-server:$SHA
docker push dreamfancy1987/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=dreamfancy1987/multi-server:$SHA


 