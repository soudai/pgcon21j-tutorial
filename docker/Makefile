# デフォルトアクション
.PHONY: run
run: up update logs

.PHONY: up
up: 
	docker-compose up -d

.PHONY: logs
logs:
	@docker-compose logs -f

.PHONY: down
down:
	docker-compose down

.PHONY: clean clean-postgres

clean: down clean-postgres

clean-postgres:
	-docker volume rm pgcon21j-data