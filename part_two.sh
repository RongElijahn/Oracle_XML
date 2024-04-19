#!/bin/sh 

OracleXML getXML -user "grp2/grp2there" -conn "jdbc:oracle:thin:@sit.itec.yorku.ca:1521:studb10g" -rowsetTag "UserAkramSis" -rowTag "TicketDetails" "select t.ticketID, t.eventRef.eventName,t.ticketPrice from Ticket t where t.orderRef.customerRef.customerName='akram sis'"
OracleXML getXML -user "grp2/grp2there" -conn "jdbc:oracle:thin:@sit.itec.yorku.ca:1521:studb10g" -rowsetTag "UserRosBios" -rowTag "ReviewRecord" "Select r.eventRef.eventName as EventName, r.userReview as Review, r.starRating as Rating from Review r Where r.customerRef.customerName = 'ros bios'"
OracleXML getXML -user "grp2/grp2there" -conn "jdbc:oracle:thin:@sit.itec.yorku.ca:1521:studb10g" -rowsetTag "ScotiabankArena" -rowTag "EventDetails" "Select pd.eventRef.eventName as EventName, pd.performerRef.performerName as PerformerName from PerformerDetail pd Where pd.eventRef.venueRef.venueName = 'Scotiabank Arena'"
OracleXML getXML -user "grp2/grp2there" -conn "jdbc:oracle:thin:@sit.itec.yorku.ca:1521:studb10g" -rowsetTag "LostFrequenciesEvent" -rowTag "CustomerReview" "Select r.customerRef.customerName as CustomerName, r.userReview as Review from Review r Where r.eventRef.eventID = '196-LF-240208'"
OracleXML getXML -user "grp2/grp2there" -conn "jdbc:oracle:thin:@sit.itec.yorku.ca:1521:studb10g" -rowsetTag "JubileeKpop" -rowTag "OrgDetails" "Select e.eventOrganizerRef.orgName as OrganizerName, e.eventOrganizerRef.phoneNumber as OrganizerPhoneNo from Event e Where e.eventName = 'Jubilee kpop'"


