CREATE DATABASE IF NOT EXISTS OJ;
use OJ;

CREATE TABLE `User` (
  `UserID` int PRIMARY KEY AUTO_INCREMENT,
  `FirstName` varchar(255),
  `MiddleName` varchar(255),
  `LastName` varchar(255),
  `Rating` int,
  `JoinDate` datetime,
  `Institute` varchar(255),
  `DOB` datetime,
  `PasswordHash` varchar(255),
  `PasswordSalt` varchar(255),
  `PrimaryMailID` varchar(255) UNIQUE NOT NULL,
  `isAdmin` boolean,
  `Category` int
);

CREATE TABLE `SecondaryEmails` (
  `UserID` int,
  `MailID` varchar(255),
  PRIMARY KEY (`UserID`, `MailID`)
);

CREATE TABLE `Question` (
  `QuestionID` int PRIMARY KEY AUTO_INCREMENT,
  `Title` varchar(255),
  `Text` varchar(255),
  `Score` int,
  `Creator` int,
  `ContestID` int
);

CREATE TABLE `Testcases` (
  `TestID` int,
  `Input` varchar(255),
  `ExpectedDutput` varchar(255),
  `SubtaskID` int,
  `Score` int,
  `QuestionID` int,
  PRIMARY KEY(TestID, QuestionID)
);

CREATE TABLE `Languages` (
  `LanguageName` varchar(255),
  `QuestionID` int,
  PRIMARY KEY (`LanguageName`, `QuestionID`)
);

CREATE TABLE `Tags` (
  `Tag` varchar(255),
  `QuestionID` int,
  PRIMARY KEY (`Tag`, `QuestionID`)
);

CREATE TABLE `Submission` (
  `SubmissionID` int PRIMARY KEY,
  `code` varchar(255),
  `SubmissionTime` int,
  `LanguageName` varchar(255)
);

CREATE TABLE `UserParticipatesInContest` (
  `UserID` int,
  `ContestID` int,
  PRIMARY KEY (`UserID`, `ContestID`)
);

CREATE TABLE `UserSolvesQuestion` (
  `UserID` int,
  `QuestionID` int,
  `SubmissionID` int,
  PRIMARY KEY (`UserID`, `QuestionID`, `SubmissionID`)
);

CREATE TABLE `contest` (
  `ContestID` int PRIMARY KEY,
  `contestname` varchar(255),
  `CreationDate` datetime,
  `MinScoreAllowed` int,
  `MaxScoreAllowed` int,
  `StartTime` datetime,
  `EndTime` datetime,
  `Creator` int
);

CREATE TABLE `result` (
  `TestID` int,
  `SubmissionID` int,
  `Result` int,
  `EvaulationDate` datetime,
  PRIMARY KEY (`TestID`, `SubmissionID`)
);

ALTER TABLE `SecondaryEmails` ADD FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`);

ALTER TABLE `Question` ADD FOREIGN KEY (`Creator`) REFERENCES `User` (`UserID`);

ALTER TABLE `Question` ADD FOREIGN KEY (`ContestID`) REFERENCES `contest` (`ContestID`);

ALTER TABLE `Testcases` ADD FOREIGN KEY (`QuestionID`) REFERENCES `Question` (`QuestionID`);

ALTER TABLE Languages ADD FOREIGN KEY (`QuestionID`) REFERENCES Question (`QuestionID`);

ALTER TABLE Tags ADD FOREIGN KEY (`QuestionID`) REFERENCES Question (`QuestionID`);

ALTER TABLE `UserParticipatesInContest` ADD FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`);

ALTER TABLE UserParticipatesInContest ADD FOREIGN KEY (`ContestID`) REFERENCES contest (`ContestID`);

ALTER TABLE UserSolvesQuestion ADD FOREIGN KEY (`UserID`) REFERENCES User (`UserID`);

ALTER TABLE UserSolvesQuestion ADD FOREIGN KEY (`QuestionID`) REFERENCES Question (`QuestionID`);

ALTER TABLE UserSolvesQuestion ADD FOREIGN KEY (`SubmissionID`) REFERENCES Submission (`SubmissionID`);

ALTER TABLE `contest` ADD FOREIGN KEY (`Creator`) REFERENCES `User` (`UserID`);

ALTER TABLE `Testcases` ADD FOREIGN KEY (`TestID`) REFERENCES `result` (`TestID`);

ALTER TABLE Result ADD FOREIGN KEY (`SubmissionID`) REFERENCES Submission (`SubmissionID`);
