.PHONY: dev
dev:
	docker-compose -f docker-compose.dev.yml up

.PHONY: build
build:
	docker-compose -f docker-compose.dev.yml build

# into container
# app
.PHONY: app
app:
	docker-compose -f docker-compose.dev.yml exec app /bin/bash

# db
.PHONY: db
db:
	docker-compose -f docker-compose.dev.yml exec db mysql -u myuser -pmypass -D mydb

.PHONY: db-reset
db-reset:
	rm -rf ./db/mysql/volume
	docker-compose -f docker-compose.dev.yml build db
