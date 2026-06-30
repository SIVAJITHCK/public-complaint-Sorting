import json
import smtplib
from datetime import datetime
from email.mime.text import MIMEText

from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.db.models import Q
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

# Create your views here.
from pcs1app.models import *
from pcs1app.newcnn1 import predictcnn


def login(request):
    return render(request, "indexlogin.html")



def logout(request):
    auth.logout(request)
    return render(request, "indexlogin.html")


def login_code(request):
    Uname = request .POST ['textfield']
    Pwrd = request.POST ['textfield2']
    try:
        Ob= Login_table.objects.get (Username=Uname,Password=Pwrd)
        if Ob.Type == 'Admin':
            ob1=auth.authenticate(username='admin', password='123')
            if ob1 is not None:
                auth.login(request,ob1)
            request.session['lid']=Ob.id
            return HttpResponse ('''<script> alert("welcome");window.location="admin_home"</script>''')
        elif Ob.Type == 'ert':
            ob1 = auth.authenticate(username='admin', password='123')
            if ob1 is not None:
                auth.login(request,ob1)
            request.session['lid'] = Ob.id
            return HttpResponse ('''<Script> alert("welcome");window.location="ert"</Script>''')
        elif Ob.Type == 'officer' :
            ob1 = auth.authenticate(username='admin', password='123')
            if ob1 is not None:
                auth.login(request,ob1)
            request.session['lid']=Ob.id
            return HttpResponse ('''<Script> alert("welcome");window.location = "officer_home"</Script>''')
        else:
            return HttpResponse ('''<Script> alert("invalid");window.location = "/"</Script>''')

    except:
        return HttpResponse('''<Script> alert("invalid user name or password");window.location = "/"</Script>''')





#
# def logout(request):
#     return render(request, "indexlogin.html")


# ///////////////////////////////////////ADMIN /////////////////////////////////

@login_required(login_url='/')


def manage_officer(request):
    ob=Officer_table.objects.all()
    ob1=Department_table.objects.all()
    return render(request, "admin/manage officer.html",{"val":ob,"val1":ob1})
@login_required(login_url='/')


def manage_officersrch(request):
    nm=request.POST['select']
    ob1=Department_table.objects.all()
    ob=Officer_table.objects.filter(DEPARTMENT=nm)
    return render(request, "admin/manage officer.html",{'val':ob,'val1':ob1})

@login_required(login_url='/')

def addof(request):
    name=request.POST['textfield']
    Place=request.POST['textarea']
    Post=request.POST['textfield2']
    Pin = request.POST['textfield3']
    Phone = request.POST['textfield4']
    Email = request.POST['textfield5']
    Department = request.POST['select']
    Username = request.POST['textfield6']
    Password = request.POST['textfield7']

    ob=Login_table()
    ob.Username=Username
    ob.Password=Password
    ob.Type='officer'
    ob.save()

    ob1=Officer_table()
    ob1.Name=name
    ob1.Place=Place
    ob1.Post = Post
    ob1.Pin = Pin
    ob1.Phone = Phone
    ob1.Email = Email
    ob1.DEPARTMENT =Department_table.objects.get(id=Department)
    ob1.LOGIN=ob
    ob1.save()
    return HttpResponse('''<Script> alert("added");window.location = "manage_officer#about"</Script>''')
@login_required(login_url='/')


def deleteofficer(request,id):
    ob=Officer_table.objects.get(id=id)
    ob1=Login_table.objects.get(id=ob.LOGIN.id)
    ob1.delete()
    return HttpResponse('''<Script> alert("deleted");window.location = "/manage_officer#about"</Script>''')
@login_required(login_url='/')


def editofficer(request,id):
    ob=Officer_table.objects.get(id=id)
    ob1=Department_table.objects.all()
    request.session['oid']=ob.id
    return render(request,'admin/edit officer.html',{'val':ob,'val1':ob1})
@login_required(login_url='/')


def editaddof(request):
    name=request.POST['textfield']
    Place=request.POST['textarea']
    Post=request.POST['textfield2']
    Pin = request.POST['textfield3']
    Phone = request.POST['textfield4']
    Email = request.POST['textfield5']


    ob1=Officer_table.objects.get(id=request.session['oid'])
    ob1.Name=name
    ob1.Place=Place
    ob1.Post = Post
    ob1.Pin = Pin
    ob1.Phone = Phone
    ob1.Email = Email
    ob1.save()
    return HttpResponse('''<Script> alert("added");window.location = "manage_officer#about"</Script>''')

@login_required(login_url='/')
def admin_home(request):
    return render(request, "index.html")
@login_required(login_url='/')

def add_department(request):
    return render(request, "admin/add department.html")
@login_required(login_url='/')

def addof2(request):
    name=request.POST['textfield']
    details=request.POST['textarea']

    ob1=Department_table()
    ob1.Name=name
    ob1.Detaile=details
    ob1.save()
    return HttpResponse('''<Script> alert("added");window.location = "manage_department#about"</Script>''')
@login_required(login_url='/')


def deptedit(request):
    name=request.POST['textfield']
    details=request.POST['textarea']

    ob1 = Department_table.objects.get(id=request.session['did'])
    ob1.Name=name
    ob1.Detaile=details
    ob1.save()
    return HttpResponse('''<Script> alert("added");window.location = "manage_department#about"</Script>''')

@login_required(login_url='/')

def editdept1(request,id):
    ob=Department_table.objects.get(id=id)
    request.session['did']=ob.id
    return render(request,'admin/department edit.html',{'val':ob})

@login_required(login_url='/')


def deletedep(request,id):
    ob=Department_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<Script> alert("deleted");window.location = "/manage_department#about"</Script>''')
@login_required(login_url='/')

def add_ert(request):
    return render(request, "admin/add ert.html")
@login_required(login_url='/')

def addof1(request):
    name=request.POST['textfield']
    E=request.POST['select']
    Place = request.POST['textfield2']
    Post=request.POST['textfield3']
    Pin = request.POST['textfield32']
    Email = request.POST['textfield33']
    Phone1 = request.POST['textfield34']
    Phone2 = request.POST['textfield35']
    Username = request.POST['textfield36']
    Password = request.POST['textfield37']

    ob=Login_table()
    ob.Username=Username
    ob.Password=Password
    ob.Type='ert'
    ob.save()

    ob1 = Ert_table()
    ob1.Name = name
    ob1.Place = Place
    ob1.Post = Post
    ob1.Pin = Pin
    ob1.Email = Email
    ob1.Phone1 = Phone1
    ob1.Phone2 = Phone2
    ob1.type = E
    ob1.LOGIN = ob
    ob1.save()
    return HttpResponse('''<Script> alert("added");window.location = "manage_ert#about"</Script>''')
@login_required(login_url='/')


def editert1(request):
    name=request.POST['textfield']
    Place = request.POST['textfield2']
    Post=request.POST['textfield3']
    Pin = request.POST['textfield32']
    Email = request.POST['textfield33']
    Phone1 = request.POST['textfield34']
    Phone2 = request.POST['textfield35']

    ob1 = Ert_table.objects.get(id=request.session['eid'])
    ob1.Name = name
    ob1.Place = Place
    ob1.Post = Post
    ob1.Pin = Pin
    ob1.Email = Email
    ob1.Phone1 = Phone1
    ob1.Phone2 = Phone2
    ob1.save()
    return HttpResponse('''<Script> alert("Edited");window.location = "manage_ert#about"</Script>''')
@login_required(login_url='/')


def deleteert(request,id):
    ob=Ert_table.objects.get(id=id)
    ob1=Login_table.objects.get(id=ob.LOGIN.id)
    ob1.delete()
    return HttpResponse('''<Script> alert("deleted");window.location = "/manage_ert#about"</Script>''')

@login_required(login_url='/')

def editert(request,id):
    ob=Ert_table.objects.get(id=id)
    ob1=Department_table.objects.all()
    request.session['eid']=ob.id
    return render(request,'admin/edit ert.html',{'val':ob,'val1':ob1})

@login_required(login_url='/')


def add_officer(request):
    ob=Department_table.objects.all()
    return render(request, "admin/add officer.html",{'val':ob})
@login_required(login_url='/')

def manage_department(request):
    ob = Department_table.objects.all()
    return render(request, "admin/MANAGE DEPARTMENT.html",{"val":ob})
@login_required(login_url='/')




def manage_ert(request):
    ob=Ert_table.objects.all()
    return render(request, "admin/manage ert.html",{'val':ob})
@login_required(login_url='/')


def manage_ertsrch(request):
    nm=request.POST['textfield']
    ob=Ert_table.objects.filter(Name__icontains=nm)
    return render(request, "admin/manage ert.html",{'val':ob})
@login_required(login_url='/')



def send_reply(request,id):
    ob=Complaint_table.objects.get(id=id)
    request.session['sid'] = ob.id

    return render(request, "admin/send reply.html")
@login_required(login_url='/')


def add_reply(request):
    reply=request.POST['textfield']
    ob=Complaint_table.objects.get(id=request.session['c_id'])
    ob.Status=reply
    ob.Date=datetime.now()
    ob.save()
    return HttpResponse('''<Script> alert("REPLIED");window.location = "/view_complaint_officer#about"</Script>''')
@login_required(login_url='/')

def view_alert(request):
    ob=Notification_table.objects.all()
    return render(request, "admin/view alert.html",{'val':ob})
@login_required(login_url='/')



@login_required(login_url='/')

def view_complaint(request):
    ob=Complaint_table.objects.all()
    return render(request, "admin/view complaint.html",{'val':ob})
@login_required(login_url='/')


def view_complaint_search(request):
    date=request.POST['textfield']
    ob=Complaint_table.objects.filter(Date=date)
    return render(request, "admin/view complaint.html",{'val':ob})
@login_required(login_url='/')

def view_feedback(request):
    ob=Feedback_table.objects.all()
    return render(request, "admin/view feedback.html",{'val':ob})
@login_required(login_url='/')

def view_feedbacksrch(request):
    nm = request.POST['textfield']
    ob = Feedback_table.objects.filter(Date=nm)
    return render(request, "admin/view feedback.html", {'val': ob})
@login_required(login_url='/')

def view_user(request):
    ob=User_table.objects.all()
    return render(request, "admin/view user.html",{'val':ob})
@login_required(login_url='/')

def view_usersrch(request):
    nm = request.POST['textfield']
    ob = User_table.objects.filter(Name__icontains=nm)
    return render(request, "admin/view user.html", {'val': ob})

@login_required(login_url='/')


def view_requestadmin(request):
    ertobj=Ert_table.objects.all()
    ob = Request_table.objects.filter(ERT__LOGIN__id=request.session['lid'])
    return render(request, "admin/view requestadmin.html",{'val':ob,'val1':ertobj})


def view_requestdrop(request):
    search=request.POST['select']
    ertobj=Ert_table.objects.all()
    ob = Request_table.objects.filter(ERT_id=search)
    return render(request, "admin/view requestadmin.html",{'val':ob,'val1':ertobj})


@login_required(login_url='/')



# %%%%%%%%%%%%%%%ert%%%%%%%%%%%%%%%%%%%
def ert(request):
    return render(request, "ertindex.html")

@login_required(login_url='/')

def update_avail_status(request,id):
    ob = Request_table.objects.get(id=id)
    request.session['erid'] = ob.id
    return render(request, "ert/update avail status.html")
@login_required(login_url='/')

def updateavlstatus(request):
    reply=request.POST['textfield']
    ob=Request_table.objects.get(id=request.session['erid'])
    ob.Status=reply
    ob.Date=datetime.now()
    ob.Time=datetime.now()
    ob.ERT=Ert_table.objects.get(LOGIN__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<Script> alert("REPLIED");window.location = "/view_request#about"</Script>''')
@login_required(login_url='/')

def update_req_status(request):
    return render(request, "ert/update req status.html")
@login_required(login_url='/')

def view_request(request):
    ob = Request_table.objects.filter(ERT__LOGIN__id=request.session['lid']).order_by('-id')
    return render(request, "ert/view request.html",{'val':ob})

@login_required(login_url='/')


def change_passwordert(request):
    return render(request, "ert/Change password.html")
@login_required(login_url='/')

def view_noti(request):
    ob = Notification_table.objects.all()
    return render(request, "ert/view noti.html",{'val':ob})

def changepassword_postert(request):
    corrent = request.POST['textfield']
    print(corrent)
    new = request.POST['textfield2']
    confirm = request.POST['textfield3']
    ob = Login_table.objects.filter(Password=corrent)
    if len(ob) == 0:
        return HttpResponse(
            '''<script>alert("invalid password. check corrent password");window.location='/change_passwordert#about'</script>''')
    else:
        if new == confirm:
            ob1 = Login_table.objects.get(id=request.session['lid'])
            ob1.Password = new
            ob1.save()
            return HttpResponse(
                '''<script>alert("password changed Successfully");window.location='/change_passwordert#about'</script>''')
        else:
            return HttpResponse(
                '''<script>alert("confirm password must be new password ");window.location='/change_passwordert#about'</script>''')

@login_required(login_url='/')


    # ////////////////////////////////////////////// Officer /////////////////////////////////

def change_password(request):
    return render(request, "officer/Change password.html")
@login_required(login_url='/')


def view_complaint_officer(request):
    ob=Complaint_table.objects.all()
    return render(request, "officer/view complaint.html",{'val':ob})

def changepassword_post(request):
    corrent=request.POST['textfield']
    print(corrent)
    new=request.POST['textfield2']
    confirm=request.POST['textfield3']
    ob=Login_table.objects.filter(Password = corrent)
    if len(ob) == 0:
        return HttpResponse(
            '''<script>alert("invalid password. check corrent password");window.location='/change_password#about'</script>''')
    else:
        if new == confirm :
            ob1=Login_table.objects.get(id=request.session['lid'])
            ob1.Password=new
            ob1.save()
            return HttpResponse(
                '''<script>alert("password changed Successfully");window.location='/change_password#about'</script>''')
        else:
            return HttpResponse(
                '''<script>alert("confirm password must be new password ");window.location='/change_password#about'</script>''')

@login_required(login_url='/')

def officer_home(request):
    return render(request, "indexofficer.html")
@login_required(login_url='/')

def sent_replys(request,id):
    request.session['c_id'] = id
    return render(request, "officer/sent reply.html")
@login_required(login_url='/')

def view_o_complaint(request):
    ob=Officer_table.objects.get(LOGIN__id=request.session['lid'])
    ob=Complaint_table.objects.filter(ID__id=ob.DEPARTMENT.id)
    return render(request, "officer/view complaint.html",{"val":ob})
@login_required(login_url='/')

def comp_serc(request):
    nm = request.POST['textfield']
    ob = Complaint_table.objects.filter(Date=nm)
    return render(request, "officer/view complaint.html", {'val': ob})

def view_emg_alert(request):
    ob = Emg_table.objects.all()
    return render(request, "officer/view emg alert.html",{"val":ob})
@login_required(login_url='/')

def view_emg_number(request):
    ob = Emg_table.objects.filter(Officer__LOGIN__id= request.session['lid'])
    return render(request, "officer/view emg number.html",{"val":ob})

@login_required(login_url='/')


def add_emg(request):
    return render(request,'officer/add emrg.html')

@login_required(login_url='/')


def add_emg_number(request):
    Number=request.POST['textfield']

    ob1=Emg_table()
    ob1.No=Number
    ob1.Date=datetime.now()
    ob1.Officer=Officer_table.objects.get(LOGIN__id=request.session['lid'])
    ob1.save()
    return HttpResponse('''<Script> alert("added");window.location = "view_emg_number#about"</Script>''')
@login_required(login_url='/')

def delete_emg_number(request,id):
    ob=Emg_table.objects.get(id=id)
    # ob1=Officer_table.objects.get(id=ob.LOGIN.id)
    ob.delete()
    return HttpResponse('''<Script> alert("deleted");window.location = "/view_emg_number#about"</Script>''')
@login_required(login_url='/')


def send_replys(request,id):
    ob=Complaint_table.objects.get(id=id)
    request.session['sid'] = ob.id

    return render(request, "officer/send reply.html")
@login_required(login_url='/')

# def view_noti(request):
#     ob = Notification_table.objects.all()
#     return render(request, "officer/view noti.html",{'val':ob})



# "=================chat with user=================="
def chatwithuser(request):
    ob = User_table.objects.all()
    return render(request,"ert/chat with user.html",{'val':ob})




def chatview(request):
    ob = User_table.objects.all()
    d=[]
    for i in ob:
        r={"name":i.Name,'photo':i.Photo.url,'email':i.Email,'loginid':i.LOGIN.id}
        d.append(r)
    return JsonResponse(d, safe=False)




def coun_insert_chat(request,msg,id):
    print("===",msg,id)
    ob=Chat_table()
    ob.From_id=Login_table.objects.get(id=request.session['lid'])
    ob.To_id=Login_table.objects.get(id=id)
    ob.Message=msg
    ob.Date=datetime.now().strftime("%Y-%m-%d")
    ob.save()

    return JsonResponse({"task":"ok"})
    # refresh messages chatlist



def coun_msg(request,id):

    ob1=Chat_table.objects.filter(From_id__id=id,To_id__id=request.session['lid'])
    ob2=Chat_table.objects.filter(From_id__id=request.session['lid'],To_id__id=id)
    combined_chat = ob1.union(ob2)
    combined_chat=combined_chat.order_by('id')
    res=[]
    for i in combined_chat:
        res.append({"from_id":i.From_id.id,"msg":i.Message,"date":i.Date,"chat_id":i.id})

    obu=User_table.objects.get(LOGIN__id=id)


    return JsonResponse({"data":res,"name":obu.Name,"photo":obu.Photo.url,"user_lid":obu.LOGIN.id})



























# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$web-service%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
def forgotpass(request):
    email = request.POST['email']
    uname=request.POST['uname']
    print(email)
    s = User_table.objects.filter(LOGIN__Username=uname,Email=email)
    print(s, "=============")
    if len(s)==0:
        return JsonResponse({'task': 'invalid email'})
    else:
        try:
            gmail = smtplib.SMTP('smtp.gmail.com', 587)
            gmail.ehlo()
            gmail.starttls()
            gmail.login('jdtarjul@gmail.com', 'kshy hboc sejw klwo')
            print("login=======")
            msg = MIMEText("Your password id : " + str(s[0].LOGIN.Password))
            print(msg)
            msg['Subject'] = 'PUBLIC COMPLAINT SORTING'
            msg['To'] = email
            msg['From'] = 'jdtarjul@gmail.com'
            print("ok====")
            try:
                gmail.send_message(msg)
            except Exception as e:
                return JsonResponse({"task": "invalid"})
            return JsonResponse({"task": "valid"})
        except Exception as e:
            print(e)
            return JsonResponse({"task": "invalid"})










def logincodess(request):
    try:
         print(request.POST)
         un = request.POST['uname']
         pw = request.POST['pswrd']
         ob = Login_table.objects.get(Username=un, Password=pw)
         print("un-",un,)
         if ob is None:
             ob1 = {"task": "invalid",'id':0,'img':0}
         else:
             print("-----------")
             obb=User_table.objects.get(LOGIN__id=ob.id)
             ob1 = {"task": "valid", "id": str(ob.id),'img':str(obb.Photo.url)}
         l = json.dumps(ob1)
         return HttpResponse(l)
    except Exception as e:
        print("-----------1234",e)
        ob1 = {"task": "invalid", 'id': 0}
        l = json.dumps(ob1)
        return HttpResponse(l)
def sndemgnoti(request):
    lidd = request.POST['lid']
    eid = request.POST['eid']
    lat = request.POST['lat']
    lon = request.POST['lon']
    print(eid,"-----------")
    notification = request.POST['notification']

    feed = Request_table()
    feed.Date = datetime.today()
    feed.Time = datetime.now()
    feed.Request = notification
    feed.Latitude = lat
    feed.Longitude = lon
    feed.Status = "pending"
    feed.ID= User_table.objects.get(LOGIN__id=lidd)
    feed.ERT= Ert_table.objects.get(id=eid)
    feed.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)



def sndcomplaint(request):
    lidd = request.POST['lid']
    # did = 4
    lati=request.POST['lati']
    longi=request.POST['longi']

    complaints = request.FILES['complaint']
    fs=FileSystemStorage()
    fn=fs.save(complaints.name,complaints)


    res = predictcnn(r"C:\Users\arjul\PycharmProjects\pcs1\media\\"+fn)
    print(res, "==========================")
    arr = ["KSEB", "MUNICIPALITY", "EMERGENCY UNIT", "PWD", "WATER AUTHORITY"]
    if res[0] == 0:
        p = arr[0]
    elif res[0] == 1:
        p = arr[1]
    elif res[0] == 2:
        p = arr[2]
    elif res[0] == 3:
        p = "invalid"
    elif res[0] == 4:
        p = arr[3]
    elif res[0] == 5:
        p = arr[4]
    else:
        p = "invalid"
    if p != "invalid":
        # q = "SELECT * FROM `department` where `name`=%s"
        # dep = selectone(q, p)
        dep=Department_table.objects.get(Name__icontains=p)
        print(dep, "===================================")
        # qry = "INSERT INTO `complaint`VALUES(NULL,%s,%s,CURDATE(),%s,'pending',%s,%s)"
        # val = (lid, dep['dp_id'], fn, LATTITUDE, LONGITUDE)
        # iud(qry, val)
        feed = Complaint_table()
        feed.Date = datetime.today()
        feed.Complaint = fn
        feed.Latitude = lati
        feed.Longitude = longi
        feed.Status = 'pending'
        feed.User = User_table.objects.get(LOGIN__id=lidd)
        feed.ID = Department_table.objects.get(id=dep.id)
        feed.save()
        # qry = "INSERT INTO `complaint` VALUES(NULL,%s,%s,CURDATE(),%s,'pending',%s,%s,%s)"
        # iud(qry, (lid,did,COMPLAINT,LATTITUDE,LONGITUDE,DESCRIPTION))
        # return jsonify({"task": "success"})
        data = {"task": "success"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)
    else:
        data = {"task": "invalid"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)






def sndfeedback(request):
    lidd = request.POST['lid']
    feedbacks = request.POST['feedback']
    feed = Feedback_table()
    feed.Date = datetime.today()
    feed.Feedback = feedbacks
    feed.User= User_table.objects.get(LOGIN__id=lidd)
    feed.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)



def userregister(request):
    n = request.POST['name']
    p = request.POST['place']
    po = request.POST['post']
    pi = request.POST['pin']
    e = request.POST['email']
    ph= request.POST['phone']
    un= request.POST['un']
    pw= request.POST['pw']
    pho = request.FILES['photo']
    fs=FileSystemStorage()
    fsave=fs.save(pho.name,pho)

    ob=Login_table()
    ob.Username=un
    ob.Password=pw
    ob.Type='user'
    ob.save()

    feed = User_table()
    feed.Name = n
    feed.Place = p
    feed.Post = po
    feed.Pin = pi
    feed.Email = e
    feed.Phone = ph
    feed.Photo = fsave
    feed.LOGIN= ob
    feed.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)








def viewfeedback(request):
    # idd=request.POST['lid']
    # print(idd,"bbbbbbbbbbbbbbbbbbbbb")
    ob = Feedback_table.objects.all()
    data = []
    for i in ob:
        row = {"feedback":i.Feedback,"date":str(i.Date),"user":i.User.Name}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)



def viewert(request):
    ob = Ert_table.objects.all()
    data = []
    for i in ob:
        row = {"Name":i.Name,"id":i.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)



def viewreqstatus(request):
    idd=request.POST['lid']
    # print(idd,"bbbbbbbbbbbbbbbbbbbbb")
    ob = Request_table.objects.filter(ID__LOGIN__id=idd)
    data = []
    for i in ob:
        row = {"status":i.Status,"date":str(i.Date),"time":str(i.Time),"request":i.Request, "ert":i.ERT.name}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)




def viewrescueteam(request):
    # idd=request.POST['lid']
    # print(idd,"bbbbbbbbbbbbbbbbbbbbb")
    ob = Ert_table.objects.all()
    data = []
    for i in ob:
        row = {"name":i.Name,"phone1":i.Phone1,"phone2":i.Phone2,"type":i.type,"email":i.Email,"id":i.id,'place':i.Place,"lid":i.LOGIN.id}
        data.append(row)
    r = json.dumps(data)
    print("############",data)
    return HttpResponse(r)





def addnoti(request):
    idd=request.POST['lid']
    ok=request.POST['ki']
    nu=request.POST['notif']

    ob1=Notification_table()
    ob1.Notification=nu
    ob1.Date=datetime.now()
    ob1.ID=User_table.objects.get(LOGIN__id=idd)
    ob1.EMG_no=Emg_table.objects.get(id=ok)
    ob1.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

def compststus(request):
    lid=request.POST['lid']
    ob = Complaint_table.objects.filter(User__LOGIN__id=lid)
    data = []
    for i in ob:
        row = {"Complaint": str(i.Complaint.url), "Date": str(i.Date), "Latitude": i.Latitude,"Longitude": i.Longitude,"Status": i.Status}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)


def feedbackstatus(request):

    ob = Feedback_table.objects.all()
    data = []
    for i in ob:
        row = {"Date": str(i.Date), "Feedback": i.Feedback,"uname":i.User.Name}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)



def notificationstatus(request):
    lid=request.POST['lid']
    eid=request.POST['eid']
    ob = Request_table.objects.filter(ID__LOGIN__id=lid,ERT__id=eid)
    data = []
    for i in ob:
        row = {"status": i.Status, "Notification": i.Request}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)



# ///////////////////////////////////android chat //////////////////////////////////////////////

def view_message2(request):
    print(request.POST)
    fromid=request.POST['fid']
    toid=request.POST['toid']
    mid=request.POST['lastmsgid']
    print(mid,"uuuuuuuuuuuu0")
    ob=Chat_table.objects.filter(Q(To_id__id=toid,From_id__id=fromid,id__gt=mid)|Q(To_id=fromid,From_id=toid,id__gt=mid)).order_by('id')
    print(ob,"YYYYYYYYYYYYYYYYYYYYYYYYYYYYYY")
    data=[]
    print("++++++++==============================")
    print("++++++++==============================")
    print("++++++++==============================")
    for i in ob:
        r={"id":i.id,"date":i.Date,"chat":i.Message,"fromid":i.From_id.id}
        data.append(r)
        print(r,"KKKKKKKKKKKKKKKKKKKKKKKKKKKK")
    # print(data,"JJJJJJJJJJJJJJJJJJJJJJJJJ")
    print(len(data),"=========================================")
    if len(data)>0:
        return JsonResponse({"status":"ok","res1":data})
    else:
        return JsonResponse({"status": "na"})



def in_message2(request):
    fromid = request.POST['fid']
    toid=request.POST['toid']
    chat = request.POST['msg']

    ob = Chat_table()
    ob.Message = chat
    # ob.time = datetime.now().strftime("%H:%M:%S")
    ob.Date = datetime.now()

    ob.From_id = Login_table.objects.get(id=fromid)
    ob.To_id = Login_table.objects.get(id=toid)
    ob.save()
    data = {"status": "send"}
    r = json.dumps(data)

    print(r)
    return HttpResponse(r)



def my_ajax_view(request):
    ob=Request_table.objects.filter(ERT__LOGIN__id=request.session['lid'],Status='pending')
    # Perform some action or check some condition
    # For demonstration, let's assume there's a condition that triggers the alert
    if len(ob)==0:
        condition_met = False  # Change this according to your logic
    else:
        condition_met = True
    print(condition_met)
    if condition_met:
        # Prepare the data to be sent in the AJAX response
        data = {
            'message': 'Your notification message here.'
        }
        # Return the data as JSON response
        return JsonResponse(data)
    else:
        # Handle the case where condition is not met
        return JsonResponse({'message': False})