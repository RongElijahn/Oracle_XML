CREATE TYPE BODY UserType AS 

    MEMBER FUNCTION getUserInfo RETURN VARCHAR2 IS 
    BEGIN 
        RETURN self.userID || ' ' || TO_CHAR(self.registeredDate, 'YYYY-MM-DD') || ' ' || self.emailAddress || ' ' || TO_CHAR(self.birthdate, 'YYYY-MM-DD'); 
    END;

    MAP MEMBER FUNCTION getAge RETURN INTEGER IS
    BEGIN
        RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, self.birthdate) / 12); 
    END;

END;
/

CREATE TYPE BODY CustomerType AS 
    OVERRIDING MEMBER FUNCTION getUserInfo RETURN VARCHAR2 IS 
    BEGIN 
        RETURN self.customerName || ' from ' || self.homeAddress || '. Can be reached at:  ' || self.phoneNumber; 
    END;
END;
/

CREATE TYPE BODY VenueType AS 
    MEMBER FUNCTION getCapacity RETURN INTEGER IS 
    BEGIN 
        RETURN self.capacity; 
    END;

    MEMBER FUNCTION getVenueName RETURN VARCHAR2 IS 
    BEGIN 
        RETURN self.venueName; 
    END;
END;
/

CREATE TYPE BODY EventType AS 
    MEMBER FUNCTION getEventName RETURN VARCHAR2 IS 
    BEGIN 
        RETURN self.eventName; 
    END;
END;
/

CREATE TYPE BODY TicketType AS 
    MEMBER FUNCTION getStatus RETURN INTEGER IS 
    BEGIN 
        RETURN self.ticketStatus; 
    END;

    ORDER MEMBER FUNCTION compare (otherTicket IN TicketType) RETURN INTEGER IS
    resultT INTEGER := 0;
    BEGIN
        IF self.ticketPrice > otherTicket.ticketPrice THEN
            resultT := 1;
        ELSE
        IF self.ticketPrice < otherTicket.ticketPrice THEN
            resultT := -1;
        END IF;
        END IF;
        RETURN resultT;
    END;

    MEMBER FUNCTION getPrice RETURN INTEGER IS
    BEGIN
        RETURN self.ticketPrice;
    END;
END;    
/

CREATE TYPE BODY PerformerDetailType AS 
    MEMBER FUNCTION getPerformerDetail RETURN VARCHAR2 IS 
    BEGIN 
        RETURN self.performerDetail; 
    END;
END;
/

CREATE TYPE BODY ReviewType AS 
    MAP MEMBER FUNCTION getRating RETURN INTEGER IS
    BEGIN
        RETURN self.starRating;
    END;
END;
/