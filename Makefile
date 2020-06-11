help:
	@echo "Opciones:"
	@echo "  start | start-extra | start-ultra | stop | restart | stop-all"
	@echo "  hadoop"
	@echo "  stats | update | clean"

_start-command:
	@docker-compose up -d --remove-orphans

_start-command-extra:
	@docker-compose -f docker-compose.yml -f docker-compose.extra.yml up -d --remove-orphans

_start-command-ultra:
	@docker-compose -f docker-compose.yml -f docker-compose.extra.yml -f docker-compose.ultra.yml up -d --remove-orphans

start: _start-command _urls-head _urls-base _urls-footer

start-extra: _start-command-extra _urls-head _urls-base _urls-extra _urls-footer

start-ultra: _start-command-ultra _urls-head _urls-base _urls-extra _urls-ultra _urls-footer

stop:
	@docker-compose -f docker-compose.yml -f docker-compose.extra.yml -f docker-compose.ultra.yml stop

restart: stop start

stop-all:
	@docker stop `docker ps -aq`

hadoop:
	@docker-compose exec namenode /bin/bash

stats:
	@docker stats

update:
	@docker-compose pull

clean:
	@docker-compose -f docker-compose.yml -f docker-compose.extra.yml -f docker-compose.ultra.yml down -v --remove-orphans

_urls-head:
	@echo ""
	@echo "--------------------"

_urls-footer:
	@echo "--------------------"

_urls-base:
	@echo "\033[92m[NameNode]\033[0m http://namenode:9870"
	@echo "\033[92m[DataNode 1]\033[0m http://datanode1:7201"
	@echo "\033[92m[DataNode 2]\033[0m http://datanode2:7202"

_urls-extra:
	@echo "\033[92m[ResourceManager]\033[0m http://resourcemanager:8088"
	@echo "\033[92m[NodeManager]\033[0m http://nodemanager:8042"
	@echo "\033[92m[HistoryServer]\033[0m http://historyserver:8188"

_urls-ultra:
	@echo "\033[92m[Hue]\033[0m http://hue:8888 \033[93m(El primer usuario registrado se convierte en admin)\033[0m"
	@echo "\033[92m[Spark (master)]\033[0m http://spark-master:8080"
	@echo "\033[92m[Spark (worker)]\033[0m http://spark-worker:8081"
	@echo "\033[92m[Zeppelin]\033[0m http://zeppelin:8090"
	@echo "\033[92m[phpMyAdmin]\033[0m http://phpmyadmin:8091"
