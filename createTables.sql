CREATE TABLE Customer OF CustomerType (
    PRIMARY KEY (userID)
);

CREATE TABLE EventOrganizer OF EventOrganizerType (
    PRIMARY KEY (userID)
);

CREATE TABLE Venue OF VenueType (
   PRIMARY KEY (venueID) 
);
CREATE TABLE Seat OF SeatType (
    PRIMARY KEY (seatID)
);

CREATE TABLE Event OF EventType (
    PRIMARY KEY (eventID)
);

CREATE TABLE Orders OF OrderType (
    PRIMARY KEY (orderID)
);

CREATE TABLE Ticket OF TicketType (
PRIMARY KEY (ticketID) 
);

CREATE TABLE Performer OF PerformerType (
    PRIMARY KEY (performerID)
);

CREATE TABLE PerformerDetail OF PerformerDetailType (
    PRIMARY KEY (performerDetailID)
);


CREATE TABLE Review OF ReviewType (
    PRIMARY KEY (reviewID)
);
