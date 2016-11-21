
# all the imports
import os
import sqlite3
import time
from flask import Flask, request, session, g, redirect, url_for, abort, \
     render_template, flash
import database

app = Flask(__name__)


# Load default config and override config from an environment variable
app.config.update(dict(
    DATABASE=os.path.join(app.root_path, 'flaskr.db'),
    SECRET_KEY='development key',
))


app.config.from_envvar('FLASKR_SETTINGS', silent=True)

def connect_db():
    """Connects to the specific database."""
    rv = sqlite3.connect(app.config['DATABASE'])
    rv.row_factory = sqlite3.Row
    return rv


def get_db():
    """Opens a new database connection if there is none yet for the
    current application context.
    """
    if not hasattr(g, 'sqlite_db'):
        g.sqlite_db = connect_db()
    return g.sqlite_db


@app.teardown_appcontext
def close_db(error):
    """Closes the database again at the end of the request."""
    if hasattr(g, 'sqlite_db'):
        g.sqlite_db.close()


def init_db():
    db = get_db()
    with app.open_resource('tables.sql', mode='r') as f:
        db.cursor().executescript(f.read())
    db.commit()



@app.cli.command('initdb')
def initdb_command():
    """Initializes the database."""
    init_db()
    print 'Initialized the database.'

@app.route('/dash')
def dashboard():
    return render_template('dashboard.html')

@app.route('/')
def home():
    db = get_db()
    cur = db.execute('SELECT * FROM STUDENT')
    students = cur.fetchall()
    text= "This is the home page"
    title="Home"
    return render_template('home.html', text=text, title=title, students=students)


@app.route('/students/<int:stu_id>')
def students(stu_id):
    db = get_db()
    stu_id = stu_id
    cur = db.execute('SELECT * FROM PROGRAM')
    programs = cur.fetchall()


    text ='This page is for students!'
    title="Students"
    return render_template('student.html', text=text,title=title, programs=programs, stu_id=stu_id)


@app.route('/registration')
def registration():
    title="Registration"
    return render_template('registration.html', title=title, programs=programs)

@app.route('/programs/<int:prog_id>')
def programs(prog_id):
    if prog_id == "":
        prog_id = 1
    db = get_db()
    try:
        cur = db.execute('SELECT * FROM APPLICATION, STUDENT  WHERE APPLICATION.prog_id == ? AND APPLICATION.app_decision == 2', [prog_id])
        applications = cur.fetchall()
    except:
        flash("Something went wrong")
    cur = db.execute('SELECT * FROM PROGRAM WHERE PROGRAM.prog_id == ?', [prog_id])
    programs = cur.fetchall()


    text = 'This page is for program owners'
    title = "Programs"
    return render_template('program.html', text=text,title=title, programs=programs, applications=applications)

@app.route('/agencies')
def agencies():
    db = get_db()
    cur = db.execute('SELECT * FROM STUDENT')
    students = cur.fetchall()
    text = 'This page is for government agencies'
    title = "Government Agencies"
    return render_template('agency.html', text=text,title=title, students=students)

@app.route('/recruiters')
def recruiters():
    db = get_db()
    cur = db.execute('SELECT * FROM APPLICATION')
    applications = cur.fetchall()
    cur = db.execute('SELECT * FROM STUDENT')
    students = cur.fetchall()
    text = 'This page is for the decision makers'
    title="Recruiters"
    return render_template('recruiter.html', text=text,title=title, applications=applications, students=students)

@app.route('/register', methods=['POST'])
def register():
    db = get_db()
    try:
        stu_name = request.form['stu_name']
        high_school = request.form['high_school']
        stu_gpa = request.form['stu_gpa']
        essay = request.form['essay']

        db.execute('INSERT INTO STUDENT(stu_name, stu_high_school, stu_gpa, stu_demographics, stu_essay) VALUES (?, ?,?,?,?)',
                   [stu_name, high_school, stu_gpa, "Demographics met",essay])
        db.commit()
        flash('Student Account Created')
    except:
        flash('Something went wrong')

    return redirect(url_for('recruiters'))


@app.route('/apply', methods=['POST'])
def apply():
    try:
        db = get_db()
        program =request.form['program']
        student =request.form['student']
        db.execute('INSERT INTO APPLICATION( app_fee_paid, app_date, app_decision, stu_id, prog_id) '
                   'VALUES ("yes", "06-06-2012", 0, ?, ?)', [program, student])

        db.commit()
        flash("Applied successfully")
    except:
        flash("That didnt work fam")
    return redirect(url_for('registration'))

@app.route('/admit', methods=['POST'])
def admit():
    try:
        db = get_db()
        app = request.form['app']
        db.execute("UPDATE APPLICATION SET app_decision = 2 WHERE app_id = ?", app)
        print "we g0t here"
        db.commit()
        flash("Accepted")
    except:
        flash("Something went wrong")
    return redirect(url_for('recruiters'))

@app.route('/deny', methods=['POST'])
def deny():
    try:
        db = get_db()
        app = request.form['app']
        db.execute("UPDATE APPLICATION SET app_decision = 1 WHERE app_id = ?", app)
        db.commit()
        flash("Denied")
    except:
        flash("Something went wrong with denying")
    return redirect(url_for('recruiters'))

if __name__ == '__main__':
    app.run()
