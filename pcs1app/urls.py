from django.contrib import admin
from django.urls import path

from pcs1app import views

urlpatterns = [

    path('', views.login, name="login"),
    path('login_code', views.login_code, name="login_code"),
    path('logout', views.logout, name="logout"),

    # ///////ADMIN//////
    path('manage_officer', views.manage_officer, name="manage_officer"),
    path('admin_home',views.admin_home, name="admin_home"),
    path('add_department', views.add_department, name="add_department"),
    path('add_ert', views.add_ert, name="add_ert"),
    path('add_officer', views.add_officer, name="add_officer"),
    path('manage_department', views.manage_department, name="manage_department"),
    path('manage_ert', views.manage_ert, name="manage_ert"),
    path('send_reply/<int:id>', views.send_reply, name="send_reply"),
    path('view_alert', views.view_alert, name="view_alert"),
    path('view_complaint', views.view_complaint, name="view_complaint"),
    path('view_feedback', views.view_feedback, name="view_feedback"),
    path('view_user', views.view_user, name="view_user"),
    path('deleteofficer/<int:id>', views.deleteofficer, name="deleteofficer"),
    path('deleteert/<int:id>', views.deleteert, name="deleteert"),
    path('deletedep/<int:id>', views.deletedep, name="deletedep"),
    path('manage_ertsrch', views.manage_ertsrch, name="manage_ertsrch"),
    path('view_feedbacksrch', views.view_feedbacksrch, name="view_feedbacksrch"),
    path('manage_officersrch', views.manage_officersrch, name="manage_officersrch"),
    path('view_usersrch', views.view_usersrch, name="view_usersrch"),
    path('addof', views.addof, name="addof"),
    path('addof1', views.addof1, name="addof1"),
    path('addof2', views.addof2, name="addof2"),
    path('editofficer/<int:id>', views.editofficer, name="editofficer"),
    path('editaddof', views.editaddof, name="editaddof"),
    path('editert/<int:id>', views.editert, name="editert"),
    path('editert1', views.editert1, name="editert1"),
    path('editdept1/<int:id>', views.editdept1, name="editdept1"),
    path('deptedit', views.deptedit, name="deptedit"),
    path('add_reply', views.add_reply, name="add_reply"),
    path('view_complaint_search', views.view_complaint_search, name="view_complaint_search"),
    path('view_requestadmin', views.view_requestadmin, name="view_requestadmin"),
    path('view_requestdrop', views.view_requestdrop, name="view_requestdrop"),

    # ///////ert//////
    path('ert',views.ert, name="ert"),
    path('update_avail_status/<int:id>', views.update_avail_status, name="update_avail_status"),
    path('update_req_status', views.update_req_status, name="update_req_status"),
    path('view_request', views.view_request, name="view_request"),
    path('updateavlstatus', views.updateavlstatus, name="updateavlstatus"),
    path('change_passwordert', views.change_passwordert, name="change_passwordert"),
    path('changepassword_postert', views.changepassword_postert, name="changepassword_postert"),

# ///////officer//////

    path('change_password',views.change_password, name="change_password"),
    path('add_emg_number',views.add_emg_number, name="add_emg_number"),
    path('delete_emg_number/<int:id>',views.delete_emg_number, name="delete_emg_number"),
    path('add_emg',views.add_emg, name="add_emg"),
    path('comp_serc',views.comp_serc, name="comp_serc"),
    path('officer_home',views.officer_home, name="officer_home"),
    path('sent_replys/<int:id>',views.sent_replys, name="sent_replys"),
    path('view_o_complaint',views.view_o_complaint, name="view_o_complaint"),
    path('view_emg_alert',views.view_emg_alert, name="view_emg_alert"),
    path('view_emg_number',views.view_emg_number, name="view_emg_number"),
    path('view_noti',views.view_noti, name="view_noti"),
    path('view_noti', views.view_noti, name="view_noti"),
    path('changepassword_post', views.changepassword_post, name="changepassword_post"),
    path('chatwithuser', views.chatwithuser, name='chatwithuser'),
    path('chatview', views.chatview, name='chatview'),
    path('view_complaint_officer', views.view_complaint_officer, name='view_complaint_officer'),
    path('coun_msg/<int:id>', views.coun_msg, name='coun_msg'),
    path('coun_insert_chat/<str:msg>/<int:id>', views.coun_insert_chat, name='coun_insert_chat'),


    # $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ web-service$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    path('logincodess', views.logincodess, name='logincodess'),
    path('sndfeedback', views.sndfeedback, name='sndfeedback'),
    path('userregister', views.userregister, name='userregister'),
    path('viewfeedback', views.viewfeedback, name='viewfeedback'),
    path('sndcomplaint', views.sndcomplaint, name='sndcomplaint'),
    path('viewreqstatus', views.viewreqstatus, name='viewreqstatus'),
    path('viewert', views.viewert, name='viewert'),
    path('viewrescueteam', views.viewrescueteam, name='viewrescueteam'),
    path('addnoti', views.addnoti, name='addnoti'),
    path('sndemgnoti', views.sndemgnoti, name='sndemgnoti'),
    path('compststus', views.compststus, name='compststus'),
    path('feedbackstatus', views.feedbackstatus, name='feedbackstatus'),
    path('notificationstatus', views.notificationstatus, name='notificationstatus'),
    path('view_message2', views.view_message2, name='view_message2'),
    path('in_message2', views.in_message2, name='in_message2'),
    path('forgotpass', views.forgotpass, name='forgotpass'),


    path('my_ajax_view', views.my_ajax_view, name='my_ajax_view'),
]
