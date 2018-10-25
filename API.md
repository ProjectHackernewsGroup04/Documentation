### Hackernews API
> _Since this project is a clone version of [Hackernews-Ycombinator](https://news.ycombinator.com/), we have decided to use the same API design and data structure._

REFERENCE: https://github.com/HackerNews/API

---
##### User
User is required to be logged before performing actions such as viewing the whole story with comments, add/delete story, add comment, and/or making a reply to a certain comment. The user has also the ability to register himself.

Field | Description
------|------------
username | The user's unique username. Case-sensitive. Required.
password | hashed value of the plain-text password
delay | Delay in minutes between a comment's creation and its visibility to other users.
created | Creation date of the user, in [Unix Time](http://en.wikipedia.org/wiki/Unix_time).
karma | The user's karma.
about | The user's optional self-description. HTML.
submitted | List of the user's stories, polls and comments.

FEATURES | FRONTEND | BACKEND | METHOD
-------|----------|-------- | ------------
Register User | `/register` | `/api/register` | POST
Login | `/login` | `/api/login` | POST
Logout | `/logout` | `/api/logout` | GET

_Sample request body:_
```
{
  "username": "TestUser",
  "password": "test"
}
```
##### Item

_The item can either be a story or a comment. based on its property `type`._

Field | Description
------|------------
id | The item's unique id.
deleted | `true` if the item is deleted.
type | The type of item. One of "job", "story", "comment", "poll", or "pollopt".
by | The username of the item's author.
time | Creation date of the item, in [Unix Time](http://en.wikipedia.org/wiki/Unix_time).
text | The comment, story or poll text. HTML.
dead | `true` if the item is dead.
parent | The comment's parent: either another comment or the relevant story.
poll | The pollopt's associated poll.
kids | The ids of the item's comments, in ranked display order.
url | The URL of the story.
score | The story's score, or the votes for a pollopt.
title | The title of the story, poll or job.
parts | A list of related pollopts, in display order.
descendants | In the case of stories or polls, the total comment count.

FEATURES | FRONTEND | BACKEND | METHOD
-------|----------|----------- | ---------------
Add story | `/submit` | `/api/submit` | POST
Delete story | `/delete/:id` | `/api/delete/<string:id>` | POST/DELETE
Add comment | `/comment` | `/api/comment` | POST
Get stories | `/newest` | `/api/item/all` | GET
Get item | `/item/:id` | `/api/item/<string:id>` | GET
Add reply | `/reply/:storyid/:id` | - | GET
Confirm Delete | `/delete-confirm/:id` | - | GET

--to be continued...
