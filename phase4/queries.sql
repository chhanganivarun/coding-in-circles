SELECT * FROM user WHERE primaryemail = '';
SELECT * FROM user WHERE primaryemail = '' AND passwordhash = '';

INSERT INTO user (firstname, middlename, lastname, rating, joindate, institute, DOB, passwordhash, passwordsalt, primaryemail, secondaryemail, category) values ('','','',0,'date?','institute','date?')

SELECT * FROM user, USERSOLVEQUESTION, question WHERE user.userid = USERSOLVEQUESTION.userid and USERSOLVEQUESTION.questionid = question.questionid;
SELECT * FROM user, USERINCONTEST, question WHERE user.userid = USERINCONTEST.userid and USERINCONTEST.contestid = contest.contestid;

SELECT question.questionid, question.title, user.userid, user.firstname FROM `table` ${as nameAlias} ${WHERE condition}

INSERT INTO question (title, text, timelimit, score, userid, contestid) VALUES ('','path/to/file',1,100,123,456);
