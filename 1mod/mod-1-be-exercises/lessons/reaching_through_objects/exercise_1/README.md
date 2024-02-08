# Exericse 1 - Adlington Road

## Instructions
On "Adlington Road", there are many buildings with apartments for rent. You are the owner of these apartment buildings. You need a way to manage your apartments, schedule maintenance and upkeep, and charge rent. But, to start with, we need to be able to see where all the rooms are.

Following the instructions below, use Test-Driven Development to create an object-oriented solution to the problem described. Use classes for `Room`, `Apartment`, `Building`, and `Street`.


### Room

1. A `Room` has a `name` (e.g. `"bathroom"`) and a way to read that data.
```
  bathroom = Room.new("bathroom")
  # => #<Room:0x000... @name="bathroom">

  bathroom.name
  # => "bathroom"
```


### Apartment

1. An `Apartment` can state whether or not it is currently `rented`, by the behavior called `is_rented?`. To do this, the `Apartment` should respond to the behavior `rent`.
```
  apartment = Apartment.new
  # => #<Apartment:0x000... @rented=false>

  apartment.is_rented?
  # => false

  apartment.rent

  apartment.is_rented?
  # => true
```

1. An `Apartment` can have up to 4 `Room`s, and can list those `Room`s by name, alphabetically.
  ```
  apartment = Apartment.new
  # => #<Apartment:0x000... @rented=false>

  bathroom = Room.new("bathroom")

  apartment.add_room(bathroom)
  apartment.add_room(Room.new("laundry"))
  apartment.add_room(Room.new("kitchen"))
  apartment.add_room(Room.new("bedroom"))

  apartment.rooms
  # => [#<Room:0x0.. @name="bathroom">, #<Room:0x0.. @name="laundry">, #<Room:0x0.. @name="kitchen">, #<Room:0x0.. @name="bedroom">]

  apartment.list_rooms_by_name_alphabetically
  # => ["bathroom", "bedroom", "kitchen", "laundry"]
  ```


### Building

1. A `Building` has a `building_number` (e.g. `"623"`) and a `building_name` (e.g. `"Savills Apartment Building"`), and a way to read that data.

1. A `Building` can have up to 4 `Apartments`, and should be able to list those Apartments.
Example:
```
  bldg = Building.new("623", "Savills Apartment Building")
  # => #<Buliding:0x000... @building_number="623", @building_name="Savills Apartment Building">

  apt_1 = Apartment.new
  apt_2 = Apartment.new
  apt_5 = Apartment.new

  bldg.add_apartment(apt_1)
  bldg.add_apartment(apt_2)
  bldg.add_apartment(apt_5)

  bldg.list_apartments
  # => [apt_1, apt_2, apt_5]
```


### Street
1. A `Street` can have a name (e.g. "Adlington Road") and a way to read that data.

  ```
  adlington = Street.new("Adlington Road")

  ```

1. A `Street` should be able to add your owned  `Buildings` on this street, and should be able to read that data.

  ```
  adlington.add_building(bldg)

  ```

1. A `Street` should be able to list, alphabetically by name, the buildings you own on this street.
Example:
  ```
  zebra = Building.new("123", "Zebra Apartments")
  # => #<Building:0x000... building_number="123", @building_name="Zebra Apartments">

  adlington.add_building(zebra)

  adlington.buildings
  # => ["Savills Apartment Building", "Zebra Apartments"]
  ```

1. A `Street` must be able to state the number of `Apartments` that are not currently `rented`.
Example:
  ```
  adlington.number_of_available_apartments
  # => 3
  ```

  #### Note!
  For this method, think about the following:
  - What object already has access to an `Apartment`?
    Is that object available in `Street`?
  - What is the _shortest, most efficient_ way to get the data you need?
  - Pseudocode out your approach in your `spec` file first, in comments, before writing any tests or code. Revisit your pseudocode when you get stuck.


5.  The `Street` should also be able to list the names of the `Buildings` that have available (non-rented) `Apartments`, and the names of the `Rooms` in each available `Apartment`.
Example:
```
adlington.list_available_apartments
# =>
{
  "Zebra Apartments" => ["bedroom", "laundry"]
  "Savills Apartment Building" => ["bathroom", "bedroom", "kitchen", "laundry"]
  "Savills Apartment Building" => ["bathroom", "bedroom", "laundry"]
}
```

-------

* A stretch goal for you might be - your `Street` should be able to print a _newspaper advertisement_ for each available apartment. You should use the `list_available_apartments` method to achieve this functionality.
It should read something like:

```
Zebra Apartments has 1 available apartment!
This apartment has 2 rooms including bedroom and laundry.
```

```
Savills Apartment Building has 2 available apartments!
Apartment 1 has bathroom, bedroom, kitchen, and laundry.
Apartment 2 has bathroom, bedroom, and laundry.
```