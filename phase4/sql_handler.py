#!/usr/bin/python3
import subprocess as sp
import pymysql, pymysql.cursors, bcrypt
import datetime

def get_hashed_password(plain_text_password):
    # Hash a password for the first time
    #   (Using bcrypt, the salt is saved into the hash itself)
    return bcrypt.hashpw(plain_text_password, bcrypt.gensalt())

def check_password(plain_text_password, hashed_password):
    # Check hashed password. Using bcrypt, the salt is saved into the hash itself
    return bcrypt.checkpw(plain_text_password, hashed_password)


def SignUp():
    global cur
    row = {}
    print("Enter your details: ")
    name = (input("Name (Fname Minit Lname): ")).split(' ')


    row["FirstName"] = name[0]
    if len(name)>2:
        row["MiddleName"] = name[1]
        row["LastName"] = name[2]
    elif len(name)==2:
        row["MiddleName"] = ""
        row["LastName"] = name[1]
    else:
        row["MiddleName"] = ""
        row["LastName"] = ""
    
    row['Institute'] = input("Enter Institute: ")
    dob = input("Birth Date (YYYY-MM-DD) (Eg: 2019-11-11): ")
    DOB = dob.split('-')
    try:
        row['DOB'] = datetime.datetime(int(DOB[0]),int(DOB[1]),int(DOB[2]))
    except Exception as e:
        print("Invalid Date ",str(e))
        return
    row['PasswordHash'] = get_hashed_password(input("Enter Password: "))
    row['PrimaryMailID'] = input("Enter mail id: ")

    query = "INSERT INTO User (FirstName, MiddleName, LastName, Rating, JoinDate, Institute, DOB, PasswordHash, PrimaryMailID, isAdmin) VALUES('{}', '{}', '{}', '{}', NOW(), '{}', '{}', '{}', '{}', 0)".format(row["FirstName"], row["MiddleName"], row["LastName"], 0, row["Institute"], row["DOB"], row["PasswordHash"], row["PrimaryMailID"])

    cur.execute(query)
    con.commit()
    return


def LogIn():
    global cur
    global userid
    row = {}
    row['PrimaryMailID'] = input('EMail ID: ')
    row['Password'] = input('Password: ')
    query = "SELECT * FROM User WHERE PrimaryMailID = '{}'".format(row['PrimaryMailID'])
    # query = "SELECT * FROM EMPLOYEE"
    print(query)
    cur.execute(query)
    rows = cur.fetchall()
    if len(rows) != 1:
        print("Error: Email doesn't exists")
    print(rows)
    if check_password(row['Password'],rows[0]['PasswordHash']):
        userid = rows[0]['UserID']

def ViewUser():
    global cur
    targetUser = input('Enter UserID or Mail ID of user you want to view: ')
    if targetUser.isdigit():
        query = "SELECT FirstName, MiddleName, LastName, Rating, PrimaryMailID, Institute FROM User WHERE User.UserID = {}".format(targetUser)
        cur.execute(query)
        rows = cur.fetchall()
        if not len(rows):
            print("User doesn't exists")
            return
        print(rows[0])
        print("Attemped Questions")
        query = "SELECT * FROM User, UserSolvesQuestion, Question WHERE User.UserID = UserSolvesQuestion.UserID and UserSolvesQuestion.QuestionID = Question.QuestionID and User.UserID = {}".format(targetUser)
        cur.execute(query)
        rows = cur.fetchall()
        for x in rows:
            print(x)
        else:
            print("------------------------")
        print("Participated in contests")
        query = "SELECT * FROM User, UserParticipatesInContest, contest WHERE User.UserID = UserParticipatesInContest.UserID and UserParticipatesInContest.ContestID = contest.ContestID and User.UserID = {}".format(targetUser)
        cur.execute(query)
        rows = cur.fetchall()
        for x in rows:
            print(x)
        else:
            print("------------------------")
        print("Created Contests")
        query = "SELECT * FROM User, contest WHERE User.UserID = contest.Creator and User.UserID = {}".format(targetUser)
        cur.execute(query)
        rows = cur.fetchall()
        for x in rows:
            print(x)
        else:
            print("------------------------")
        print("Created Questions")
        query = "SELECT * FROM User, Question WHERE User.UserID = Question.Creator and User.UserID = {}".format(targetUser)
        cur.execute(query)
        rows = cur.fetchall()
        for x in rows:
            print(x)
        else:
            print("------------------------")

    else:
        query = "SELECT FirstName, MiddleName, LastName, Rating, PrimaryMailID, Institute FROM User WHERE User.PrimaryMailID = {}".format(targetUser)
        cur.execute(query)
        rows = cur.fetchall()
        if not len(rows):
            print("User doesn't exists")
            return
        print(rows[0])
        print("Attemped Questions")
        query = "SELECT * FROM User, UserSolvesQuestion, Question WHERE User.UserID = UserSolvesQuestion.UserID and UserSolvesQuestion.QuestionID = Question.QuestionID and User.PrimaryMailID = '{}'".format(targetUser)
        cur.execute(query)
        rows = cur.fetchall()
        for x in rows:
            print(x)
        else:
            print("------------------------")
        print("Participated in contests")
        query = "SELECT * FROM User, UserParticipatesInContest, contest WHERE User.UserID = UserParticipatesInContest.UserID and UserParticipatesInContest.ContestID = contest.ContestID and User.PrimaryMailID = '{}'".format(targetUser)
        cur.execute(query)
        rows = cur.fetchall()
        for x in rows:
            print(x)
        else:
            print("------------------------")
        print("Created Contests")
        query = "SELECT * FROM User, contest WHERE User.UserID = contest.Creator and User.PrimaryMailID = '{}'".format(targetUser)
        cur.execute(query)
        rows = cur.fetchall()
        for x in rows:
            print(x)
        else:
            print("------------------------")
        print("Created Questions")
        query = "SELECT * FROM User, Question WHERE User.UserID = Question.Creator and User.PrimaryMailID = '{}'".format(targetUser)
        cur.execute(query)
        rows = cur.fetchall()
        for x in rows:
            print(x)
        else:
            print("------------------------")
        


def SubmitSolution():
    global cur
    global userid
    if userid == -1:
        print('Please login to submit your solution')
        return 

def LogOut():
    global userid
    userid = -1

def Exit():
    exit()

optionFunctionMapping = {
    1: SignUp,
    2: LogIn,
    3: ViewUser,
    4: SubmitSolution,
    5: LogOut,
    6: Exit
}

print("Enter DB creds")
username = input("Username: ")
password = input("Password: ")

userid = -1

tmp = sp.call('clear -x',shell=True)

try:
    con = pymysql.connect(host='localhost',
            user=username,
            password=password,
            db='OJ',
            cursorclass=pymysql.cursors.DictCursor)
    with con:
        cur = con.cursor()
        while(1):
            tmp = sp.call('clear -x',shell=True)
            print("1. Sign Up user")
            print("2. Log In user")
            print("3. View User")
            print("5. Logout")
            print("6. Exit")
            c = int(input("Enter choice> "))
            tmp = sp.call('clear -x',shell=True)
            optionFunctionMapping[c]()
            tmp = input("Enter any key to CONTINUE>")




except Exception as e:
    tmp = sp.call('clear -x',shell=True)
    print(str(e))
    print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
    tmp = input("Enter any key to CONTINUE>")
    
   

