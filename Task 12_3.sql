create table ISSUESLIST
(
	ID serial primary key,
	NAME varchar(50) charset utf8
);

CREATE TABLE ISSUESS
(
	ID serial primary key,
	ISSUESLIST_ID bigint unsigned not null,
    foreign key (ISSUESLIST_ID) references ISSUESLIST(ID),
	SUMMARY varchar(100),
	DESCRIPTION varchar(1024) char set utf8,
	USER_ID_ASSIGNEDTO bigint unsigned not null,
    foreign key (USER_ID_ASSIGNEDTO) references USERS(ID)
);

insert into ISSUESLIST(NAME)
values("ToDo");

insert into ISSUESLIST(NAME)
values("In progress");

insert into ISSUESLIST(NAME)
values("Done");

COMMIT;

insert into ISSUESS(ISSUESLIST_ID, SUMMARY, DESCRIPTION, USER_ID_ASSIGNEDTO)
values(1, "Buy food", "Food for tomorrow breakfast", 1);

insert into ISSUESS(ISSUESLIST_ID, SUMMARY, DESCRIPTION, USER_ID_ASSIGNEDTO)
values(1, "Module 12", "Finish module 12", 2);

insert into ISSUESS(ISSUESLIST_ID, SUMMARY, DESCRIPTION, USER_ID_ASSIGNEDTO)
values(1, "Bootcamp", "Complete Java bootcamp", 4);

insert into ISSUESS(ISSUESLIST_ID, SUMMARY, DESCRIPTION, USER_ID_ASSIGNEDTO)
values(1, "Job", "Find a great job", 1);

insert into ISSUESS(ISSUESLIST_ID, SUMMARY, DESCRIPTION, USER_ID_ASSIGNEDTO)
values(1, "Exam", "Pass an exam", 1);

insert into ISSUESS(ISSUESLIST_ID, SUMMARY, DESCRIPTION, USER_ID_ASSIGNEDTO)
values(2, "Create Sql config file", "Writing content for my sql task", 2);

insert into ISSUESS(ISSUESLIST_ID, SUMMARY, DESCRIPTION, USER_ID_ASSIGNEDTO)
values(2, "Watch tv", "Watching the football game", 5);

insert into ISSUESS(ISSUESLIST_ID, SUMMARY, DESCRIPTION, USER_ID_ASSIGNEDTO)
values(2, "Snow", "Remove snow from driveway", 3);

insert into ISSUESS(ISSUESLIST_ID, SUMMARY, DESCRIPTION, USER_ID_ASSIGNEDTO)
values(2, "Sleep", "Going to sleep", 1);

insert into ISSUESS(ISSUESLIST_ID, SUMMARY, DESCRIPTION, USER_ID_ASSIGNEDTO)
values(2, "Holidays", "Go for winter holidays", 2);

insert into ISSUESS(ISSUESLIST_ID, SUMMARY, DESCRIPTION, USER_ID_ASSIGNEDTO)
values(3, "Homework", "Math homework for Friday lesson", 3);

insert into ISSUESS(ISSUESLIST_ID, SUMMARY, DESCRIPTION, USER_ID_ASSIGNEDTO)
values(3, "Dinner", "Eat dinner", 4);

insert into ISSUESS(ISSUESLIST_ID, SUMMARY, DESCRIPTION, USER_ID_ASSIGNEDTO)
values(3, "Pils", "Take a pill", 3);

insert into ISSUESS(ISSUESLIST_ID, SUMMARY, DESCRIPTION, USER_ID_ASSIGNEDTO)
values(3, "Bath", "Take a bath", 1);

insert into ISSUESS(ISSUESLIST_ID, SUMMARY, DESCRIPTION, USER_ID_ASSIGNEDTO)
values(3, "Reading", "Reading of book", 3);

commit;