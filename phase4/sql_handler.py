mport subprocess as sp
import pymysql
import pymysql.cursors
import inquirer
import sys

cid=-1
userid=10
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

def SignUp():
    global cur
    row = {}
    print("Enter new employee's details: ")
    name = (input("Name (Fname Minit Lname): ")).split(' ')
    row["Fname"] = name[0]
    row["Minit"] = name[1]
    row["Lname"] = name[2]

    row["Ssn"] = input("SSN: ")
    row["Bdate"] = input("Birth Date (YYYY-MM-DD): ")
    row["Address"] = input("Address: ")
    row["Sex"] = input("Sex: ")
    row["Salary"] = float(input("Salary: "))
    row["Dno"] = int(input("Dno: "))

    query = "INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Dno) VALUES('%s', '%c', '%s', '%s', '%s', '%s', '%c', %f, %d)" %(row["Fname"], row["Minit"], row["Lname"], row["Ssn"], row["Bdate"], row["Address"], row["Sex"], row["Salary"], row["Dno"])

    cur.execute(query)
    con.commit()
    return

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

    print("Enter new Question details")
    row["title"] = input("Title: ")

    print("text of question: ")
    text = sys.stdin.read()
    row['text'] = "questions/"+str(qid)+"_text.txt"
    fo = open(row['text'],"w+")
    fo.write(text)
    fo.close()
    
    # row["timelimit"] = input("timelimit: ")
    # if not row["timelimit"].isdigit():
    # 	print("enter timelimit as a number")
    # 	return
    row["score"] = input("score: ")
    if not row["score"].isdigit():
    	print("enter score as a number")
    	return

    if cid ==-1: query = "INSERT INTO Question(Title, Text, Score,Creator) VALUES('%s', '%s', '%s','%s')" %(row["title"], row["text"], row["score"],userid)
    else: query = "INSERT INTO Question(Title, Text, Score,Creator,ContestID) VALUES('%s', '%s', '%s','%s','%d')" %(row["title"], row["text"], row["score"],userid,cid)

    try :
        cur.execute(query)
        con.commit()
    except pymysql.InternalError as error:
    	print("lol")
    	code , message = error.args
    	print(code)
    print("Question added succesfully\n\n")
    print(color.RED+color.BOLD+"TESTCASES\n\n"+color.END)


    try: sno = int(input(color.CYAN+"no of subtask "+color.END))
    except: 
    	print("please enter number for subtask id")
    	return

    for i in range(sno):
    	print("ENTER NO. OF TESTCASES FOR SUBTASK "+str(i+1)+":\n")
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
    		con.commit()
    	print("Testcasese add succesfully\n\n")

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

    name=input("enter contest name :")
    # date=input("enter data :")
    #cerationdata,min,max,start,end is left
    query="INSERT INTO contest(contestname, Creator) VALUES('%s', '%s')" %(name,userid)
    cur.execute(query)
    con.commit()
    print("contest added succesfully\n\n")
    try:
        qno=int(input("enter no .of questions:"))
    except:
        print("please enter no.")
        for i in range(qno):
            AddQuestion()

def playques(qid):
    global cur
    global userid


def PlayQuestion():
    global cur
    global userid
    global cid
    if userid ==-1 : 
        print("please login or signup\n")
        return
    try:qid=int(input("enter question id:"))
    except:print("please enter no.")
    
    playques(qid)      



def projectStatistics():
    global cur

def departmentStatistics():
    global cur

def employeeStatistics():
    global cur

def checkMessages():
    global cur


optionFunctionMapping = {
    1: SignUp,
    2: AddQuestion,
    3: AddContest,
    4: PlayQuestion,
    5: projectStatistics,
    6: departmentStatistics,
    7: employeeStatistics,
    8: checkMessages,
}

try:
	con = pymysql.connect(host='localhost',user="aakash",password="12345678",db='OJ',cursorclass=pymysql.cursors.DictCursor)
        
except:
	print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
	# tmp = input("Enter any key to CONTINUE>")
	exit()



cur = con.cursor()
while(1):
    # tmp = sp.call('clear',shell=True)
    print("1. Hire a new employee")
    print("2. AddQuestion")
    print("3. Promote an employee")
    print("4. PLAY QUESTION")
    print("5. Project Statistics")
    print("6. Department Statistics")
    print("7. Employee Statistics")
    print("8. Check messages")
    print("9. Logout")
    c = int(input("Enter choice> "))
    optionFunctionMapping[c]()


	                
    # if c==9:
    #     break
    # else:
    #     send(optionFunctionMapping[c]())






