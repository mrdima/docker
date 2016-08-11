CID=`docker ps | grep jenkins | awk '{print $1}'`
docker cp ./docker-test.xml $CID:/tmp
docker cp ./import_job.sh $CID:/tmp
docker exec -t $CID sh -x /tmp/import_job.sh
