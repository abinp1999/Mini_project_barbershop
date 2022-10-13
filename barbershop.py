from flask import *
from DBConnection import*
db=Db()

static_path="F:\\saloon mini project 111\\barbershop\\barbershop\\static\\"

app = Flask(__name__)
app.secret_key ="hii"



@app.route('/')
def launching():
    return render_template('intro_index.html')

@app.route('/login')
def login():
    return render_template('index.html')


@app.route('/login_post',methods=['post'])
def login_post():
    db=Db()
    un=request.form['textfield']
    pswd=request.form['textfield2']
    qry="select * from login WHERE username='"+un+"'and password='"+pswd+"'"
    res = db.selectOne(qry)
    if res is not None:
        session['lid']=res['login_id']
        if res['type']=='admin':
            return redirect('/admin_home')
        elif res['type']=='shop':
            return redirect('/barber_home')
        elif res['type'] == 'user':
            return redirect('/user_home')
        else:
            return "<script>alert('Invalid username or password');window.location='/'</script>"
    else:
        return "<script>alert('Invalid username or password');window.location='/'</script>"


@app.route("/adminviewusers")
def adminviewusers():
    qry="select * from users"
    db=Db()
    res=db.select(qry)
    return  render_template("admin/viewuser.html",data=res)

@app.route("/adminviewuserssearchpost",methods=['post'])
def adminviewuserssearchpost():
    search=request.form["search"]

    qry="select * from users where username like '%"+search+"%'"
    db=Db()
    res=db.select(qry)
    return  render_template("admin/viewuser.html",data=res)


@app.route("/a")
def a():
    return  render_template("admin/admin_sub_index.html")
@app.route('/admin_home')
def adminhome():
    return render_template('admin/adminhome.html')
@app.route('/user_home')
def user_home():
    return render_template('user/home.html')
@app.route('/barber_home')
def barber_home():
    return render_template('barbershop/home.html')


@app.route('/bsignup')
def signup():
    return render_template('barbershop/Barbershop_signup.html')


@app.route('/bsignup_post',methods=['post'])
def signup_post():
    db=Db()
    name=request.form['textfield']
    photo=request.files['fileField']


    from datetime import datetime
    filename=datetime.now().strftime("%Y%m%d%H%M%S")



    photo.save(static_path+"\\photo\\"+ filename+".jpg")
    file="/static/photo/"+filename+".jpg"


    place=request.form['textfield1']
    post=request.form['textfield2']
    pin=request.form['textfield3']
    dist=request.form['textfield4']
    latti=request.form['textfield5']
    longi=request.form['textfield6']
    phone=request.form['textfield7']
    email=request.form['textfield8']
    type=request.form['textfield10']
    lisc=request.form['textfield11']
    pswd=request.form['textfield12']
    qry1="insert into login values('','"+email+"','"+pswd+"','shop')"
    lid=db.insert(qry1)
    qry="INSERT INTO `barber_shop` (`shop_lid`,`shop_name`,`shop_image`,`shop_place`,`shop_post`,`shop_pin`,`shop_district`,`shop_latitude`,`shop_longitude`,`shop_phone`,`shop_email`,`shop_status`,`shop_type`,`shop_liscence`) VALUES ('"+str(lid)+"','"+name+"','"+file+"','"+place+"','"+post+"','"+pin+"','"+dist+"','"+latti+"','"+longi+"','"+phone+"','"+email+"','pending','"+type+"','"+lisc+"')"
    res=db.insert(qry)
    return '''<script>alert("registration successfull");window.location="/bsignup"</script>'''


@app.route('/bsignup_edit_post',methods=['post'])
def bsignup_edit_post():
    db=Db()

    name=request.form['textfield']




    place=request.form['textfield1']
    post=request.form['textfield2']
    pin=request.form['textfield3']
    dist=request.form['textfield4']
    latti=request.form['textfield5']
    longi=request.form['textfield6']
    phone=request.form['textfield7']
    email=request.form['textfield8']
    type=request.form['textfield10']
    lisc=request.form['textfield11']
    id=request.form['id']


    if 'fileField' in request.files:

        photo = request.files['fileField']
        if photo.filename !="":
            from datetime import datetime
            filename = datetime.now().strftime("%Y%m%d%H%M%S")
            photo.save(static_path + "\\photo\\" + filename + ".jpg")
            file = "/static/photo/" + filename + ".jpg"
            qry="UPDATE `barber_shop` SET `shop_name`='"+name+"',`shop_image`='"+file+"',`shop_place`='"+place+"',`shop_post`='"+post+"',`shop_pin`='"+pin+"',`shop_district`='"+dist+"',`shop_latitude`='"+latti+"',`shop_longitude`='"+longi+"',`shop_phone`='"+phone+"',`shop_email`='"+email+"',`shop_type`='"+type+"',`shop_liscence`='"+lisc+"' WHERE `shop_lid`='"+id+"'"
            db=Db()
            db.update(qry)
        else:
            qry = "UPDATE `barber_shop` SET `shop_name`='" + name + "',`shop_place`='" + place + "',`shop_post`='" + post + "',`shop_pin`='" + pin + "',`shop_district`='" + dist + "',`shop_latitude`='" + latti + "',`shop_longitude`='" + longi + "',`shop_phone`='" + phone + "',`shop_email`='" + email + "',`shop_type`='" + type + "',`shop_liscence`='" + lisc + "' WHERE `shop_lid`='" + id + "'"
            db = Db()
            db.update(qry)
    else:
        qry = "UPDATE `barber_shop` SET `shop_name`='" + name + "',`shop_place`='" + place + "',`shop_post`='" + post + "',`shop_pin`='" + pin + "',`shop_district`='" + dist + "',`shop_latitude`='" + latti + "',`shop_longitude`='" + longi + "',`shop_phone`='" + phone + "',`shop_email`='" + email + "',`shop_type`='" + type + "',`shop_liscence`='" + lisc + "' WHERE `shop_lid`='" + id + "'"
        db = Db()
        db.update(qry)

    return '''<script>alert("Updated  successfully");window.location="/barbershop_view_profile"</script>'''




@app.route('/barbershop_view_profile')
def barbershop_view_profile():
    db = Db()
    qry = "select * from barber_shop where shop_lid ='"+str(session['lid'])+"'"
    res = db.selectOne(qry)
    return render_template('barbershop/view_profile.html',data=res)


@app.route('/barbershop_edit_profile')
def barbershop_edit_profile():
    db = Db()
    qry = "select * from barber_shop where shop_lid ='"+str(session['lid'])+"'"
    res = db.selectOne(qry)
    return render_template('barbershop/Barbershop_editprofile.html',data=res)


@app.route('/change_pswrd_B')
def change_pswrd_B():
    return render_template('barbershop/Changepassword.html')
@app.route('/change_pswrdb_post', methods=['post'])
def change_pswrdb_post():
    op = request.form['textfield']
    np = request.form['textfield2']
    cp = request.form['textfield3']
    db = Db()
    qry = "SELECT * FROM `login` WHERE `password`='"+op+"'"
    res = db.selectOne(qry)
    if res is not None:
        if np==cp:
            qry = "UPDATE login SET `password`='"+np+"' WHERE `login_id`='"+str(session['lid'])+"'"
            res = db.update(qry)
    return redirect('/')


@app.route('/changeps')
def changeps():
    return render_template('user/Changepassword.html')



@app.route('/edishopform/<id>')
def editform(id):
    db=Db()
    qry="select * from barbershop where shop_id='"+id+"'"
    res=db.selectOne(qry)
    return render_template('barbershop/Edit_Barber_shop.html', data=res)



@app.route('/editshopform_post',methods=['post'])
def editform_post():
    db=Db()
    name = request.form['textfield']
    photo = request.files['fileField']
    photo.save(static_path+"\\photo\\"+photo.filename)
    place = request.form['textfield1']
    post = request.form['textfield2']
    pin = request.form['textfield3']
    dist = request.form['textfield4']
    latti = request.form['textfield5']
    longi = request.form['textfield6']
    phone = request.form['textfield7']
    email = request.form['textfield8']
    type = request.form['textfield9']
    lisc = request.form['textfield10']
    pswd = request.form['textfield11']
    conpswd = request.form['textfield13']
    qry="update barbershop set `name`='"+name+"',photo='"+photo+"',place='"+place+"',post='"+post+"',pin='"+pin+"',district='"+dist+"',lattitude='"+latti+"',longitude='"+longi+"',phone='"+phone+"',email='"+email+"',`type`='"+type+"',liscence='"+lisc+"',password='"+pswd+"',confirm_pass='"+conpswd+"'"
    db.update(qry)
    return '''<script>alert("registered");window.location="/viewbarbershop"</script>'''


@app.route('/addservice')
def addservice():
    return render_template('barbershop/add_service_barbershop.html')


@app.route('/addservice_post',methods=['post'])
def addservice_post():
    service=request.form['textfield']
    des=request.form['textarea']
    rate=request.form['textfield2']
    db=Db()
    qry = "INSERT INTO `services`(`service_lid`,`service_name`,`Description`,`rate`) VALUES('"+str(session['lid'])+"','"+service+"','"+des+"','"+rate+"')"
    res = db.insert(qry)
    return redirect('/addservice')

@app.route('/vservices')
def vservices():
    db=Db()
    qry="select * from services where service_lid ='"+str(session['lid'])+"'"
    res=db.select(qry)
    return render_template("barbershop/viewservices.html",data=res)

@app.route('/delete_Service/<did>')
def delete_Service(did):
    db = Db()
    qry = "DELETE FROM `services` WHERE `service_id` ='"+str(did)+"'"
    res = db.delete(qry)
    return '''<script>alert('Deleted Successfully');window.location='/vservices'</script>'''


@app.route('/edit_service/<did>')
def edit_service(did):
    db = Db()
    qry = "SELECT * FROM `services` WHERE `service_id` ='"+str(id)+"'"
    red = db.selectOne(qry)
    return render_template('barbershop/edit_Service.html',data=red)

@app.route('/edit_servicepost', methods=['post'])
def edit_servicepost():
    db = Db()
    sid = request.form['h1']
    service = request.form['textfield']
    description = request.form['textarea']
    rate = request.form['textfield2']
    qry = "UPDATE `services` SET `service_name`='"+service+"', `Description`='"+description+"', `rate`='"+rate+"' WHERE `service_id`='"+str(sid)+"'"
    res = db.update(qry)
    return redirect('/vservices')

@app.route('/admin_approvebarbershop')
def vapproved():
    db=Db()
    qry="select * from barber_shop where `shop_status`='pending'"
    res=db.select(qry)
    return render_template('admin/view_barbershop.html', data=res)



@app.route('/admin_approvebarbershopseacrh',methods=['post'])
def admin_approvebarbershopseacrh():
    s=request.form["search"]
    db=Db()
    qry="select * from barber_shop where `shop_status`='pending' and shop_name like '%"+s+"%'"
    res=db.select(qry)
    return render_template('admin/view_barbershop.html', data=res)



@app.route('/review')
def review():
    return render_template('user/Review.html')

@app.route('/review_post',methods=['post'])
def review_post():
    db=Db()
    rev=request.form['review']
    qry="insert into review values('','"+rev+"')"
    db.insert(qry)
    return '''<script>alert("add review");window.location="/review"</script>'''

@app.route('/admin_sentnotification')
def snotific():
    return render_template('admin/sendnotification.html')

@app.route("/adminviewnotification")
def adminviewnotification():
    qry="select * from admin_notification"
    db=Db()
    res=db.select(qry)
    return render_template("admin/viewnotification.html",data=res)
@app.route("/admindeletenotification/<id>")
def admindeletenotification(id):
    db=Db()
    qry="delete from admin_notification where nid='"+id+"'"
    db.delete(qry)
    return  "<script>alert('Notification added successfully');window.location='/adminviewnotification'</script>"
@app.route('/snotific_post',methods=['post'])
def snotific_post():
    sn=request.form['text1']
    qry="insert into admin_notification VALUES ('','"+sn+"',curdate())"
    db.insert(qry)
    return "<script>alert('Notification added successfully');window.location='/admin_sentnotification'</script>"




@app.route('/vrejected')
def vrejected():
    db=Db()
    qry="select * from barber_shop where `shop_status`='rejected'"
    res=db.select(qry)
    return render_template('admin/view_barbershop.html', data=res)

@app.route('/viewbarbershop')
def viewbarbershop():
    db=Db()
    qry="select * from barber_shop where shop_status='approved' "
    res=db.select(qry)
    return render_template("admin/viewapproved.html", data=res)

@app.route("/viewbarbershopsearch",methods=['post'])
def viewbarbershopsearch():
    db=Db()
    search= request.form["search"]

    qry = "select * from barber_shop where shop_status='approved' and shop_name like '%"+search+"%' "
    res = db.select(qry)
    return render_template("admin/viewapproved.html", data=res)



@app.route('/adminviewrejectedbarbershop')
def adminviewrejectedbarbershop():
    db=Db()
    qry="select * from barber_shop where shop_status='rejected' "
    res=db.select(qry)
    return render_template("admin/viewrejected.html", data=res)


@app.route('/adminviewrejectedbarbershopsearch',methods=['post'])
def adminviewrejectedbarbershopsearch():
    db=Db()
    search= request.form["search"]
    qry="select * from barber_shop where shop_status='rejected' and shop_name like '%"+search+"%' "
    res=db.select(qry)
    return render_template("admin/viewrejected.html", data=res)



@app.route('/approveshop/<bid>')
def approveshop(bid):
    db=Db()

    qry="update barber_shop set `shop_status`='approved' where shop_id='"+bid+"'"

    res=db.update(qry)
    return redirect('/admin_approvebarbershop')


@app.route('/rejectshop/<bid>')
def rejectshop(bid):
    db = Db()
    qry ="update barber_shop set `shop_status`='rejected' where shop_id='" + bid + "'"
    res = db.update(qry)
    return redirect('/admin_approvebarbershop')


@app.route("/admin_changepassword")
def admin_changepassword():
    return  render_template("admin/Changepassword.html")

@app.route("/admin_changepasswordpost",methods=['post'])
def admin_changepasswordpost():
    old= request.form["o"]
    n= request.form["n"]
    db=Db()
    qry="SELECT * FROM login WHERE `password`='"+old+"' AND `login_id`='"+str(session["lid"])+"'"
    res=db.selectOne(qry)
    if res is not None:
        qry="update login set password='"+n+"' where `login_id`='"+str(session["lid"])+"'"
        db.update(qry)
        return "<script>alert('Password changed successfully'); window.location='/'</script>"
    else:
        return "<script>alert('Invalid details given'); window.location='/'</script>"





@app.route('/usersignup')
def usersignup():
    return render_template('user/usersignup.html')

@app.route("/userbooking",methods=['post'])
def userbooking():

    date= request.form["date"]
    time= request.form["time"]

    qry="INSERT INTO `booking main` (`user_lid`,`shop_lid`,`amount`,`status`,`date`,`time`) VALUES ('"+str(session['lid'])+"','"+session["shoplid"]+"','0','pending','"+date+"','"+time+"')"
    db=Db()
    bookingmasterid=db.insert(qry)

    serviceids= request.form.getlist("check1")

    for i in serviceids:
        qry="INSERT INTO `booking_sub` (`book_id`,`service_id`) VALUES ('"+str(bookingmasterid)+"','"+i+"')"
        db.insert(qry)

    return "<script>alert('Service booking done successfully');window.location='/user_viewbarbershops'</script>"

@app.route("/userviewmybooking")
def userviewmybooking():
    qry="SELECT `booking main`.*,`barber_shop`.* FROM `barber_shop` INNER JOIN `booking main` ON `barber_shop`.`shop_lid`=`booking main`.`shop_lid` WHERE `user_lid`='"+str(session["lid"])+"'"
    db=Db()
    res=db.select(qry)
    return  render_template("user/viewmybooking.html",data=res)

@app.route("/userviewmybookingpost",methods=['post'])
def userviewmybookingpost():
    f=request.form["f"]
    t=request.form["t"]

    qry="SELECT `booking main`.*,`barber_shop`.* FROM `barber_shop` INNER JOIN `booking main` ON `barber_shop`.`shop_lid`=`booking main`.`shop_lid` WHERE `user_lid`='"+str(session["lid"])+"' and date between '"+f+"' and '"+t+"'"
    db=Db()
    res=db.select(qry)
    return  render_template("user/viewmybooking.html",data=res)




@app.route('/usersignup_post',methods=['post'])
def usersignup_post():
    db=Db()
    uname=request.form['textfield']
    age=request.form['textfield2']
    gender=request.form['radiobutton']
    phone=request.form['textfield3']
    email=request.form['textfield4']
    photo=request.files['fileField']
    from datetime import datetime
    filename = datetime.now().strftime("%Y%m%d%H%M%S")
    photo.save(static_path + "\\photo\\" + filename + ".jpg")
    file= "/static/photo/" + filename + ".jpg"
    place=request.form['textfield5']
    post=request.form['textfield6']
    pin=request.form['textfield7']
    pswd=request.form['textfield8']
    qry1 = "insert into login values('','" + email + "','" + pswd + "','user')"
    lid = db.insert(qry1)
    qry="INSERT INTO `users`(user_lid,username,age,gender,phone,email,photo,place,post,pin) VALUES ('"+str(lid)+"','"+uname+"','"+age+"','"+gender+"','"+phone+"','"+email+"','"+file+"','"+place+"','"+post+"','"+pin+"')"
    db.insert(qry)
    return '''<script>alert("registration successfull");window.location="/"</script>'''

@app.route("/user_viewbarbershops")
def user_viewbarbershops():
    db=Db()
    qry="SELECT * FROM `barber_shop` WHERE `shop_status`='approved'"
    res=db.select(qry)
    return  render_template("user/view_barbershops.html",data=res)

@app.route("/user_viewbarbershopssearchpost",methods=['post'])
def user_viewbarbershopssearchpost():
    db=Db()
    search= request.form["search"]
    qry="SELECT * FROM `barber_shop` WHERE `shop_status`='approved' and shop_pin like '%"+search+"%'"
    res=db.select(qry)
    return  render_template("user/view_barbershops.html",data=res)




@app.route("/user_viewbarshopservicesandreviews/<shoplid>")
def user_viewbarshopservicesandreviews(shoplid):
    session["shoplid"]=shoplid
    db=Db()
    qry="SELECT * FROM `services` WHERE `service_lid`='"+shoplid+"'"
    services= db.select(qry)

    qry1="SELECT `review`.*,`users`.* FROM `users` INNER JOIN `review` ON `review`.`user_lid`=`users`.`user_lid` WHERE `review`.`shop_id`='"+shoplid+"'"
    reviews= db.select(qry1)

    return  render_template("user/Review.html",services=services,reviews=reviews)

@app.route("/useraddreview",methods=['post'])
def useraddreview():
    rating=request.form["rating"]
    review=request.form["review"]
    qry="INSERT INTO `review` (`user_lid`,`rating`,`review`,`date`,`shop_id`) VALUES ('"+str(session['lid'])+"','"+rating+"','"+review+"',CURDATE(),'"+session["shoplid"]+"')"
    db=Db()
    db.insert(qry)
    return "<script>alert('Review added successfully');window.location='/user_viewbarshopservicesandreviews/'"+session["shoplid"]+"</script>"

@app.route("/userviewprofile")
def userviewprofile():
    db=Db()
    qry="SELECT * FROM `users` WHERE `user_lid`='"+str(session['lid'])+"'"
    res=db.selectOne(qry)
    return  render_template("user/view_profile.html",data=res)






@app.route("/barbershopviewreviews")
def barbershopviewreviews():
    qry1="SELECT `review`.*,`users`.* FROM `users` INNER JOIN `review` ON `review`.`user_lid`=`users`.`user_lid` WHERE `review`.`shop_id`='"+str(session['lid'])+"'"
    reviews= db.select(qry1)
    return  render_template("barbershop/viewreviews.html",data=reviews)

@app.route("/barbershop_changepassword")
def barbershop_changepassword():
    return  render_template("barbershop/chnagepassword.html")

@app.route("/barbershop_changepasswordpost",methods=['post'])
def barbershop_changepasswordpost():
    old= request.form["o"]
    n= request.form["n"]
    db=Db()
    qry="SELECT * FROM login WHERE `password`='"+old+"' AND `login_id`='"+str(session["lid"])+"'"
    res=db.selectOne(qry)
    if res is not None:
        qry="update login set password='"+n+"' where `login_id`='"+str(session["lid"])+"'"
        db.update(qry)
        return "<script>alert('Password changed successfully'); window.location='/'</script>"
    else:
        return "<script>alert('Invalid details given'); window.location='/'</script>"

@app.route("/user_changepassword")
def user_changepassword():
    return  render_template("user/Changepassword.html")
@app.route("/userviewservices/<slid>")
def userviewservices(slid):
    session["shoplid"]=slid
    db=Db()
    qry="SELECT * FROM `services` WHERE `service_lid`='"+slid+"'"
    res=db.select(qry)
    return  render_template("user/viewservices.html",data=res)

@app.route("/userviewreviews/<slid>")
def userviewreviews(slid):
    db=Db()
    qry="SELECT `review`.*,`users`.* FROM `users` INNER JOIN `review` ON `review`.`user_lid`=`users`.`user_lid` WHERE `shop_id`='"+slid+"'"
    res=db.select(qry)
    return  render_template("user/Review.html",data=res, slid=slid)






@app.route("/user_changepasswordpost",methods=['post'])
def user_changepasswordpost():
    old= request.form["o"]
    n= request.form["n"]
    db=Db()
    qry="SELECT * FROM login WHERE `password`='"+old+"' AND `login_id`='"+str(session["lid"])+"'"
    res=db.selectOne(qry)
    if res is not None:
        qry="update login set password='"+n+"' where `login_id`='"+str(session["lid"])+"'"
        db.update(qry)
        return "<script>alert('Password changed successfully'); window.location='/'</script>"
    else:
        return "<script>alert('Invalid details given'); window.location='/'</script>"



if __name__ == '__main__':
    app.run(debug=True)
