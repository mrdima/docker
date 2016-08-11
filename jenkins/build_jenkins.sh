#docker login
#docker build -t mrdima/jenkins .
#docker push mrdima/jenkins
#docker run -d --name jenkins -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -p 8080:8080 mrdima/jenkins --name
docker-machine ssh node1 'docker service create --name jenkins --mount type=bind,src=/var/run/docker.sock,target=/var/run/docker.sock --mount type=bind,src=$(which docker),target=/usr/bin/docker -p 8080:8080 mrdima/jenkins'
IP=`docker-machine ip node1`
echo 'Waiting for Jenkins'
while [ `curl -s -w '%{http_code}' --connect-timeout 2 --max-time 2 -o /dev/null http://$IP:8080` != '200' ] ; do echo -n '.'; sleep 3; done
echo 'Copying Job to Jenkins Container'
#docker cp docker-test.xml jenkins:/tmp
#docker cp import_job.sh jenkins:/tmp
#docker exec -t jenkins sh -x /tmp/import_job.sh
#CID=`docker ps | grep jenkins | awk '{print $1}'`
NODE=`docker service ps jenkins | grep jenkins | awk '{print $4}'`
echo "Jenkins running on node $NODE"
eval $(docker-machine env $NODE)
CID=`docker ps | grep jenkins | awk '{print $1}'`
docker cp ./import_job.sh $CID:/tmp
docker cp ./docker-test.xml $CID:/tmp
docker exec -t $CID sh -x /tmp/import_job.sh
