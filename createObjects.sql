CREATE TYPE UserType AS OBJECT (
    userID VARCHAR2(25),
    password VARCHAR2(25),
    registeredDate DATE,
    emailAddress VARCHAR2(25),
    birthdate DATE,
    MEMBER FUNCTION getUserInfo RETURN VARCHAR2,
    MAP MEMBER FUNCTION getAge RETURN INTEGER
) NOT FINAL;     
/

CREATE TYPE CustomerType UNDER UserType (
    customerName VARCHAR2(25),
    phoneNumber VARCHAR2(25),
    homeAddress VARCHAR2(50),
    OVERRIDING MEMBER FUNCTION getUserInfo RETURN VARCHAR2
);
/

CREATE TYPE EventOrganizerType UNDER UserType (
    orgName VARCHAR2(25),
    phoneNumber VARCHAR2(10)
);
/

CREATE TYPE VenueType AS OBJECT (
    venueID VARCHAR2(25),
    venueName VARCHAR2(25),
    location VARCHAR2(50),
    capacity INTEGER,
    MEMBER FUNCTION getCapacity RETURN INTEGER,
    MEMBER FUNCTION getVenueName RETURN VARCHAR2
);
/

CREATE TYPE SeatType AS OBJECT (
    seatID VARCHAR2(25),
    venueRef REF VenueType, 
    seatType VARCHAR2(10),
    seatLocation VARCHAR2(20)
);
/

CREATE TYPE EventType AS OBJECT (
    eventID VARCHAR2(25),
    eventOrganizerRef REF EventOrganizerType,
    venueRef REF VenueType, 
    eventName VARCHAR2(25),
    eventDate DATE,
    eventDescription VARCHAR2(50),
    MEMBER FUNCTION getEventName RETURN VARCHAR2
);
/

CREATE TYPE PaymentType AS OBJECT (
    cardNum INTEGER,
    cardHolderName VARCHAR2(25),
    CVV INTEGER,
    expiryDate DATE
);
/

CREATE TYPE OrderType AS OBJECT (
    orderID VARCHAR2(25),
    customerRef REF CustomerType,
    payment PaymentType,
    status INTEGER,
    bookingStatus INTEGER
);
/

CREATE TYPE TicketType AS OBJECT (
    ticketID VARCHAR2(25),
    seatRef REF SeatType, 
    orderRef REF OrderType,
    eventRef REF EventType,
    ticketPrice INTEGER,
    ticketStatus INTEGER,
    MEMBER FUNCTION getStatus RETURN INTEGER,
    ORDER MEMBER FUNCTION compare (otherTicket in TicketType) RETURN INTEGER,
    MEMBER FUNCTION getPrice RETURN INTEGER
);
/

CREATE TYPE PerformerType AS OBJECT (
    performerID VARCHAR2(25),
    performerName VARCHAR2(25)
);
/

CREATE TYPE PerformerDetailType AS OBJECT (
    performerDetailID VARCHAR2(25),
    performerRef REF PerformerType,
    eventRef REF EventType,
    performerDetail VARCHAR2(35),
    MEMBER FUNCTION getPerformerDetail RETURN VARCHAR2
);
/

CREATE TYPE ReviewType AS OBJECT (
    reviewID VARCHAR2(25),
    customerRef REF CustomerType, 
    eventRef REF EventType,
    userID VARCHAR2(25),
    userReview VARCHAR2(50),
    starRating INTEGER,
    MAP MEMBER FUNCTION getRating RETURN INTEGER
);
/
