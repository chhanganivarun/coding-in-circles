# Requirement Document

## Project Phase 1

### Team 1 Data-Analyst

## Introduction

### Description of Mini-world

Online Judges are used 



## Database Requirements

### Entities

#### All Entities

- User

  1. user id - Primary Key
  2. Name - composite key
     - First Name
     - Middle Name
     - Last Name
  3. Date of Birth
  4. Primary Email ID
  5. Secondary Email IDs - multivalued attribute
  6. Institute
  7. Join Date(datetime)
  8. Age - Derived Attribute
- Question
  1. Question ID - Primary Key
  2. Title
  3. Question text
  4. Score
  5. Allowed Languages
- Contest
  1. Contest ID - Primary Key
  2. Contest Name
  3. Creation Date
  4. Starts at Time
  5. Ends at Time
  6. Minimum Score allowed
  7. Maximum Score allowed
- Test Case

  1. Test case ID - Primary Key

  2. Input

  3. Expected Output

  4. Subtask ID

  5. Score
- Submission
  1. Submission ID - Primary Key
  2. Submission Time
  3. Code
  4. Language
- Result
  1. result value
  2. evaluation date
- Administrator User
  1. Category

#### Weak Entities

- Submission - Depends on User and Question. Cannot exist until both exist

- Testcase - Depends on Question. Cannot exist until a question exists corresponding to it.

- Results In - Depends on Solution and its testcase. Cannot exist until both exist

####  Relationships

- User - Contest (Creates)
- User - Contest (Participates in)
- User - Question (Forms)
- User - Question - Submission (Solves)
- Contest - Question (Has)
- Question - Testcase (Has)
- Solution - Testcase - Result (Results in)

#### n>3 Relationship

- **Solves** Relationship is a Tertiary Relation
- **Results In** Relationship is a Tertiary Relation

#### Subclass

- Entity Administrator User is a Subclass of entity User.


## Functional Requirements

- Signup/Login for User
- Login for admin
- User can add a problem
- User can delete a problem created by himself
- User can add a contest
- User can delete a contest created by himself
- Admin user can delete a problem or a contest
- User review
- Rating may increase or decrease based upon performance
- Contest will have different divisions
- Problems will have several testcases for corresponding subtasks for partial marking
- User can update his user information like name, dob, institute
- user can submit code for evaluation
- User can see their progress over time



