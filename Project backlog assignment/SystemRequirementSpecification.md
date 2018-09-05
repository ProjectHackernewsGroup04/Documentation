_Large Systems Development_

# HackerNews

_Andreas Sorbye Styltsvig_ <br>
_Cherry Rose Semena_ <br>
_MahNaz Karimi_ <br>
_Diana Strele_ <br>
_2018_ <br>

## System Requirement Specification (SRS)

#### * Purpose
This document describes the functional and nonfunctional requirements of the HackerNews Project.
HackerNews is a web application, that allows registered users to post stories,
up-vote or down-vote each other stories as well as write comments on stories.


#### * Intended Audience
This document is intended to be used by members of other teams that will implement and verify
the correct functioning of the system. 

#### * Project Scope
* Clone the HackerNews webpage
[https://news.ycombinator.com/](https://news.ycombinator.com/)

#### * HackerNews Scope
HackerNews is a web application that list stories posted by registered users.
Users are able to post comments on stories posted by other users.
The users can up-vote or down-vote stories, the application will show the most
popular stories on top in descending order.

#### * Assignment Reference:
[Link to Assignment](https://github.com/datsoftlyngby/soft2018fall-lsd-teaching-material/blob/master/assignments/01-HN%20Clone%20Task%20Description.ipynb)



## I. Functional Requirements


### _Features_

####  User management
| Feature | Description | 
|---|---|
| Create user  |  The system shall request the users to enter username and password to create a new account |
| User login  |  The system shall request the user to enter username and password to login, and check if the entered credentials are valid |
| User log off  |  The system shall provide a button for the logged users to click, so the user can be logged out |


####  Stories (Registered and logged users)

| Feature | Description | 
|---|---|
| Post comment |  The system shall allow the users to post comments on a story, and publish the comment. |
| Edit comment |  The system shall allow the users to edit their own comments |
| Delete comment |  The system shall allow the users to delete their own comment |
| Upvote |  The system shall allow the users to up-vote a published story or a comment |
| Downvote |  The system shall allow the users to down-vote a published story or a comment only if the user have over 500 karma points |

####  Stories (Not Registered or logged users)
| Feature | Description | 
|---|---|
| Post comment |  The system shall not allow the users to post comments on a story |
| Post comment |  The system shall not allow the users to edit comments on a story |
| Delete comment |  The system shall not allow the users to delete comments |
| Up-vote |  The system shall not allow the users to up-vote a published story or a comment |
| Down-vote |  The system shall not allow the users to down-vote a published story or a comment |

####  Karma Voting System
| Feature | Description | 
|---|---|
| Comment/story get a up-vote  |  The system shall assign the up-vote to the registered author/user of the story or the comment, so that the total of karmapoint for the author gets added with the amount of up-votes for the comment or story |
| Comment/story get a down-vote  |  The system shall assign the down-vote to the registered author of the story or the comment, so that the total of karmapoint for the author gets subtracted with the amount of down-votes for the comment or story |

####  Story on the Storyboard (Registered and logged users)
| Feature | Description | 
|---|---|
| The user clicks on the headline of a story |  The system shall redirects the user to the stories URL page |
| The user clicks on the authorname/username  |  The system shall redirects the user to the author profile page |
| The user clicks on the comment  |  The system shall redirects the user to the comments section for the story |
| The user clicks on the hide for the story  |  The system shall hide/remove the story from the storyboard for the user |
| The user clicks on the up-vote icon for the story  |  The system shall assign the up-vote to the author |
| The user clicks on the up-vote text for the story  |  The system shall assign the up-vote to the author |
| The user clicks on the "up-vote" text for the story  |  The system shall remove the up-vote from the author |

####  Story on the Storyboard (Not Registered or logged users)
| Feature | Description | 
|---|---|
| The user clicks on the headline of a story |  The system shall redirects the user to the stories URL page |
| The user clicks on the authorname  |  The system shall redirects the user to the author profile page |
| The user clicks on the comment  |  The system shall redirects the user to the comments section for the story |
| The user clicks on the hide for the story  |  The system shall hide/remove the story from the storyboard for the user |
| The user clicks on the upvote icon for the story  |  The system shall redirects the user to create user page |
| up-vote button/text  |  The system shall make the text UNVISIBLE for users that is not logged |
| up-vote button/text |  The system shall make the text UNVISIBLE for users that is not logged |

####  Comments for a Single Story (Registered and logged users)
| Feature | Description | 
|---|---|
| The user post a empty comment |  The system shall ask the user to write something in the comment field |
| The user post a comment and click "add comment"  |  The system shall publish the comment |
| The user clicks on the comment  |  The system shall redirects the user to the comments section for the story |
| The user clicks on reply for a published comment  |  The system shall show a textfield, so the user can reply to the comment |
| The user clicks on add comment as reply for a published comment  | The system shall publish the comment below the comment the user clicked reply to |


## II. Non-functional Requirements

#### *    Usability
Interface of the system should be easy to understand and use. Login form should
be clear and simple to be able to use without instructions. The user goal of
using the system should be accomplished quickly and with few or no user errors.
The interface is easy to learn and navigate; buttons, headings, and help/error
messages are simple to understand

#### *    Reliability
In case of a system failure, an explanatory message should be displayed and within
24h the system should be up and running again.
Failure means the system must cancel the transaction, and must allow the user
to start over.

#### *    Performance
Systems responses to adding comment or story shall take no longer than 10 seconds to
load onto the screen after the user submits the query.

#### *    Supportability
No specifications for supportability of the system.

#### *    Interface
The system interface will permit complete navigation using the keyboard or mouse
alone, in addition to using mouse and keyboard combinations.
The system must be able to interface with any HTML browser.

## III. Constraints
?

## IV. Product Backlog
[Link to Product Backlog](https://trello.com/b/6B9ZQSJn/hackernews-backlog)

## V. Use-case Diagrams
