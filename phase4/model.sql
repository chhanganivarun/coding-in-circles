CREATE DATABASE OJ

CREATE TABLE `user` (
  `userid` int PRIMARY KEY AUTO_INCREMENT,
  `firstname` varchar(255),
  `middlename` varchar(255),
  `lastname` varchar(255),
  `rating` int,
  `joindate` timestamp,
  `institute` varchar(255),
  `DOB` timestamp,
  `passwordhash` varchar(255),
  `passwordsalt` varchar(255),
  `primaryemail` varchar(255),
  `secondaryemail` varchar(255),
  `categary` int
);

CREATE TABLE `question` (
  `questionid` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255),
  `text` varchar(255),
  `timelimit` int,
  `score` int,
  `userid` int,
  `contestid` int
);

CREATE TABLE `testcases` (
  `testid` int,
  `input` varchar(255),
  `output` varchar(255),
  `subtaskid` int,
  `questionid` int,
  PRIMARY KEY ('testid','questionid')
);

CREATE TABLE `languages` (
  `languageName` varchar(255),
  `questionid` int,
  PRIMARY KEY (`languageName`, `questionid`)
);

CREATE TABLE `tags` (
  `tag` varchar(255),
  `questionid` int,
  PRIMARY KEY (`tag`, `questionid`)
);

CREATE TABLE `submission` (
  `subID` int PRIMARY KEY,
  `code` varchar(255),
  `submissiontime` int
);

CREATE TABLE `USERINCONTEST` (
  `userid` int,
  `contestid` int,
  PRIMARY KEY (`userid`, `contestid`)
);

CREATE TABLE `USERSOLVEQUESTION` (
  `userid` int,
  `questionid` int,
  `subid` int,
  PRIMARY KEY (`userid`, `questionid`, `subid`)
);

CREATE TABLE `contest` (
  `contestid` int PRIMARY KEY,
  `contestname` varchar(255),
  `minScoreAllowed` int,
  `CreationDate` timestamp,
  `MaximumScoreAllowed` int,
  `StartTime` timestamp,
  `EndTime` timestamp,
  `userid` int
);

CREATE TABLE `result` (
  `testid` int,
  `subid` int,
  `result` int,
  PRIMARY KEY (`testid`, `subid`)
);

ALTER TABLE `question` ADD FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

ALTER TABLE `question` ADD FOREIGN KEY (`contestid`) REFERENCES `contest` (`contestid`);

ALTER TABLE `testcases` ADD FOREIGN KEY (`questionid`) REFERENCES `question` (`questionid`);

ALTER TABLE `question` ADD FOREIGN KEY (`questionid`) REFERENCES `languages` (`questionid`);

ALTER TABLE `languages` ADD FOREIGN KEY (`questionid`) REFERENCES `submission` (`subID`);

ALTER TABLE `question` ADD FOREIGN KEY (`questionid`) REFERENCES `tags` (`questionid`);

ALTER TABLE `user` ADD FOREIGN KEY (`userid`) REFERENCES `USERINCONTEST` (`userid`);

ALTER TABLE `contest` ADD FOREIGN KEY (`contestid`) REFERENCES `USERINCONTEST` (`contestid`);

ALTER TABLE `user` ADD FOREIGN KEY (`userid`) REFERENCES `USERSOLVEQUESTION` (`userid`);

ALTER TABLE `question` ADD FOREIGN KEY (`questionid`) REFERENCES `USERSOLVEQUESTION` (`questionid`);

ALTER TABLE `submission` ADD FOREIGN KEY (`subID`) REFERENCES `USERSOLVEQUESTION` (`subid`);

ALTER TABLE `contest` ADD FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

ALTER TABLE `testcases` ADD FOREIGN KEY (`testid`) REFERENCES `result` (`testid`);

ALTER TABLE `submission` ADD FOREIGN KEY (`subID`) REFERENCES `result` (`subid`);
