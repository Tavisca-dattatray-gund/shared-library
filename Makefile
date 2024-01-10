help:
	@echo "run   : Run docker container"
	@echo "stop  : Stop docker container"
	@echo "clean : Clean docker container"

run:
	@chmod 755 *.sh
	@sh ./jenkins_docker.sh

stop:
	@docker stop jenkins

clean:
	@docker network rm jenkins
	@docker rmi jenkins