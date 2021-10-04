.PHONY: build

DB_HOST=mariadb
DB_NAME=magento
DB_USER=magento
DB_PASSWD=secretpassword

build:
	./bin/magento setup:install \
	--base-url=http://magento.dev \
	--db-host=$(DB_HOST) \
	--db-name=$(DB_NAME) \
	--db-user=$(DB_USER) \
	--db-password=$(DB_PASSWD) \
	--admin-firstname=admin \
	--admin-lastname=admin \
	--admin-email=admin@admin.com \
	--admin-user=admin \
	--admin-password=admin123 \
	--language=en_US \
	--currency=PHP \
	--timezone=Asia/Manila \
	--use-rewrites=1 \
	--elasticsearch-host=elasticsearch \
	--elasticsearch-port=9200