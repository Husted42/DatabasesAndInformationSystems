# DIS Project - June '23
A beer database where you can learn more about the beers, their brewers, alc %, history and description. Alongside the option to add new beers to the site/database. 

## Authors
- Alexander Husted - wqg282 
- August Pallesen - wqm205 
- Sky Wong - lgz282

## Deployment
To deploy this project run have the modules
- flask 
- psycopg2

```bash
$ pip install flask 
$ pip install psycopg2
```
After installing the modules and having all the files, set up the your database in app.py 
```bash
db = "dbname='beers' user='postgres' host='127.0.0.1' password = 'password'"
```
Run the files in sqlQueries in your database (pgadmin): 
- createTables.sql 
- insertData.sql
- noteQueries.sql 
Now you can acces the hopefully functioning web-app:) 
