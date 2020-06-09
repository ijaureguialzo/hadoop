help:
	@echo "Opciones:"
	@echo "  start | stop | restart | stop-all"
	@echo "  hadoop"
	@echo "  update | clean"

_start-command:
	@docker-compose up -d

start: _start-command _urls

stop:
	@docker-compose stop

restart: stop start

stop-all:
	@docker stop `docker ps -aq`

hadoop:
	@docker-compose exec namenode /bin/bash

update:
	@docker-compose pull

clean:
	@docker-compose down -v

_urls:
	@echo ""
	@echo "--------------------"
	@echo "\033[92m[NameNode]\033[0m https://namenode"
	@echo "\033[92m[DataNode 1]\033[0m https://datanode1"
	@echo "\033[92m[DataNode 2]\033[0m https://datanode2"
	@echo "\033[92m[ResourceManager]\033[0m https://resourcemanager"
	@echo "\033[92m[NodeManager]\033[0m https://nodemanager"
	@echo "\033[92m[HistoryServer]\033[0m https://historyserver"
	@echo "--------------------"
