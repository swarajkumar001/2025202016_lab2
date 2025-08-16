# 2025202016_lab2
CS6.302 – Lab 2: SQL Stored Procedures SQL scripts (q1.sql–q5.sql) for creating and testing stored procedures on a sample OTT database (Shows, Subscribers, WatchHistory). Includes README with setup and usage instructions.
**CS6.302 – Software System Development**
Lab - 2: SQL Stored Procedures

------------------------------------
 Overview
------------------------------------
This lab involves creating and testing stored procedures in MySQL using scripts q1.sql to q5.sql. 
Deliverables: lab2.zip containing all .sql files and this README.txt.

------------------------------------
 Setup
------------------------------------
1. Open MySQL Workbench & connect to server.  
2. Create/select schema:  
   CREATE DATABASE lab2_db;  
   USE lab2_db;  
3. Run provided CREATE TABLE + INSERT scripts to set up Shows, Subscribers, WatchHistory tables.  

------------------------------------
 Procedures
------------------------------------
Q1: ListAllSubscribers  
   CALL ListAllSubscribers();

Q2: GetWatchHistoryBySubscriber  
   CALL GetWatchHistoryBySubscriber(1);

Q3: AddSubscriberIfNotExists  
   CALL AddSubscriberIfNotExists('John Doe');

Q4: SendWatchTimeReport  
   CALL SendWatchTimeReport();

Q5: PrintAllSubscribersWatchHistory  
   CALL PrintAllSubscribersWatchHistory();

------------------------------------
 Recreate Procedure
------------------------------------
DROP PROCEDURE IF EXISTS procedure_name;

------------------------------------
 Submission
------------------------------------
Include files: q1.sql … q5.sql + README.txt  
Zip as: lab2.zip and upload on Moodle.  
Git Repo Link: [ https://github.com/swarajkumar001/2025202016_lab2  ]

------------------------------------
 Notes
------------------------------------
- Always select correct schema.  
- Test each procedure before submission.  
- Ensure no syntax errors.  

