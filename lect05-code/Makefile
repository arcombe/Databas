DB_NAME=sample.db

compile:
	make clean
	javac app/*

run:
	make compile
	java -cp ".:sqlite-jdbc.jar" app.Main

database:
	rm -f $(DB_NAME)
	sqlite3 $(DB_NAME) < Schema.sql
	sqlite3 $(DB_NAME) < Data.sql

clean:
	rm -f app/*.class
