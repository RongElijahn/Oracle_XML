INSERT INTO Customer VALUES (
    CustomerType('ahmad_rias','TH56255kj@100',TO_DATE('14-May-2010', 'DD-MON-YYYY'),
    'ahmadrias@gmail.com',TO_DATE('04-Oct-1979', 'DD-MON-YYYY'),
    'ahmad rias','4367924622','2565 Hazel St apt607 Burnaby BC V5H4T1')
);

INSERT INTO Customer VALUES (
    CustomerType('akram_sis','jsgcja1579',TO_DATE('14-May-2005', 'DD-MON-YYYY'),
    'akramsis@gmail.com',TO_DATE('24-Dec-1875', 'DD-MON-YYYY'),
    'akram sis','4678824699','2565 Finch Ave W,unit3,North York,ON M9M2G1')
);

INSERT INTO Customer VALUES (
    CustomerType('ros_bios','jddfool5663',TO_DATE('24-Aug-2020', 'DD-MON-YYYY'),
    'rosbios@gmail.com',TO_DATE('11-Feb-1965', 'DD-MON-YYYY'),
    'ros bios','4647822499','520 Bryne Dr,Unit 7,Barrie ON L4N9P6')
);


insert into EventOrganizer values (
    EventOrganizerType('hungry_wines','kSlskadak@4660',TO_DATE('04-Feb-2022', 'DD-MON-YYYY'),
    'hungrywines@gmail.com',TO_DATE('04-Oct-1989', 'DD-MON-YYYY'),'Hungry wines','4367362422'));

insert into EventOrganizer values (
    EventOrganizerType('busy_buzz','shfbwmzbc4582',TO_DATE('12-Aug-2011', 'DD-MON-YYYY'),
    'busybuzz@gmail.com',TO_DATE('24-Jan-1949', 'DD-MON-YYYY'),'Busy Buzz','4677364899'));

insert into EventOrganizer values (
    EventOrganizerType('fun_zone','asakjshiq822421',TO_DATE('12-Aug-2021', 'DD-MON-YYYY'),
    'funzone@gmail.com',TO_DATE('04-Jan-1999', 'DD-MON-YYYY'),'Funzone','4647362899'));


insert into Venue values (
    VenueType('SA','Scotiabank Arena','40 Bay St., Toronto, ON M5J2X2',19800));
insert into Venue values (
    VenueType('RC','Rogers Centre','1 Blue Jays Way, Toronto, ON M5V1J1',41500));
insert into Venue values (
    VenueType('BC','BC Place','777 Pacific Blvd Vancouver, BC',54500));


insert into Seat values (
    SeatType('SAA5',(select ref(v) from Venue v where v.venueID = 'SA'),
    'executive','A15'));
insert into Seat values (
    SeatType('RCB58',(select ref(v) from Venue v where v.venueID = 'RC'),
    'executive','B258'));
insert into Seat values (
    SeatType('SAC287',(select ref(v) from Venue v where v.venueID = 'SA'),
    'theatre','C5287'));
insert into Seat values (
    SeatType('SAC288',(select ref(v) from Venue v where v.venueID = 'SA'),
    'theatre','C5288'));
insert into Seat values (
    SeatType('SAC289',(select ref(v) from Venue v where v.venueID = 'SA'),
    'theatre','C5289'));
insert into Seat values (
    SeatType('BCD568',(select ref(v) from Venue v where v.venueID = 'BC'),
    'premium','D568'));
insert into Seat values (
    SeatType('BCD569',(select ref(v) from Venue v where v.venueID = 'BC'),
    'premium','D569'));
insert into Seat values (
    SeatType('BCD570',(select ref(v) from Venue v where v.venueID = 'BC'),
    'premium','D570'));
insert into Seat values (
    SeatType('SAB128',(select ref(v) from Venue v where v.venueID = 'SA'),
    'theatre','B128'));
insert into Seat values (
    SeatType('SAB127',(select ref(v) from Venue v where v.venueID = 'SA'),
    'theatre','B127'));
insert into Seat values (
    SeatType('SAB129',(select ref(v) from Venue v where v.venueID = 'SA'),
    'theatre','B129'));



insert into Event values (
    EventType('128-JB-240223',(select ref(eo) from EventOrganizer eo where eo.userID = 'hungry_wines'),
    (select ref(v) from Venue v where v.venueID = 'SA'),'Jubilee kpop',TO_DATE('23-Feb-2024', 'DD-MON-YYYY'),
    '25th anniversary of k-pop in Canada'));
insert into Event values (
    EventType('96-AG-230212',(select ref(eo) from EventOrganizer eo where eo.userID = 'busy_buzz'),
    (select ref(v) from Venue v where v.venueID = 'BC'),'American Girl',TO_DATE('12-Feb-2023', 'DD-MON-YYYY'),
    'American Girl characters pop'));
insert into Event values (
    EventType('196-LF-240208',(select ref(eo) from EventOrganizer eo where eo.userID = 'busy_buzz'),
    (select ref(v) from Venue v where v.venueID = 'SA'),'lost frequencies',TO_DATE('08-Feb-2024', 'DD-MON-YYYY'),
    'Lost Frequencies SURF MESA'));


insert into Orders values (
    OrderType('1254826',(select ref(c) from Customer c where c.userID = 'ahmad_rias'),
    PaymentType(71111111111114,'ahmad rias',125,TO_DATE('12-Nov-2025', 'DD-MON-YYYY')),1,1));
insert into Orders values (
    OrderType('12584626',(select ref(c) from Customer c where c.userID = 'akram_sis'),
    PaymentType(11111111111111,'akram sis',365,TO_DATE('02-Oct-2026', 'DD-MON-YYYY')),1,1));
insert into Orders values (
    OrderType('12585626',(select ref(c) from Customer c where c.userID = 'ros_bios'),
    PaymentType(223311111111111,'ros bios',685,TO_DATE('02-Oct-2036', 'DD-MON-YYYY')),1,1));
insert into Orders values (
    OrderType('12584676',(select ref(c) from Customer c where c.userID = 'ros_bios'),
    PaymentType(223311111111111,'ros bios',685,TO_DATE('02-Oct-2036', 'DD-MON-YYYY')),1,1));
insert into Orders values (
    OrderType('12684676',(select ref(c) from Customer c where c.userID = 'ros_bios'),
    PaymentType(223311111111111,'ros bios',685,TO_DATE('02-Oct-2036', 'DD-MON-YYYY')),1,1));
insert into Orders values (
    OrderType('12784626',(select ref(c) from Customer c where c.userID = 'akram_sis'),
    PaymentType(11111111111111,'akram sis',365,TO_DATE('02-Oct-2026', 'DD-MON-YYYY')),1,1));
insert into Orders values (
    OrderType('12784126',(select ref(c) from Customer c where c.userID = 'akram_sis'),
    PaymentType(7811111111111111,'akram sis',365,TO_DATE('02-Oct-2026', 'DD-MON-YYYY')),1,1));
insert into Orders values (
    OrderType('13784626',(select ref(c) from Customer c where c.userID = 'akram_sis'),
    PaymentType(111111111111111,'akram sis',365,TO_DATE('02-Oct-2026', 'DD-MON-YYYY')),1,1));
insert into Orders values (
    OrderType('1254656',(select ref(c) from Customer c where c.userID = 'ahmad_rias'), 
    PaymentType(371111111111114,'ahmad rias',125,TO_DATE('12-Nov-2025', 'DD-MON-YYYY')),1,1));
insert into Orders values (
    OrderType('1254756',(select ref(c) from Customer c where c.userID = 'ahmad_rias'),
    PaymentType(371111111111114,'ahmad rias',125,TO_DATE('12-Nov-2025', 'DD-MON-YYYY')),1,1));



insert into Ticket values (
    TicketType('SAJB-240223-A5',(select ref(s) from Seat s where s.seatID = 'SAA5'),
    (select ref(o) from Orders o where o.orderID = ''),
    (select ref(e) from Event e where e.eventID = '128-JB-240223'),5000,0));
insert into Ticket values (
    TicketType('SAJB-240223-B127',(select ref(s) from Seat s where s.seatID = 'SAB127'),
    (select ref(o) from Orders o where o.orderID = '1254826'),
    (select ref(e) from Event e where e.eventID = '128-JB-240223'),2000,1));
insert into Ticket values (
    TicketType('SAJB-240223-B128',(select ref(s) from Seat s where s.seatID = 'SAB128'),
    (select ref(o) from Orders o where o.orderID = '12584626'),
    (select ref(e) from Event e where e.eventID = '128-JB-240223'),2000,1));
insert into Ticket values (
    TicketType('SAJB-240223-B129',(select ref(s) from Seat s where s.seatID = 'SAB129'),
    (select ref(o) from Orders o where o.orderID = '12585626'),
    (select ref(e) from Event e where e.eventID = '128-JB-240223'),2000,1));
insert into Ticket values (
    TicketType('BCAG-230212-D568',(select ref(s) from Seat s where s.seatID = 'BCD568'),
    (select ref(o) from Orders o where o.orderID = '12584676'),
    (select ref(e) from Event e where e.eventID = '96-AG-230212'),190,1));
insert into Ticket values (
    TicketType('BCAG-230212-D569',(select ref(s) from Seat s where s.seatID = 'BCD569'),
    (select ref(o) from Orders o where o.orderID = ''),
    (select ref(e) from Event e where e.eventID = '96-AG-230212'),190,0));
insert into Ticket values (
    TicketType('BCAG-230212-D570',(select ref(s) from Seat s where s.seatID = 'BCD570'),
    (select ref(o) from Orders o where o.orderID = '12684676'),
    (select ref(e) from Event e where e.eventID = '96-AG-230212'),190,1));
insert into Ticket values (
    TicketType('SAJB-240223-C287',(select ref(s) from Seat s where s.seatID = 'SAC287'),
    (select ref(o) from Orders o where o.orderID = '12784626'),
    (select ref(e) from Event e where e.eventID = '128-JB-240223'),520,1));
insert into Ticket values (
    TicketType('SAJB-240223-C288',(select ref(s) from Seat s where s.seatID = 'SAC288'),
    (select ref(o) from Orders o where o.orderID = '1254656'),
    (select ref(e) from Event e where e.eventID = '128-JB-240223'),520,1));
insert into Ticket values (
    TicketType('SALF-240208-C288',(select ref(s) from Seat s where s.seatID = 'SAC288'),
    (select ref(o) from Orders o where o.orderID = '1254756'),
    (select ref(e) from Event e where e.eventID = '196-LF-240208'),520,1));
insert into Ticket values (
    TicketType('SAJB-240223-C289',(select ref(s) from Seat s where s.seatID = 'SAC289'),
    (select ref(o) from Orders o where o.orderID = '12784126'),
    (select ref(e) from Event e where e.eventID = '128-JB-240223'),520,1));
insert into Ticket values (
    TicketType('SALF-240208-C289',(select ref(s) from Seat s where s.seatID = 'SAC289'),
    (select ref(o) from Orders o where o.orderID = '13784626'),
    (select ref(e) from Event e where e.eventID = '196-LF-240208'),520,1));




insert into Performer values (PerformerType('125-AG','Arina Grande'));
insert into Performer values (PerformerType('103-NM','Nike Minaj'));
insert into Performer values (PerformerType('98-JK','Jungkook'));
insert into Performer values (PerformerType('99-TH','Taehyung V'));
insert into Performer values (PerformerType('130-MC','Matthieu Chedid'));

insert into PerformerDetail values (
    PerformerDetailType('AG-AG-230212',(select ref(p) from Performer p where p.performerID = '125-AG'),
    (select ref(e) from Event e where e.eventID = '96-AG-230212'),'Time is 10:00 pm'));
insert into PerformerDetail values (
    PerformerDetailType('NM-AG-230212',(select ref(p) from Performer p where p.performerID = '103-NM'),
    (select ref(e) from Event e where e.eventID = '96-AG-230212'),'Time is 8:00 pm'));
insert into PerformerDetail values (
    PerformerDetailType('JK-JB-240223',(select ref(p) from Performer p where p.performerID = '98-JK'),
    (select ref(e) from Event e where e.eventID = '128-JB-240223'),'Time is 8:00 pm'));
insert into PerformerDetail values (
    PerformerDetailType('TH-JB-240223', (select ref(p) from Performer p where p.performerID = '99-TH'),
    (select ref(e) from Event e where e.eventID = '128-JB-240223'),'Time is 10:00 pm'));
insert into PerformerDetail values (
    PerformerDetailType('MC-LF-240208',(select ref(p) from Performer p where p.performerID = '130-MC'),
    (select ref(e) from Event e where e.eventID = '196-LF-240208'),'Time is 10:00 pm'));




insert into Review values (ReviewType('1',(select ref(c) from Customer c where c.userID = 'ahmad_rias'),(select ref(e) from Event e where e.eventID = '128-JB-240223'),'ahmad_rias','good..pretty much satisfied',3));
insert into Review values (ReviewType('5',(select ref(c) from Customer c where c.userID = 'ahmad_rias'),(select ref(e) from Event e where e.eventID = '196-LF-240208'),'ahmad_rias','very bad experience',0));
insert into Review values (ReviewType('6',(select ref(c) from Customer c where c.userID = 'akram_sis'),(select ref(e) from Event e where e.eventID = '196-LF-240208'),'akram_sis','horrible',0));
insert into Review values (ReviewType('2',(select ref(c) from Customer c where c.userID = 'akram_sis'),(select ref(e) from Event e where e.eventID = '128-JB-240223'),'akram_sis','not good',1));
insert into Review values (ReviewType('3',(select ref(c) from Customer c where c.userID = 'ros_bios'),(select ref(e) from Event e where e.eventID = '128-JB-240223'),'ros_bios','Really Good',5));
insert into Review values (ReviewType('4',(select ref(c) from Customer c where c.userID = 'ros_bios'),(select ref(e) from Event e where e.eventID = '96-AG-230212'),'ros_bios','Really Good',5));
