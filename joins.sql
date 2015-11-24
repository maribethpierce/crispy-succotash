# YOUR SQL CODE GOES HERE
#for which collars can we identify an owner?
SELECT dog_owners.name, dog_owners.dog_name, lost_dog_collars.dog_name, lost_dog_collars.id
FROM dog_owners JOIN lost_dog_collars ON dog_owners.dog_name = lost_dog_collars.dog_name;
#For which collars is there no known owner?
SELECT lost_dog_collars.dog_name AS dog FROM lost_dog_collars WHERE NOT EXISTS (
  SELECT lost_dog_collars.dog_name, dog_owners.dog_name
  FROM  dog_owners
  WHERE lost_dog_collars.dog_name = dog_owners.dog_name
);
#collars with owners
SELECT lost_dog_collars.dog_name, dog_owners.name
  FROM dog_owners
  FULL OUTER JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name)
  WHERE lost_dog_collars.dog_name IS NOT NULL;

# All owners who have collars in lost and found
SELECT dog_owners.name
  FROM dog_owners
  INNER JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name);
