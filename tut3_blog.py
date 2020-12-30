from flask import Flask, render_template, request,session,redirect,flash
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
from werkzeug.utils import secure_filename
import json
import os
import math
from datetime import datetime


with open("D:\PycharmProjects\Web_Development_Flask\config.json", 'r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params["upload_location"]
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD=  params['gmail-password']
)
mail = Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


class Contacts(db.Model):
    srno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)

class Posts(db.Model):
    srno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    slug = db.Column(db.String(21), nullable=False)
    img_file = db.Column(db.String(21), nullable=False)
    tag_line=db.Column(db.String(21), nullable=False)


@app.route("/")
def home():
    flash("Code with harry","success")
    flash("like harry video","danger")
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params["no_of_posts"]))
    #[0:params["no_of_posts"]]
    #posts=posts[]

    page = request.args.get('page')
    if (not str(page).isnumeric()) :
        page = 1
    page=int(page)
    posts= posts[(page-1)*int(params["no_of_posts"]):(page-1)*int(params["no_of_posts"])+ int(params["no_of_posts"])]
    # Pagination logic
    # First
    if (page == 1):
        prev="#"
        next = "/?page=" + str(page+1)
    elif (page == last):
        prev = "/?page=" + str(page-1)
        next = "#"
    else:
        prev = " /?page=" + str(page-1)
        next = "/?page=" + str(page+1)

    return render_template('index.html', params=params,posts=posts,prev=prev,next=next)

@app.route("/post/<string:post_slug>",methods=["GET"])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()

    return render_template('post.html', params=params,post=post)


@app.route("/about")
def about():
    return render_template('about.html', params=params)

@app.route("/Qlik")
def qlik():
    return render_template('qliksense.html', params=params)    

@app.route("/dashboard",methods=['GET','POST'])
def dashboard():
    if ('user' in session and session['user'] == params['admin_user']) :
        posts = Posts.query.all()
        return render_template('dashboard.html',params=params,posts=posts)

    if request.method=='POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username == params['admin_user'] and userpass == params['admin_password']) :
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html',params=params,posts=posts)

    return render_template('login.html', params=params)

@app.route("/edit/<string:srno>",methods=["GET","POST"])
def edit(srno):
    if ('user' in session and session['user'] == params['admin_user']) :
        if request.method =='POST':
            box_title = request.form.get('title')
            content = request.form.get('content')
            date = datetime.now()
            slug = request.form.get('slug')
            img_file = request.form.get('img_file')
            tagline = request.form.get('tagline')


            if srno == 0:
                post=Posts(title=box_title, content=content, date=date, slug=slug, img_file=img_file, tagline=tagline)
                db.session.add(post)
                db.session.commit()
            else:
                post=Posts.query.filter_by(srno=srno).first()
                post.title = box_title
                post.content = content
                post.date = date
                post.slug = slug
                post.img_file = img_file
                post.tagline = tagline
                db.session.commit()
                return redirect('/edit/'+srno)

        post= Posts.query.filter_by(srno=srno).first()
        return render_template('edit.html', params=params, post=post, srno=srno)

@app.route("/uploader", methods = ['GET', 'POST'])
def uploader():
    if (request.method == "POST") :
        f = request.files['file1']
        f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
        return "Uploaded Successfully"

@app.route("/delete/<string:srno>", methods=["GET","POST"])
def delete(srno):
    if ('user' in session and session['user'] == params['admin_user']):
        post = Posts.query.filter_by(srno=srno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect ('/dashboard')

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect ('/dashboard')

@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if (request.method == 'POST') :
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, phone_num = phone, msg = message, date= datetime.now(),email = email )
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name,
                          sender=email,
                          recipients = [params['gmail-user']],
                          body = message + "\n" + phone
                          )
    flash("thanks for submitting your details. we will get back to you", "success")
    return render_template('contact.html', params=params)


app.run(debug=True)




#only use url for static at href
# no need to use url for static where https9(url) present and they directly loaded from cloud

# " {{ url_for('static',filename='path/filename.js') }}"

#we have fixed blog index page by putting above url for code
# but they are 100 of pages then we dont need to add url for in every page. that can be achieved by template inheritance
# jinja template technique