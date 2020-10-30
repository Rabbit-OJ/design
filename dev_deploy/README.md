# Dev environment Deploy Guidance

This needs a docker environment with docker-compose tools configured correctly

1. cd Rabbit-OJ-Backend/deploy/dev
2. Deploy mysql service with phpmyadmin: `docker-compose -f ./mysql-docker-compose.yml up -d`
3. Deploy Kafka service with zookeeper distributed coordinator `docker-compose -f ./kafka-docker-compose.yml up -d`

## First-time Experienced Data Preparation

If this is your first usage, please import experience_data and judge test cases for `A + B Problem`

1. open `localhost:8080` in browser, press `root` `P@ssw0rd` to login your mysql database
2. create a db named `oj` with `utf8mb4_generic_ci` charset
3. import `oj.sql` db file
4. cp -r `./judge` to `./files/judge`

## Certificate prepare

exec `./certs_generator.sh`


Then run your server