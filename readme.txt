.
├── aggnidx
│   └── aggregate.txt
├── cursor
│   ├── explicit.sql
│   ├── implicit.sql
│   └── theory.txt
├── ddl
│   └── theory.txt
├── plsql
│   ├── library.sql
│   └── theory.txt
└── readme.txt


- mysql

$ systemctl status mysqld
$ mysql
sql> show databases;
sql> use <database>;
sql> show tables;
sql> show columns from <table>;

- mongodb

$ systemctl status mongod
$ mongosh

mongo> db.collection.find().pretty()
mongo> db.collection.drop()
