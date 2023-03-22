## User Stories

 
User Story 1, Parent Index [ ] done

For each parent table
As a visitor
When I visit '/parents'
Then I see the name of each parent record in the system

User Story 2, Parent Show [ ] done

As a visitor
When I visit '/parents/:id'
Then I see the parent with that id including the parent's attributes
(data from each column that is on the parent table)

User Story 3, Child Index [ ] done

As a visitor
When I visit '/child_table_name'
Then I see each Child in the system including the Child's attributes
(data from each column that is on the child table)

User Story 4, Child Show [ ] done

As a visitor
When I visit '/child_table_name/:id'
Then I see the child with that id including the child's attributes
(data from each column that is on the child table)

User Story 5, Parent Children Index [ ] done

As a visitor
When I visit '/parents/:parent_id/child_table_name'
Then I see each Child that is associated with that Parent with each Child's attributes
(data from each column that is on the child table)