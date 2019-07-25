SELECT properties.*, AVG(rating) 
FROM  properties 
  JOIN property_reviews 
    ON (properties.id = property_reviews.property_id)
      WHERE rating >= 4
      GROUP BY properties.id
        ORDER BY cost_per_night ASC
        limit 10;