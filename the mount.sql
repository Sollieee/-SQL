-- Create a new database
CREATE DATABASE mountain_team;

-- use new database
USE mountain_Team;

-- Create a table for mountains
CREATE TABLE mountains (
    location VARCHAR(11) PRIMARY KEY,
    name VARCHAR(255),
    height INT,
    shape VARCHAR(255)
);
   
-- Create a primary infomation table for mountain rescue teams
CREATE TABLE team_info (
    team_id VARCHAR(5) primary key,
    town VARCHAR(255) 
);

-- Create a table for mountain rescue teams
CREATE TABLE rescue_teams (
    team_ID VARCHAR(5) REFERENCES team_info(team_id),
    location VARCHAR(11) REFERENCES mountains(location),
    team_name varchar(255),
    Length int,
    grade VARCHAR(255)
);

-- Create a table for RAF base
CREATE TABLE raf_base (
    base_name VARCHAR(255),-- PRIMARY KEY,
	team_ID VARCHAR(5) REFERENCES team_info(team_id),
    region VARCHAR(255),
    helicopter_type VARCHAR(255)
);



-- Create a table for mountain rescue team members and nicknames
CREATE TABLE team_members (
    member_id VARCHAR(7) PRIMARY KEY,
    team_ID VARCHAR(5) REFERENCES teams_info(team_id),
    nickname VARCHAR(255),
    role VARCHAR(255),
    telephone VARCHAR(20)
);


INSERT INTO mountains VALUES ('124:710130','caderldris','893','ridge'),
('115:642580','cglyders','999','ridge'),
('115:608543','snowdon','1085','conical');

SELECT * FROM mountain_team.mountains;

INSERT INTO rescue_teams VALUES 
('MRT01','124:710130','minffordd','6','difficult'),
('MRT02','124:710130','pony','8','moderate'),
('MRT03','115:642580','devil','5','moderate'),
('MRT03','115:608543','miner','4','easy'),
('MRT03','115:608543','pyg','3','moderate'),
('MRT03','115:608543','cribgoch','3','difficult'),
('MRT04','115:608543','Llanberris' ,'5' ,'easy');

SELECT * FROM mountain_team.rescue_teams;

INSERT INTO team_info VALUES 
('MRT01', 'Harlech'),
('MRT02', 'Dolgellau'),
('MRT03', 'Bangor'),
('MRT04', 'Llanberris');
SELECT * FROM mountain_team.team_info;

INSERT INTO raf_base VALUES 
('StAthan', 'MRT01', 'Glamorgan', 'Sea-King'),
('StAthan','MRT02', 'Glamorgan','Sea-King'),
( 'Valley', 'MRT03',  'Anglesey', 'Sea-King'),
( 'Valley', 'MRT04',  'Anglesey', 'Sea-King');
SELECT * FROM mountain_team.raf_base;

INSERT INTO team_members VALUES 
('MEM0001', 'MRT03','boss', 'leader', '0142-788-135'),
('MEM0002', 'MRT03','quack', 'first-aider', '0142-788-853'),
('MEM0003', 'MRT03','walkytalkyguy', 'radio-operator', '0142-788-098'),
('MEM0004', 'MRT03','mapman', 'navigator', '0142-788-064'),
('MEM0005', 'MRT03','packhorse' ,'dogsbody','0142-788-367'),
('MEM0006', 'MRT03','kitman', 'dogsbody', '0142-788-234'),
('MEM0007', 'MRT02','chief', 'leader', '013391-076'),
('MEM0008', 'MRT02','doc', 'first-aider', '013391-154'),
('MEM0009', 'MRT02','radiohead', 'radio-operator', '013391-043'),
('MEM0010', 'MRT02','mappy', 'navigator', '013391-134');

SELECT * FROM mountain_team.team_members;