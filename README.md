# manageFilter
Adding and deleting a Filter to an Interactive Grid. 
This Plugin can be used a starting point to build more a better user experience for the Interactive Grid.
The value to filter on should be stored in a Page Item on Page 0, so it can be accessed from each and every page.
You have to add code yourself to actually set and unset that Page Item value.

Now with the following comparison operators:

* Equal to
* Not Equal to 
* Null
* Not Null
* Like
* Not Like
* In - Includes additional attribute so you can specify the separator between multiple values
* Not In
* Contains
* Not Contains
* Greater than
* Greater than or equal to
* Less than
* Less than or equal to
* In the last (time period), e.g. order_date in the last 2 months
* Not in the last (time period), e.g. shipped_date NOT in the last 2 months
