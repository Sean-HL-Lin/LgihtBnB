SELECT reservations.*, properties.*, avg(rating) 
FROM properties 
  JOIN property_reviews ON (properties.id = property_reviews.property_id)
  JOIN reservations ON (property_reviews.reservation_id = reservations.id)
    WHERE reservations.guest_id = 1
      AND reservations.end_date < now()::date
    GROUP BY properties.id, reservations.id
    ORDER BY start_date
    limit 10;