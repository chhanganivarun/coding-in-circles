CREATE DATABASE IF NOT Exists OJ;
use OJ

CREATE TABLE `user` (
  `userid` int PRIMARY KEY AUTO_INCREMENT,
  `firstname` varchar(255),
  `middlename` varchar(255),
  `lastname` varchar(255),
  `rating` int,
  `joindate` datetime,
  `institute` varchar(255),
  `DOB` datetime,
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
  PRIMARY KEY (`testid`,`questionid`)
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
  `subid` int PRIMARY KEY,
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
  `CreationDate` datetime,
  `MaximumScoreAllowed` int,
  `StartTime` datetime,
  `EndTime` datetime,
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

ALTER TABLE `languages` ADD FOREIGN KEY (`questionid`) REFERENCES `question` (`questionid`);

ALTER TABLE `languages` ADD FOREIGN KEY (`questionid`) REFERENCES `submission` (`subid`);

ALTER TABLE `tags` ADD FOREIGN KEY (`questionid`) REFERENCES `question` (`questionid`);

ALTER TABLE `USERINCONTEST` ADD FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

ALTER TABLE `USERINCONTEST` ADD FOREIGN KEY (`contestid`) REFERENCES `contest` (`contestid`);

ALTER TABLE `USERSOLVEQUESTION` ADD FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

ALTER TABLE `USERSOLVEQUESTION` ADD FOREIGN KEY (`questionid`) REFERENCES `question` (`questionid`);

ALTER TABLE `USERSOLVEQUESTION` ADD FOREIGN KEY (`subid`) REFERENCES `submission` (`subid`);

ALTER TABLE `contest` ADD FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

ALTER TABLE `testcases` ADD FOREIGN KEY (`testid`) REFERENCES `result` (`testid`);

ALTER TABLE `result` ADD FOREIGN KEY (`subid`) REFERENCES `submission` (`subid`);
