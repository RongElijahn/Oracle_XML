
SELECT XMLRoot(
           XMLElement("Customers",
             XMLAgg(
               XMLElement("Customer",
                 XMLForest(
                   c.customerName AS "Name",
                   c.emailAddress AS "Email",
                   c.phoneNumber AS "Phone_Number",
                   c.homeAddress AS "Address"
                 )
               )
             )
           ),
           VERSION '1.0',
           STANDALONE YES
         ) AS "Customer_Info"
FROM Customer c
GROUP BY c.customerName;

SELECT XMLRoot(
           XMLElement("Venues",
             XMLAgg(
               XMLElement("Venue",
                 XMLForest(
                   v.venueName AS "Name",
                   v.location AS "Location",
                   v.capacity AS "Capacity"
                 )
               )
             )
           ),
           VERSION '1.0',
           STANDALONE YES
         ) AS "Venue_Info"
FROM Venue v
GROUP BY v.venueName;

SELECT XMLRoot(
           XMLElement("Event_Organizers",
             XMLAgg(
               XMLElement("Event_Organizer",
                 XMLForest(
                   eo.orgName AS "Name",
                   eo.phoneNumber AS "Phone_Number"
                 )
               )
             )
           ),
           VERSION '1.0',
           STANDALONE YES
         ) AS "Event_Organizers_Info"
FROM EventOrganizer eo
GROUP BY eo.orgName;


select xmlroot(xmlelement("EventInfo",xmlagg(xmlelement("Event",xmlelement(eventName,pd.eventRef.eventName),xmlagg(xmlelement("Performer", xmlforest(pd.performerRef.performerID, pd.performerRef.performerName)))))), version '1.0', standalone yes) as doc from PerformerDetail pd group by pd.eventRef.eventName;
select xmlroot(xmlelement("ReviewInfo",xmlagg(xmlelement("Review",xmlattributes(r.reviewID as "reviewID"),xmlelement("Customer",xmlattributes(r.customerRef.userID as "ID"),xmlelement(customerRef,r.customerRef.customerName)),xmlelement("eventRef",xmlforest(r.eventRef.eventName, r.eventRef.eventDate)),xmlelement(starRating,r.starRating),xmlelement(userReview,r.userReview)))),version '1.0', standalone yes) as doc from Review r;
select xmlroot(xmlelement("eventInfo",xmlagg(xmlelement("eventlist",xmlattributes(t.eventRef.eventID as "eventID"),xmlagg(xmlelement("client",xmlattributes(t.orderRef.customerRef.userID as "clientID"),xmlforest(t.orderRef.customerRef.customerName as "Name",t.orderRef.customerRef.phoneNumber as "phoneNumber")))))),version '1.0',standalone yes) as doc from Ticket t group by t.eventRef.eventID;


SELECT XMLRoot(
         XMLElement("Venue",
           XMLForest(
             v.venueID AS "VenueID",
             v.venueName AS "VenueName",
             v.location AS "VenueLocation",
             (SELECT XMLAgg(
                 XMLElement("Event",
                   XMLForest(
                     e.eventID AS "EventID",
                     e.eventName AS "EventName"
                   )
                 )
               )
               FROM Event e
               WHERE e.venueRef.venueID = v.venueID
             ) AS "VenueEvents"
           )
         ),
         VERSION '1.0', STANDALONE YES
       ) AS "Query7"
FROM Venue v
WHERE v.venueID = 'SA';


select xmlroot(xmlelement("TicketInfo", xmlagg(xmlelement("Ticket", xmlattributes(t.ticketID AS "TicketID"), xmlelement("Seat", xmlattributes(t.seatRef.seatID AS "SeatID")),xmlelement("Venue", xmlforest(t.seatRef.venueRef.venueID AS "VenueID", t.seatRef.venueRef.venueName AS "VenueName"))))),version '1.0', standalone yes) AS Query8 from Ticket t;

select xmlroot(xmlelement("BusyBuzzEvents", xmlagg(xmlelement("Event", xmlattributes(t.eventRef.eventName AS "EventName"), xmlagg(xmlelement("Ticket", xmlattributes(t.ticketID AS "TicketID"), xmlforest(t.ticketPrice as "TicketPrice", t.ticketStatus as "TicketStatus")))))), version '1.0', standalone yes) AS Query9 from Ticket t WHERE t.eventRef.eventOrganizerRef.orgName = 'Busy Buzz' group by t.eventRef.eventName;


select xmlroot(xmlelement("VenuePerformers", xmlagg(xmlelement("Venue", xmlattributes(pd.eventRef.venueRef.venueName AS "VenueName"), xmlagg(xmlelement("Performer", xmlattributes(pd.performerRef.performerID AS "PerformerID"), xmlforest(pd.performerRef.performerName AS "PerformerName", pd.performerDetail AS "Showtime")))))), version '1.0', standalone yes) AS Query10 from PerformerDetail pd group by pd.eventRef.venueRef.venueName;

SELECT XMLRoot(
         XMLElement("SeatAndVenueDetails",
           XMLForest(
             XMLElement("Seat",
               XMLForest(
                 s.seatID AS "SeatID",
                 s.seatType AS "SeatType",
                 s.seatLocation AS "SeatLocation"
               )
             ) AS "SeatDetails",
             XMLElement("Venue",
               XMLForest(
                 v.venueID AS "VenueID",
                 v.venueName AS "VenueName",
                 v.location AS "VenueLocation"
               )
             ) AS "VenueDetails"
           )
         ),
         VERSION '1.0', STANDALONE YES
       ) AS "Query11"
FROM Seat s, Venue v
WHERE s.venueRef.venueID = v.venueID;

SELECT XMLRoot(
         XMLElement("TicketAndEventDetails",
           XMLForest(
             XMLElement("Ticket",
               XMLForest(
                 t.ticketID AS "TicketID",
                 t.ticketPrice AS "TicketPrice",
                 t.ticketStatus AS "TicketStatus"
               )
             ) AS "TicketDetails",
             XMLElement("Event",
               XMLForest(
                 e.eventID AS "EventID",
                 e.eventName AS "EventName",
                 e.eventDate AS "EventDate",
                 e.eventDescription AS "EventDescription"
               )
             ) AS "EventDetails"
           )
         ),
         VERSION '1.0', STANDALONE YES
       ) AS "Query12"
FROM Ticket t, Event e
WHERE t.eventRef.eventID = e.eventID;

SELECT XMLRoot(
         XMLElement("SeatAndTicketDetails",
           XMLAgg(
             XMLElement("SeatAndTicket",
               XMLForest(
                 s.seatID AS "SeatID",
                 s.seatType AS "SeatType",
                 s.seatLocation AS "SeatLocation",
                 (SELECT XMLForest(
                     t.ticketID AS "TicketID",
                     t.ticketPrice AS "TicketPrice",
                     t.ticketStatus AS "TicketStatus"
                   )
                   FROM Ticket t
                   WHERE t.seatRef.seatID = s.seatID
                 ) AS "TicketDetails"
               )
             )
           )
         ),
 VERSION '1.0', STANDALONE YES
       ) AS "Query13"
FROM Seat s
WHERE s.seatID = 'SAA5'
GROUP BY s.seatID, s.seatType, s.seatLocation;

select xmlroot(xmlelement("UnsoldTicketList",xmlagg(
    xmlelement("UnsoldTicket",xmlattributes(t.ticketID as "ticketID"),
    xmlagg(xmlelement("Event", xmlattributes(t.eventRef.eventID as "eventID"),
    xmlforest(t.eventRef.eventName AS "Event")
    ))))),VERSION '1.0', STANDALONE YES) as "UnsoldTicketList" from Ticket t where t.ticketStatus=0 group by t.ticketID;

select xmlroot(
    xmlelement("CustomerList",
        xmlagg(
            xmlelement("Customer",xmlattributes(t.orderRef.customerRef.userID as "cID"),
                xmlagg(
                    xmlelement("Event",xmlattributes(t.eventRef.eventID as "eventID"),
                    xmlforest(t.eventRef.eventName as "eventName",t.ticketID as "ticketNumber",t.getPrice() as "price", t.orderRef.bookingStatus as "bookingStatus")))))),
VERSION '1.0', STANDALONE YES) as "CustomerOrderList"
from Ticket t where t.ticketStatus=1 group by t.orderRef.customerRef.userID;





