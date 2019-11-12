#!/usr/bin/python3
import subprocess as sp
import pymysql, pymysql.cursors, bcrypt, datetime, sys, random

cid=-1

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
    
    return


def LogIn():
    global cur
    global userid
    global user
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
    if check_password(row['Password'],rows[0]['PasswordHash']):
        userid = rows[0]['UserID']
    else:
        print("Wrong password")
    print(rows[0])
    user = rows[0]
        

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
    
def ViewQuestions():
    query = "SELECT Question.QuestionID, Question.Title, User.UserID, User.FirstName FROM  User, Question WHERE Question.Creator = User.UserID ORDER BY Score DESC"
    cur.execute(query)
    rows = cur.fetchall()
    for x in rows:
        print(x)
    else:
        print("------------------------")

class color:
   PURPLE = '\033[95m'
   CYAN = '\033[96m'
   DARKCYAN = '\033[36m'
   BLUE = '\033[94m'
   GREEN = '\033[92m'
   YELLOW = '\033[93m'
   RED = '\033[91m'
   BOLD = '\033[1m'
   UNDERLINE = '\033[4m'
   END = '\033[0m'

def AddQuestion():
    global cur
    global cid
    global userid
    if userid ==-1 : 
        print("please login or signup\n")
        return
    row = {}
    # for getting the questionid
    cur.execute("SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA=\"OJ\" and TABLE_NAME=\"Question\"")
    data =cur.fetchall()
    data=list(data[0].values())
    qid=data[0]

    print(color.BLUE+"Enter new Question details ----->\n"+color.END)
    row["title"] = input(color.CYAN+"Title: "+color.END)

    print(color.CYAN+"text of question: "+color.END)
    text = sys.stdin.read()
    row['text'] = "questions/"+str(qid)+"_text.txt"
    fo = open(row['text'],"w+")
    fo.write(text)
    fo.close()

    # row["timelimit"] = input("timelimit: ")
    # if not row["timelimit"].isdigit():
    #     print("enter timelimit as a number")
    #     return
    row["score"] = input(color.CYAN+"score: "+color.END)
    if not row["score"].isdigit():
        print("enter score as a number")
        return

    if cid ==-1: query = "INSERT INTO Question(Title, Text, Score,Creator) VALUES('%s', '%s', '%s','%s')" %(row["title"], row["text"], row["score"],userid)
    else: query = "INSERT INTO Question(Title, Text, Score,Creator,ContestID) VALUES('%s', '%s', '%s','%s','%d')" %(row["title"], row["text"], row["score"],userid,cid)

    try :
        cur.execute(query)
        
    except Exception as e:
        print(str(e))
    print(color.BLUE+color.BOLD+"TESTCASES\n"+color.END)


    try: sno = int(input(color.CYAN+"no of subtask "+color.END))
    except: 
        print("please enter number for subtask id")
        return

    for i in range(sno):
        print(color.CYAN+"ENTER NO. OF TESTCASES FOR SUBTASK "+str(i+1)+": "+color.END)
        try:
            qno = int(input())
        except: 
            print("please enter a number")
            return
        
        for j in range(qno):
            print("INPUT: ")
            text = sys.stdin.read()
            inp = "testcase/"+str(qid)+"_"+str(i+1)+"_"+str(j+1)+"_in.txt"
            fo = open(inp,"w+")
            fo.write(text)
            fo.close()

            print("output: ")
            text = sys.stdin.read()
            out = "testcase/"+str(qid)+"_"+str(i+1)+"_"+str(j+1)+"_out.txt"
            fo = open(out,"w+")
            fo.write(text)
            fo.close()
            score=input("score: ")
            if not score.isdigit():
                print("please enter number\n")
                return
            query= "INSERT INTO Testcases(TestID,Input,ExpectedOutput,SubtaskID,Score,QuestionID) VALUES('%s', '%s', '%s','%s', '%s', '%s')" % (j+1,inp,out,i+1,score,qid)
            cur.execute(query)
            
        print("Testcasese added succesfully\n\n")
    print('Add languages seperated by commas ')
    languages = input("").upper().split(',')
    for x in languages:
        x = x.strip()
        query = "INSERT INTO Languages values ('{}',{})".format(x,qid)
        cur.execute(query)
    print('Add tags seperated by commas ')
    tags = input("").upper().split(',')
    for x in tags:
        x = x.strip()
        query = "INSERT INTO Tags values ('{}',{})".format(x,qid)
        cur.execute(query)

    print("Question added succesfully\n\n")

    return

def AddContest():

    global cur
    global cid
    global userid
    if userid ==-1 : 
        print("please login or signup\n")
        return
    cur.execute("SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA=\"OJ\" and TABLE_NAME=\"contest\"")
    data =cur.fetchall()
    data=list(data[0].values())
    cid=data[0]

    StartTime = input("Start Time (YYYY-MM-DD HH:MM:SS) (Eg: 2019-11-11 23:12:12): ")
    try:
        dt = StartTime.split(' ')
        date = dt[0].split('-')
        time = dt[1].split(":")

        StartTime = datetime.datetime(int(date[0]),int(date[1]),int(date[2]),int(time[0]),int(time[1]),int(time[2]))
    except Exception as e:
        print("Invalid Date ",str(e))
        return

    EndTime = input("End Time (YYYY-MM-DD HH:MM:SS) (Eg: 2019-11-11 23:12:12): ")
    try:
        dt = EndTime.split(' ')
        date = dt[0].split('-')
        time = dt[1].split(":")

        EndTime = datetime.datetime(int(date[0]),int(date[1]),int(date[2]),int(time[0]),int(time[1]),int(time[2]))
    except Exception as e:
        print("Invalid Date ",str(e))
        return
    MaxScore = input("Maximum Score allowed for participating in contest: ")
    MinScore = input("Minimum Score allowed for participating in contest: ")
    try:
        MaxScore = int(MaxScore)
        MinScore = int(MinScore)
    except Exception as e:
        print("Invalid score ",str(e))
        return

    name=input(color.CYAN+"enter contest name :\n"+color.END)
    # date=input("enter dta :")
    #cerationdata,min,max,start,end is left
    query="INSERT INTO contest(contestname, CreationDate, MinScoreAllowed, MaxScoreAllowed, StartTime, EndTime, Creator) VALUES('{}', NOW(), {},{},'{}','{}' ,'{}')".format(name,MinScore,MaxScore,StartTime,EndTime,userid)
    cur.execute(query)
    
    try:
        qno=int(input(color.CYAN+"Enter no .of questions: \n"+color.END))
    except:
        print("please enter no.")
        return
    for i in range(qno):
        AddQuestion()
    print(color.GREEN+"Contest Added Succesfully\n\n"+color.END)

    

def playques(qid):
    global cur
    global userid

    cur.execute("SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA=\"OJ\" and TABLE_NAME=\"Submission\"")
    data =cur.fetchall()
    data=list(data[0].values())
    sid=data[0]

    print("enter your code: ")
    text = sys.stdin.read()
    out = "submissions/"+str(sid)+"_code.txt"
    fo = open(out,"w+")
    fo.write(text)
    fo.close()
    query = "Select LanguageName from Question, Languages where Question.QuestionID = Languages.QuestionID and Languages.QuestionID = {}".format(qid)
    cur.execute(query)
    rows = cur.fetchall()
    languages = [ x['LanguageName'] for x in rows]
    print("Allowed Languages :")
    for i in languages:
        print(i)
    LanguageName = input('Enter Language: ')
    
    if LanguageName not in languages:
        print("Can't submit solution. Please see a valid language")
        return
    # other attributes are left
    
    query="INSERT INTO Submission(code,SubmissionTime,LanguageName) VALUES('%s',NOW(),'%s')" %(out,LanguageName)
    cur.execute(query)
    
    try:
        query="INSERT INTO UserSolvesQuestion(UserID, QuestionID, SubmissionID) VALUES('%s', '%s', '%s')" %(userid,qid,sid)     
        cur.execute(query)
    except:
        pass
    cur.execute("SELECT Score,SubtaskID,TestID FROM Testcases WHERE QuestionID="+str(qid)+" ORDER BY SubtaskID" )
    data=cur.fetchall()
    score=0
    subtasks = [ x['SubtaskID'] for x in data]
    print(subtasks)
    import collections
    subtasks = list(collections.Counter(subtasks).keys())
    print(subtasks)
    testcase_groups = [ [] for x in subtasks]
    for x in data:
        pos = subtasks.index(x['SubtaskID'])
        testcase_groups[pos].append(x)
    print('test')
    print(testcase_groups)
    #lst have all the score for 1 every subtask
    for subtask in testcase_groups:
        count = 0
        for test in subtask:
            if(random.randint(0,20)>2):
                count += 1
                cur.execute("INSERT INTO result values ({},{},{},NOW())".format(test['TestID'],sid,1))
            else:
                cur.execute("INSERT INTO result values ({},{},{},NOW())".format(test['TestID'],sid,0))
        if count == len(subtask) and len(subtask)>0:
            score+=subtask[0]['Score']
    
    # increment user rating with score
    cur.execute("UPDATE User SET Rating=Rating+"+str(score)+" WHERE UserID="+str(userid))
    print(color.GREEN+"QUESTION PLAYED succesfully"+color.END)

def PlayQuestion():
    global cur
    global userid
    global cid
    if userid ==-1 : 
        print("please login or signup\n")
        return   

    try:qid=int(input("enter question id:"))
    except:print("please enter no.")    
    cur.execute("SELECT * FROM Question WHERE QuestionID="+str(qid))
    data=cur.fetchall()
    if(len(data)==0):
        print(color.RED+"QID DONT EXIST\n"+color.END)
        return    
    playques(qid)

def PlayContest():
    global cur
    global userid
    if userid ==-1 : 
        print("please login or signup\n")
        return   

    try:cid=int(input("enter contest id:"))
    except:print("please enter no.")    
    cur.execute("SELECT * from User where UserID = {}".format(userid))
    rows = cur.fetchall()
    if len(rows) == 0:
        print('Can\'t find valid rating. Error detected. Please make another ID')
        return
    rating = rows[0]['Rating']
    
    cur.execute("SELECT * FROM contest WHERE ContestID="+str(cid))
    data=cur.fetchall()
    if(len(data)==0):
        print(color.RED+"CID DONT EXIST\n"+color.END)
        return
    if rating< data[0]['MinScoreAllowed'] or rating > data[0]['MaxScoreAllowed']:
        print('You are not eligible for participating in this contest.')
        return
    cur.execute("SELECT QuestionID FROM Question WHERE ContestID="+str(cid))
    data=cur.fetchall()
    # print(data)
    for i in data:
        print(color.CYAN+"FOR QUESTIONID: "+str(i)+"\n"+color.END)
        playques(i["QuestionID"])
    try:
        cur.execute("INSERT INTO UserParticipatesInContest(UserID,ContestID) VALUES('%s','%s')" %(userid,cid))
    except:
        print("Already participating")
    print(color.BOLD+color.GREEN+"CONTEST PLAYED SUCCSESSFULLY"+color.END)

def showResultsByQuestions():
    qid = int(input("Enter Question ID"))
    query = "SELECT * from Submission, Question, UserSolvesQuestion, result  WHERE Question.QuestionID = UserSolvesQuestion.QuestionID and Submission.SubmissionID = UserSolvesQuestion.SubmissionID and result.SubmissionID = Submission.SubmissionID and Question.QuestionID = {}".format(qid)
    cur.execute(query)
    rows = cur.fetchall()
    for x in rows:
        print(x)

def showResultsByUser():
    uid = int(input("Enter User ID"))
    query = "SELECT * from Submission, Question, UserSolvesQuestion, result  WHERE User.UserID = UserSolvesQuestion.UserID and Submission.SubmissionID = UserSolvesQuestion.SubmissionID and result.SubmissionID = Submission.SubmissionID and Question.UserID = {}".format(uid)
    cur.execute(query)
    rows = cur.fetchall()
    for x in rows:
        print(x)


def LogOut():
    global userid
    userid = -1

def Exit():
    exit()

optionFunctionMapping = {
    1: SignUp,
    2: LogIn,
    3: ViewUser,
    4: ViewQuestions,
    5: AddQuestion,
    6: AddContest,
    7: PlayQuestion,
    8: PlayContest,
    9: showResultsByQuestions,
    10: showResultsByUser,
    11: LogOut,
    12: Exit
}
import json
menu = """
    1: SignUp,
    2: LogIn,
    3: ViewUser,
    4: ViewQuestions,
    5: AddQuestion,
    6: AddContest,
    7: PlayQuestion,
    8: PlayContest,
    9: showResultsByQuestions,
    10: showResultsByUser,
    11: LogOut,
    12: Exit
"""
print("Enter DB creds")
username = input("Username: ")
password = input("Password: ")

userid = -1
user = dict()
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
            try:
                tmp = sp.call('clear -x',shell=True)
                if userid == -1:
                    print("Guest User")
                else:
                    print("User {} logged in. UserID {}".format(user['PrimaryMailID'],userid))
                print(menu)
                c = int(input("Enter choice> "))
                tmp = sp.call('clear -x',shell=True)
                optionFunctionMapping[c]()
                con.commit()
                tmp = input("Enter any key to CONTINUE>")
            except Exception as e:
                tmp = sp.call('clear -x',shell=True)
                print(str(e))
                tmp = input("Enter any key to CONTINUE>")
except Exception as e:
    tmp = sp.call('clear -x',shell=True)
    print(str(e))
    print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
    tmp = input("Enter any key to CONTINUE>")