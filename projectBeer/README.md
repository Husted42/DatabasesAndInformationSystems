# DIS Project - June '23
A beer database where you can learn more about the beers, their brewers, alc %, history and description. Alongside the feature to add new beers to the site/database. 

## Authors
- Alexander Husted - wqg282 
- August Pallesen - wqm205 
- Sky Wong - lgz282

## Deployment
To deploy this project you need to have the modules
- flask 
- psycopg2

```bash
$ pip install flask 
$ pip install psycopg2
```
Run the files in sqlQueries in your database (pgadmin): 
- createTables.sql 
- insertData.sql
- noteQueries.sql 

After installing the modules and having all the files, run app.py: 
```bash
$ python3 app.py
```
Now you can acces the hopefully functioning web-app:) 

## Features
- List of breweries
    - List of beers that the breweries make
- Add new beers 
