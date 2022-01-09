SELECT ingredients.grams*foods.fat/100 as fat,
 ingredients.grams*foods.fibre/100 as fibre,
 ingredients.grams*foods.carbs/100 as carbs,
 ingredients.grams*foods.calories/100 as calories,
 ingredients.grams*foods.protein/100 as protein
FROM ingredients INNER JOIN foods on ingredients.food_id=foods.id
