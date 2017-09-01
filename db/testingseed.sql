\c projectesting2

INSERT INTO food (name, img_url, review) VALUES
  (
    'Brownie Crisps',
    'https://www.traderjoes.com/images/fearless-flyer/uploads/article-2475/55092-brownie-crisp-TJ.jpg',
    'A little too sweet'
    ),
  (
    'Hazelnut Creamer',
    'http://media.fooducate.com/products/images/180x180/4D6506E6-31B4-FFCC-4CBE-89744237BCBF.jpg',
    'delicious!'
    ),
  (
    'Chickenless Strips',
    'https://www.traderjoes.com/images/fearless-flyer/uploads/article-2811/92235-chickenless-strips.jpg',
    'Tastes like chicken!'
  ),
  (
    'Guatemalan Dark Roast Coffee',
    'https://designassets.traderjoes.com/Uploads/dig-in-guatemalan.jpg',
    'A little too bitter'
  ),
  (
    'Rice Cauliflower',
    'https://i.pinimg.com/236x/50/aa/eb/50aaeb19feecb99d7f6c5ec47db4736b--fort-lauderdale-cilantro-lime-rice.jpg',
    'Doesnt taste like rice but a good and fullfilling substitute'
    ),
  ('Almond Flour',
  'https://www.traderjoes.com/images/fearless-flyer/uploads/article-3151/56254-blanched-almond-flour.jpg',
  'Cheap and great for paleo baking'
  ),
  ('Pork Belly',
    'https://www.traderjoes.com/images/fearless-flyer/uploads/article-1540/51460-fully-cooked-pork-belly.png',
    'So good!'
  );

  INSERT INTO diet (diet_name) VALUES
    ('Organic'),
    ('Paleo'),
    ('Gluten Free'),
    ('Vegan'),
    ('Keto'),
    ('GMO');


  INSERT INTO cross_reference (
    food_id,
    diet_id
  )
  VALUES
  (1, 3),
  (2, 2),
  (2, 4),
  (3, 4),
  (4, 1),
  (5, 2),
  (5, 4),
  (6, 5),
  (6, 2),
  (6, 4),
  (7, 5);


