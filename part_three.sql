xquery
let $c := doc('/public/grp20242/orderInfo.xml')
for $m in $c/OrderInfo/Order
where $m/TO_DATE = '2026-10-02'
return $m/OrderType/text()
/


xquery
let $e := doc('/public/grp20242/eventInfo.xml')
for $d in $e/Events/Event
where $d/DATE = '2024-02-23'
return $d/EVENTNAME/text()
/

xquery
let $reviews := doc('/public/grp20242/reviewInfo1.xml')
for $review in $reviews/ReviewInfo/Review
where $review/eventRef/PERFORMERNAME = 'Lost Frequencies'
return $review
/


xquery
let $c:=doc('/public/grp20242/reviewInfo.xml')
for $m in $c/ReviewInfo/Review
where $m/STARRATING < 3
return $m/eventRef/EVENTNAME/text()
/

xquery
let $c:=doc('/public/grp20242/reviewInfo.xml')
for $m in $c/ReviewInfo/Review
where $m/Customer/@ID = 'akram_sis'
return <review ID="{$m/@reviewID}"><eventName>{$m/eventRef/EVENTNAME/text()}</eventName><starRating>{$m/STARRATING/text()}</starRating></review> 
/

xquery
let $c:=doc('/public/grp20242/reviewInfo.xml')
for $m in $c/ReviewInfo/Review[eventRef/EVENTNAME = 'American Girl']
let $s :=doc('/public/grp20242/customer.xml')
for $d in $s/CustomerInfo/Customer
where $d/@ID = $m/Customer/@ID
return $d/PHONENUMBER/text()
/

xquery
let $v:=doc("/public/grp20242/VenuePerformers.xml")
for $p in $v/VenuePerformers/Venue/Performer
where $p/Showtime = 'Time is 8:00 pm'
return $p/PerformerName/text()
/

xquery
let $v:=doc("/public/grp20242/VenuePerformers.xml")
for $p in $v/VenuePerformers/Venue/Performer
where $p/@PerformerID = '98-JK'
return $p/PerformerName/text()
/

xquery
let $v:=doc("/public/grp20242/VenuePerformers.xml")
for $performeratt in $v/VenuePerformers/Venue/Performer[Showtime = 'Time is 8:00 pm']
let $e:=doc("/public/grp20242/EventInfoD.xml")
let $performerele := $performeratt/@PerformerID
for $event in $e/EventInfo/Event
where $event/Performer/PERFORMERID = $performerele
return $event/EVENTNAME/text()
/


xquery
let $v := doc("/public/grp20242/VenuePerformers.xml")
let $performeratt := $v/VenuePerformers/Venue/Performer[@PerformerID = '125-AG']
let $e := doc("/public/grp20242/EventInfoD.xml")
let $performerele := $performeratt/@PerformerID
for $event in $e/EventInfo/Event
where $event/Performer/PERFORMERID = $performerele
return $event/EVENTNAME/text()
/


xquery
let $eventName := 'American Girl'
let $e := doc("/public/grp20242/EventInfoD.xml")
for $event in $e//Event[EVENTNAME = $eventName]
where $event/Performer/PERFORMERNAME
return $event/Performer/PERFORMERNAME/text()
/

xquery
let $v := doc("/public/grp20242/customer.xml")
for $c in $v/CustomerInfo/Customer
where $c/PHONENUMBER = '4367924622'
 return ($c/CUSTOMERNAME/text())
/


let $venueName := 'Scotiabank Arena'
let $c := doc('/public/grp20242/VenuePerformers.xml')
for $venue in $c//Venue
where $venue/@VenueName = $venueName
return $venue/Performer/PerformerName/text()
/


xquery
let $venueName := 'Scotiabank Arena'
let $venue := doc('/public/grp20242/VenuePerformers.xml')//Venue[@VenueName = $venueName]
let $total := sum(
    for $performer in $venue/Performer
    let $performerName := $performer/PerformerName/text()
    let $events := doc('/public/grp20242/EventInfoD.xml')//Event
    where $events/Performer/PERFORMERNAME = $performerName
    return count($events)
)
return $total
/


xquery
let $r:=doc("/public/grp20242/reviewInfo.xml")
for $sr in $r/ReviewInfo/Review[STARRATING < 3]
let $c:=doc("/public/grp20242/customer.xml")
for $a in $c/CustomerInfo/Customer
where $a/@ID = $sr/Customer/@ID
return $a/PHONENUMBER/text()
/







