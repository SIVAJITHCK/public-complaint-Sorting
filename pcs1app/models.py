from django.db import models

# Create your models here.

class Login_table(models.Model):
    Username = models.CharField(max_length=20)
    Password = models.CharField(max_length=20)
    Type = models.CharField(max_length=20)


class Ert_table(models.Model):
    Name =  models.CharField(max_length=20)
    Place = models.CharField(max_length=20)
    Post = models.CharField(max_length=20)
    Pin = models.IntegerField()
    Email = models.CharField(max_length=20)
    Phone1 = models.BigIntegerField()
    Phone2 = models.BigIntegerField()
    type = models.CharField(max_length=100)
    LOGIN = models.ForeignKey(Login_table, on_delete=models.CASCADE)

class Department_table(models.Model):
    Name = models.CharField(max_length=20)
    Detaile = models.CharField(max_length=20)

class Officer_table(models.Model):
    Name = models.CharField(max_length=20)
    Place = models.CharField(max_length=20)
    Post = models.CharField(max_length=20)
    Pin = models.IntegerField()
    Phone = models.BigIntegerField()
    Email = models.CharField(max_length=20)
    LOGIN = models.ForeignKey(Login_table, on_delete=models.CASCADE)
    DEPARTMENT = models.ForeignKey(Department_table, on_delete=models.CASCADE)


class Location_table(models.Model):
    LOGIN = models.ForeignKey(Login_table, on_delete=models.CASCADE)
    Latitude = models.CharField(max_length=100)
    Longitude = models.CharField(max_length=100)

class User_table(models.Model):
    Name = models.CharField(max_length=20)
    Place = models.CharField(max_length=20)
    Post = models.CharField(max_length=20)
    Phone = models.BigIntegerField()
    Pin = models.IntegerField()
    Photo = models.FileField()
    Email = models.CharField(max_length=20)
    LOGIN = models.ForeignKey(Login_table, on_delete=models.CASCADE)

class Complaint_table(models.Model):
     User = models.ForeignKey(User_table, on_delete=models.CASCADE)
     Complaint = models.FileField()
     ID = models.ForeignKey(Department_table, on_delete=models.CASCADE)
     Date = models.DateField()
     Latitude = models.CharField(max_length=100)
     Longitude = models.CharField(max_length=100)
     Status = models.CharField(max_length=100)

class Action_table(models.Model):
    COMPLAINT = models.ForeignKey(Complaint_table, on_delete=models.CASCADE)
    Date = models.DateField()
    Status = models.CharField(max_length=100)

class Request_table(models.Model):
    ID = models.ForeignKey(User_table, on_delete=models.CASCADE)
    Date = models.DateField()
    Time = models.TimeField()
    Status = models.CharField(max_length=100)
    Latitude = models.CharField(max_length=100)
    Longitude = models.CharField(max_length=100)
    ERT = models.ForeignKey(Ert_table, on_delete=models.CASCADE)
    Request = models.CharField(max_length=20)


class Emg_table(models.Model):
    Officer = models.ForeignKey(Officer_table, on_delete=models.CASCADE)
    No = models.BigIntegerField()
    Date = models.DateField()


class Notification_table(models.Model):
    ID = models.ForeignKey(User_table, on_delete=models.CASCADE)
    Notification = models.CharField(max_length=100)
    Date = models.DateField()
    EMG_no = models.ForeignKey(Ert_table, on_delete=models.CASCADE)



class Chat_table(models.Model):
    From_id = models.ForeignKey(Login_table, on_delete=models.CASCADE,related_name="ll")
    To_id = models.ForeignKey(Login_table, on_delete=models.CASCADE,related_name="aa")
    Message = models.CharField(max_length=30)
    Date = models.DateField()

class Feedback_table(models.Model):
    User = models.ForeignKey(User_table, on_delete=models.CASCADE)
    Feedback = models.CharField(max_length=30)
    Date = models.DateField()








