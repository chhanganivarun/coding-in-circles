import subprocess as sp
import pymysql
import pymysql.cursors

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

def fireAnEmployee():
    global cur

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
    1: hireAnEmployee,
    2: fireAnEmployee,
    3: promoteEmployee,
    4: rewardDepartment,
    5: projectStatistics,
    6: departmentStatistics,
    7: employeeStatistics,
    8: checkMessages,
}

while(1):
    tmp = sp.call('clear',shell=True)
    username = input("Username: ")
    password = input("Password: ")

    try:
        con = pymysql.connect(host='localhost',
                user=username,
                password=password,
                db='COMPANY',
                cursorclass=pymysql.cursors.DictCursor)
        with con:
            cur = con.cursor()
            while(1):
                tmp = sp.call('clear',shell=True)
                print("1. Hire a new employee")
                print("2. Fire an employee")
                print("3. Promote an employee")
                print("4. Reward a department")
                print("5. Project Statistics")
                print("6. Department Statistics")
                print("7. Employee Statistics")
                print("8. Check messages")
                print("9. Logout")
                c = int(input("Enter choice> "))
                tmp = sp.call('clear',shell=True)
                if c==9:
                    break
                else:
                    send(optionFunctionMapping[c]())


    except:
        tmp = sp.call('clear',shell=True)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
    
   

