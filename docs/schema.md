# Schema Information

(i) = indexed

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email           | string    | not null, unique (i)
password_digest | string    | not null
session_token   | string    | not null, unique (i)

## listings
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
seller_id   | integer   | not null, foreign key (references users) (i)
price       | integer   | not null (i)
available_at| datetime  | not null (i)
latitude    | string    | not null (i)
longitude   | string    | not null (i)
type        | string    | not null (i)
street_1    | string    | not null
street_2    | string    |
city        | string    | not null
state       | string    | not null
zip_code    | string    | not null
description | text      | not null

## stars
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
listing_id  | integer   | not null, foreign key (references listing) (i)
user_id     | integer   | not null, foreign key (references user) (i)

## hides
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
listing_id  | integer   | not null, foreign key (references listing) (i)
user_id     | integer   | not null, foreign key (references user) (i)

##images
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
listing_id  | integer   | not null, foreign key (references listings) (i)
title       | string    |
