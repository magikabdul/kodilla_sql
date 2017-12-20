#Listę zadań z tabeli ISSUESS z dołączonymi do nich nazwami list zadań z tabeli ISSUESLISTS

SELECT I.SUMMARY, I.DESCRIPTION, IL.NAME
FROM ISSUESS I, ISSUESLIST IL
WHERE IL.ID = I.ISSUESLIST_ID;

#Listę zadań z tabeli ISSUESS z przypisanymi do nich użytkownikami z tabeli USERS
SELECT I.SUMMARY, I.DESCRIPTION, U.FIRSTNAME, U.LASTNAME
FROM ISSUESS I, USERS U
WHERE I.USER_ID_ASSIGNEDTO = U.ID;

#Imiona i nazwiska użytkowników posiadających zadania, wraz z informacją o ilości zadań, które są do nich przypisane
SELECT U.FIRSTNAME, U.LASTNAME, COUNT(*) AS NUMBER_OF_TASKS
FROM ISSUESS I, USERS U
WHERE I.USER_ID_ASSIGNEDTO = U.ID
GROUP BY LASTNAME, FIRSTNAME;