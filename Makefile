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
	@echo "[NameNode] http://namenode:9870"
	@echo "[DataNode 1] http://datanode1:7201"
	@echo "[DataNode 2] http://datanode2:7202"

_urls-extra:
	@echo "[ResourceManager] http://resourcemanager:8088"
	@echo "[NodeManager] http://nodemanager:8042"
	@echo "[HistoryServer] http://historyserver:8188"

_urls-ultra:
	@echo "[Hue] http://hue:8888 (El primer usuario registrado se convierte en admin)"
	@echo "[Spark (master)] http://spark-master:8080"
	@echo "[Spark (worker)] http://spark-worker:8081"
	@echo "[Zeppelin] http://zeppelin:8090"
	@echo "[phpMyAdmin] http://phpmyadmin:8091"
