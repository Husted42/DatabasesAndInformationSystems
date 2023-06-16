import os
from flask import Flask, render_template, request, url_for, redirect
import psycopg2

app = Flask(__name__)


# set your own database
db = "dbname='postgres' user='postgres' host='127.0.0.1' password = 'vitus2001'"


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
    conn = psycopg2.connect(db)

    #SQL
    cur = conn.cursor()
    cur.execute("SELECT * FROM Beers WHERE brewery = '{}';".format(brewery))
    beers = cur.fetchall()
    cur.close()
    conn.close()
    return render_template(brewery + '.html', beers = beers, imgLogo = imgLogo)

@app.route('/Heineken')
def Heineken():
    #Variables
    brewery = 'Heineken'
    imgLogo = "/static/assets/" + brewery + ".png"
    
    #Setup database
    conn = psycopg2.connect(db)

    #SQL
    cur = conn.cursor()
    cur.execute("SELECT * FROM Beers WHERE brewery = '{}';".format(brewery))
    beers = cur.fetchall()
    cur.close()
    conn.close()
    return render_template(brewery + '.html', beers = beers, imgLogo = imgLogo)

@app.route('/Guinness')
def Guinness():
    #Variables
    brewery = 'Guinness'
    imgLogo = "/static/assets/" + brewery + ".png"
    
    #Setup database
    conn = psycopg2.connect(db)

    #SQL
    cur = conn.cursor()
    cur.execute("SELECT * FROM Beers WHERE brewery = '{}';".format(brewery))
    beers = cur.fetchall()
    cur.close()
    conn.close()
    return render_template(brewery + '.html', beers = beers, imgLogo = imgLogo)

@app.route('/Erdinger')
def Erdinger():
    #Variables
    brewery = 'Erdinger'
    imgLogo = "/static/assets/" + brewery + ".png"
    
    #Setup database
    conn = psycopg2.connect(db)

    #SQL
    cur = conn.cursor()
    cur.execute("SELECT * FROM Beers WHERE brewery = '{}';".format(brewery))
    beers = cur.fetchall()
    cur.close()
    conn.close()
    return render_template(brewery + '.html', beers = beers, imgLogo = imgLogo)

@app.route('/Mikkeller')
def Mikkeller():
    #Variables
    brewery = 'Mikkeller'
    imgLogo = "/static/assets/" + brewery + ".png"
    
    #Setup database
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

@app.route("/brewers")
def brew():
    conn = psycopg2.connect(db)
    cur = conn.cursor()
    cur.execute('SELECT * FROM Breweries;')
    Breweries = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('brew.html', Breweries = Breweries)

@app.route("/test")
def test():
    conn = psycopg2.connect(db)
    cur = conn.cursor()
    cur.execute('SELECT * FROM Breweries;')
    Breweries = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('test.html', Breweries = Breweries)


@app.route("/admin", methods=('GET', 'POST'))
def admin():
    conn = psycopg2.connect(db)
    cur = conn.cursor()
    if request.method == 'POST':
        nm = request.form['nm']
        brew = request.form['brew']
        typee = request.form['type']
        alc = request.form['alc']
        desc = request.form['desc']
        cur.execute("INSERT INTO Beers(name, type, alc, description, brewery) VALUES ('{}', '{}', {}, '{}', '{}');".format(nm, typee, alc, desc, brew))
        conn.commit()
    return render_template('admin.html')



if __name__ == "__main__":
    app.run(debug=True)