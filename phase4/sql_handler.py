#!/usr/bin/python3
import subprocess as sp
import pymysql, pymysql.cursors, bcrypt

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

def get_hashed_password(plain_text_password):
    # Hash a password for the first time
    #   (Using bcrypt, the salt is saved into the hash itself)
    return bcrypt.hashpw(plain_text_password, bcrypt.gensalt())

def check_password(plain_text_password, hashed_password):
    # Check hashed password. Using bcrypt, the salt is saved into the hash itself
    return bcrypt.checkpw(plain_text_password, hashed_password)

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


def SubmitSolution():
    global cur
    global userid
    if userid == -1:
        print('Please login to submit your solution')
        return 

def promoteEmployee():
    global cur

def rewardDepartment():
    global cur

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
    2: LogIn,
    3: ViewProfile,
    4: rewardDepartment,
    5: projectStatistics,
    6: departmentStatistics,
    7: employeeStatistics,
    8: checkMessages,
}


username = input("Username: ")
password = input("Password: ")

username = "root"
password = "12345678"

userid = -1

while(1):
    # tmp = sp.call('clear',shell=True)

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
                print("3. Promote an employee")
                print("4. Reward a department")
                print("5. Project Statistics")
                print("6. Department Statistics")
                print("7. Employee Statistics")
                print("8. Check messages")
                print("9. Logout")
                c = int(input("Enter choice> "))
                tmp = sp.call('clear -x',shell=True)
                if c==9:
                    break
                else:
                    print("Test")
                    optionFunctionMapping[c]()
                    tmp = input("Enter any key to CONTINUE>")




    except Exception as e:
        tmp = sp.call('clear -x',shell=True)
        print(str(e))
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
    
   

