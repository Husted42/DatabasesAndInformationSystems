import os
from flask import Flask, render_template
import psycopg2

app = Flask(__name__)

# set your own database
#db = "dbname='bank' user='postgres' host='127.0.0.1' password = 'UIS'"


##### Routes #####
#Breweries
#To add new route: '/Carlsberg', Carlsberg(),  brewery = 'Carlsberg'
#And: Copy Carlsberg.html -> change name to [brewery].html
@app.route('/Carlsberg')
def carlsberg():
    #Variables
    brewery = 'Carlsberg'
    imgLogo = "/static/assets/" + brewery + ".png"
    
    #Setup database
    db = "dbname='beers' user='postgres' host='127.0.0.1' password = 'password'"
    conn = psycopg2.connect(db)

    #SQL
    cur = conn.cursor()
    cur.execute("SELECT * FROM Beers WHERE brewery = '{}';".format(brewery))
    beers = cur.fetchall()
    cur.close()
    conn.close()
    return render_template(brewery + '.html', beers = beers, imgLogo = imgLogo)

@app.route('/Svaneke')
def Svaneke():
    #Variables
    brewery = 'Svaneke'
    imgLogo = "/static/assets/" + brewery + ".png"
    
    #Setup database
    db = "dbname='beers' user='postgres' host='127.0.0.1' password = 'password'"
    conn = psycopg2.connect(db)

    #SQL
    cur = conn.cursor()
    cur.execute("SELECT * FROM Beers WHERE brewery = '{}';".format(brewery))
    beers = cur.fetchall()
    cur.close()
    conn.close()
    return render_template(brewery + '.html', beers = beers, imgLogo = imgLogo)

#Other
@app.route('/')
def home():
    return render_template('home.html')

@app.route("/about")
def about():
    return render_template('about.html')

@app.route("/brewers")
def brew():
    db = "dbname='beers' user='postgres' host='127.0.0.1' password = 'password'"
    conn = psycopg2.connect(db)
    cur = conn.cursor()
    cur.execute('SELECT * FROM Breweries;')
    Breweries = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('brew.html', Breweries = Breweries)

@app.route("/test")
def test():
    db = "dbname='beers' user='postgres' host='127.0.0.1' password = 'password'"
    conn = psycopg2.connect(db)
    cur = conn.cursor()
    cur.execute('SELECT * FROM Breweries;')
    Breweries = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('test.html', Breweries = Breweries)

if __name__ == "__main__":
    app.run(debug=True)