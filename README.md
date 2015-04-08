# Diggable

<!-- [Heroku link][heroku] -->

<!-- [heroku]: http://flux-capacitr.herokuapp.com -->

## Minimum Viable Product
Diggable is a clone of Zillow built on Rails and Backbone. Users can:

- [x] Create accounts
- [x] Create sessions (log in)
- [ ] Create listings for homes to sell/rent
- [ ] View listings for homes to buy/rent
- [ ] Search for listings by location (address/zip/city)
- [ ] See search results on a map
- [ ] Save/star listings to view later
- [ ] View saved/starred listings
- [ ] Hide listings from search results
- [ ] Narrow search results for listings by price
- [ ] Narrow search results for listings by type

## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md


[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Listing Creation (~1 day)
I will implement user authentication in Rails based on the practices learned at App Academy.
By the end of this phase, users will be able to create a listing using a simple form in a Rails view.

[Details][phase-one]

### Phase 2: Viewing Listings (~1 day)

I will add API routes to serve listing data as JSON, then add Backbone models and collections that fetch data from those routes.
By the end of this phase, users will be able to create and view listings, all inside a single Backbone app.

[Details][phase-two]

### Phase 3: Adding Pictures to Listings (~1 day)
I plan to use Filepicker for file upload so users can add images to their listings. Then, I'll update my Backbone views to show them.

By the end of this phase, the ListingsIndex view will include a single image for each listing, and the ListingShow view the will include thumbnails (using a jQuery plugin) so that users can click through pictures of that listing.

[Details][phase-three]

### Phase 4: Adding Google Maps & Search by Location (~2 days)

I'll use Google Maps API to show pins (each representing on listing) on a map, and then add a search bar so that users can enter a location around which the map will be centered.

I'll update the listings collection to only include listings whose pins would fit within the map's bounds, and then sort them by their distance from the users search location.

I'll also make the pins clickable so when a user clicks on a pin, that listing's show page will appear.

[Details][phase-four]

### Phase 5: Filtering Listings (~2 days)
I'll add checkboxes to the search bar to allow users to filter listings by type (such as "condo for rent" and "house for sale").

I'll also add the ability to "star" or "hide" a listing by adding clickable icons to the ListingIndex and ListingShow views. "Starring" a listing will save it to the user's "Saved Listings", while "hiding" will remove the listing from the search results for that user.

[Details][phase-five]

### Bonus Features (TBD)
- [ ] Allow users to update listings they created
- [ ] Color-coded pins
- [ ] The ability to save searches
- [ ] Multiple sessions/session management
- [ ] User avatars
- [ ] Pagination/infinite scroll
- [ ] Notifications


[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
