# LSD Final report

---

**Course**: Large System Development (LSD)

**Authors**: Andreas Sørbye Styltsvig, Cherry Rose Jimenez Semeña, Mahnaz Karimi, Diana Strele, Mikkel Ziemer Jensen

**Date**: 21/12/2018

---

## Introduction 

This is our final report for the HackerNews project in Large System Development (LSD) course.
The course have focus on how to establish a development and production environments with
continuous integration (CI) and continuous delivery (CD). The scope of the project
Hackernews is to implement a functional clone of the social news website
!https://news.ycombinator.com/.

Under the developing phase, we have given other additional requirements to the project. We — as
a developers team have to be flexible and prepared for the further requirements and eventually
implement new features or make changes to the system. In the production phase of the project,
we are assigned for a new role as operators. This means that we will be both — developing our system
and at the same time, we will also be operating other group’s system. The developers and operators
will make a System Level Agreement (SLA) that contains requirements to service level of the
system. The operators will monitor the system and keep track if the system fulfill the SLA
agreement, and eventually notify the developers when they detect any bugs, errors or
breakdowns.

## Resources

**Monitoring**
* Grafana : http://46.101.43.21:3001/

**The application**
* Frontend : http://46.101.43.21:3000/
* Backend: http://46.101.43.21:5000/
* Helge_api: http://46.101.43.21:5001/

**Logging**
* Kibana : http://46.101.43.21:5601/


## 1. Requirements, Architecture, Design and Process

### 1.1 System Requirements

Before starting the development of HackerNews project, specific requirements had been given to
us on what this system should be able to do. As described earlier, the HackerNews project for
LSD course was inspired from the actual Hackernews site.
From the given requirements, we elicited user stories and prioritize tasks. This also gave us
easy time to define functional and nonfunctional requirements for our system to meet. In
functional requirements, we listed descriptions of user tasks that the system needs to support.

Our Hackernews clone must meet these functional requirements:
* Displays a set of stories on system's front page.
* Displays a set of comments on stories.
* Stories or comments are posted by users, which have to be registered and logged into
the system.
* Users login to the system via a separate page.
* Users are identified by a user name and a password.
* New users can register to the system, via a separate page.

Non-functional requirements, or properties of our system includes an easy to use and
understand interface of the system. In case of system failure, transaction is canceled, allowing
the user to start over. Systems responses to adding comment or story shall take no longer than
3 seconds to load onto the screen after the user submits the query. Lastly, the system is able to
interface with any HTML browser.

### 1.2. Development Process

As we were closing in on how we wanted to structure our software (more on that in the next section of Software Architecture) we also decided on how the process itself should be. First of all, we decided to use Git for version control, Trello as our task management board form use stories, Github issues for issue tracking and CircleCI for our CI/CD chain.

Initially, we thought of using Gitflow workflow<sup>1</sup> , but since it requires quite extensive tracking and release managing, we decided to go for more simpler — Feature Branch workflow<sup>2</sup>. It is relatively simple in terms of developer coordination, development, testing and deployment. The process went something like this: 

In each sprint, user stories was prioritized and split up into lesser tasks. When a developer decided to do a task, they created an issue on Github, attached that issue to the task in Trello and created a new branch for that task. When they were done developing, they made a pull request on Github, asking someone else to review their code. If the code was “LGTM” (looks good to me) and all tests passed, it would get merged to the master branch. This would start the deployment task in CircleCI to deploy the newest version on Digital Ocean.

![](https://i.gyazo.com/c601cd5ab05ee834cce1238e6cb9bf7a.png)
```
HackerNews Deployment Sequence diagram
```
We used the Trello board as a Kanban board, but mixed in the sprints from SCRUM, to make sure that we actually had some control and overview of what gets done. Our biggest issue with using SCRUM was the task overflow, meaning that a lot of tasks got pushed to the next sprint, resulting in a larger workload in the end of the project.

### 1.3. Software Architecture


The frontend is built in NodeJS that uses Express for routing and Handlebars as its templating engine. The backend is built in Python with the Flask framework acting as the web services with REST API. For the database we use MongoDB. Grafana dashboard and Prometheus for monitoring the system and RabbitMQ for caching requests. Also, we used Docker Swarm for scaling the system and Vagrant or virtual machine (VM) for virtual environment to develop in.

The following table shows our Software components, their properties and communication between components.

| Software components | Tool/framework | Communication link |
| ------ | ------ |------ |
| Frontend  | JavaScript, Express engin | Node.js (Communicat with Bza<sackend) With these API adress:   `[/register]` `|`  `[/login]` `|` `[/logout]` `|`   `[/submit] ` `[/delete/:id]` `|`  `[/comment]` `|`  `[/newest]` `|`  `[/item/:id]` `|`  `[/reply/:storyid/:id]`  `|` `[/delete-confirm/:id]`|
| Backend  | Python with Flask | RestAPI servies (Communicat with Database) With these API adress: `[/api/login [POST]]` `|` `[/api/register[POST]]` `[/api/logout[GET]]` `[/api/submit[POST]]` `[/api/edit/<string:id>[PUT]]` `[/api/item/all[GET]]` `[/api/item/pagination/[GET]]` `[/api/item/<string:id> ['DELETE']]` `[/api/comment[POST]]`|
| RabbitMQ producer | Hosted server locally pip- python | Pika-  AMQP|
| RabbitMQ Consummer | Hosted server locally pip- python| Pika - AMQP|
|Helge API | Python with Flask|RestAPI servies (Communicat with Database) [ `[/latest[GET]]` `|` `[/staus[GET]]` |
| Moitoring | Prometheus | Node-exporter `/metrics[GET]`|
| Monitoring visualization | Grafana dashboard  | Prompetheus and Node-exporter `/metrics[GET]`|
| ELK STACK | Eleasticssearch, Logstash and Kibana | Logstash TCP |
|Digital Ocean as our cloud provider|CircleCI for deployment which was configured individually in every repository|Ubuntu Server|

![](https://i.gyazo.com/3644998674ecb9268364c8cf87cf11f9.png)
```
Overview of the System Architecture
```


![](https://i.gyazo.com/845841393a7d1ff96a2bf63b5eb51495.png)
```
HackerNews initial System Architecture Diagram
```

### 1.4. Software Design

After we got our project, we investigated how we could implement the project and what programming language and tools we could use to meet the success criterias. We have a SRS (Software Requirement Specification) document, that list all functional and nonfunctional requirements, and now we will start designing our HackerNews clone. Before we can start the design, we have to investigate and analyse HackerNews website to get all information about data model, API documentation and how they designed their system.

We are aiming that our project should look similar in design and functionality as HackerNews

![](https://i.gyazo.com/a93e9410a09cad37cee7af2717ba354e.png)
```
The original HackerNews Interface
```
We looked after original Hackernews repository on git: https://github.com/HackerNews/API to get inspiration from their model. The API documentation gives us a good overview of the data model, api paths, data type. We modelled our data scheme that follows the API documentation.

![](https://i.gyazo.com/aa71540af5fde69953a121270a6d23a2.png)
```
HackerNews Items  Data model
```

Based on the API documentation, HackerNews interacts data with backend using Json objects, so we choose to follow the approach and do the same thing for our system. After investigation and analysis, we concluded that we have following concerns that we have to
resolve and agree on for implementation of the HackerNews Clone.

* Nice and clean data structure?
  * Nested object issue
  * Frontend should only do a single query to get all data
  * Frontend should only do a single query to show all comments for a story
* Which DBMS might be the best choice?
  * Performance
    * Lot of inserting queries
    * Not many selecting queries
    * Cross reference between stories and comments and users (Indexing)
    * Lot of data updates
    * Approximate scale of data is in millions of objects
  * Datamodel
     * NoSQL
       * Inserting object  (Easy)
       * Get all objects  (Easy)
       * Updating nested object  (Complex)
       * Redundancy of data ( Problem )
     * SQL
        * Inserting object (Complex)
        * Get all objects ( Expensive joins )
        * Updating nested objects  (Easy)
        * Redundancy of data ( No problem )

We have discussed which data model and structure might be the best choice for our use case, and we agreed that we will not use  **SQL** approach for this use case since we are working with JSON in frontend, and we are interested in inserting and getting data in Json scheme. If we are going for **SQL**, it means that we have to perform join operations each time we get data, and convert the data to JSON scheme before we forward the data to frontend. And with scaling in mind, NoSQL is easier to scale due to their  **horizontal scaling** approach versus **SQL’s vertical scaling approach.** And we have been working with  **MongoDB** in previous projects, and we love the document-oriented data model, where we can just insert comments in a story — it means we can insert all comments within a story, so we can just do a query to fetch everything inside a single story with nested comments, it is smart!

First, we came up with a data model sketch that there are two objects:  **`items`** and  **`users`** . Users can create an account and create a story and comments. Comments is our story's properties, but we encountered a problem. How could comments stand under another comment under the relevant story, our solution was to make a nested object.

![](https://i.gyazo.com/8bffcdbd08302d1e26a5fbd339a49c4a.png)
```
The tables in database
```
The above picture tells that user can have many items, both stories and items. This relation represents a story having comments and a comment having replies/comments.

### 1.5. Software Implementation 

For our implementation we followed the requirements quite closely. Many of us wasn’t that
experienced in the Flask framework, so we haven’t been able to follow the PEP8 style guide to
the point where we can even say that we followed it.
For the software design, we started off with only two projects in mind, the frontend and the
backend, but ended up with far more, and an architecture even closer to a micro service
architecture than we initially expected. The reason for that was, that we quickly found out, that
by doing this, we could easily scale individual services later. Because we already thought of this
early on, we were actually able to replace CloudAMQP<sup>3</sup> with our own hosted RabbitMQ server
easily. When we used CloudAMQP, we chose to use their webhook service, so we didn’t have
to pull for the data, since we didn’t want our software to have that responsibility as well. Later,
when we replaced CloudAMQP, we had to make our own webhook service or integrate
RabbitMQ in our backend project. We chose to develop a webhook service, so we separated
the responsibilities of the applications.
Initially we thought we had to have only one API. One that worked for both the frontend and for
Helge to query. After finding out this was not necessary, we decided to split up that
responsibility. Helge got his own API to post requests to, and the frontend got its own backend.

## 2. Maintenance and SLA Status

### 2.1. Hand-over

In general, the hand-over process was alright. The documentation we received were very
extensive, to the point where we actually gave up on understanding it. This wasn’t due to it
being badly written, but more because it was impossible to prioritize this, if we still wanted to
develop and maintain our own system.
The quality of the documentation was quite good, but could at times be confusing, as you would
need to have a bit of knowledge about Kubernetes and how that worked, this extended the
learning curve and gave time pressure to our group.

In addition, they actually have provided more than what we have expected to get as operators.
We also received a complete project report that includes the technologies and decision-makings
that they have made for choosing it, their challenges during the development process though
quite empty page, and so on. After the survey that they did for UFO, they also revised the
documentation based on our comments.

![](https://i.gyazo.com/c290daf0d693e968354d5e95ee0d594e.png)
Basis for the revised documentation: https://github.com/BingoBois/UFO-Assignment


### 2.2. Service-Level Agreement

We conducted a meeting for the Service-Level Agreement(SLA) with the group that we are operating (Group E) and with the group that operates our system (Group C). We have agreed upon this SLA:

![](https://i.gyazo.com/347dc033e5214cf233f6cdb46ac7059c.png)
```
SLA AGREEMENT NOTE
```
This how we implemented the Prometheus metrics based on the SLA in our Hackernews project
which could possibly be the same as what Group E's metrics, since we couldn't verify it — it
doesn't exist anymore due to some issues they had for the last assignment in Scaling:


_- Uptime_
```
up{group="production",instance="backend:5000",job="backend"}
up{group="production",instance="frontend:3000",job="frontend"}
up{group="production",instance="http-api:5001",job="helge-api"}
up{instance="localhost:9323",job="docker"}`
up{instance="node-exporter:9100",job="node-exporter"}`
up{instance="localhost:9090",job="prometheus"}
```
_- Data Loss (based on number of posts and lost posts)_
Posts Added:
```
http_requests_total{endpoint="/post",group="production",instance="http-api:5001",job="helge-ap
i",method="POST",status_code="200"}
```
Lost Posts:
```
http_requests_total{endpoint="/post",group="production",instance="http-api:5001",job="helge-ap
i",method="POST",status_code="400"}
```
- Load Time to Landing Page in MS (newest-stories overview)
```
load_time{group="production",instance="frontend:3000",job="frontend",method="GET",path="/n
ewest,/newest/:max",statusCode="200"}
```

**Our Grafana Dashboard:**

![](https://i.gyazo.com/f918a72bca33716e304f607419df06c8.png)

**Group E Grafana Dashboard:**

![](https://i.gyazo.com/22e3d7ec48b0f7a41a1289a48f080002.png)

### 2.3. Maintenance and Reliability

At first, we have had a great setup and communication held on discord, and rely on their
documentation in google docs. We have gotten more or less no issue with their Hackernews
project, and the main reason is that they have been using Kubernetes since day 1 in production.
Kubernetes<sup>4</sup> makes their system incredibly crash-proof and it even gave them difficulties in
making the system crash for the assignment in Logging. The application has been scaled
beforehand.

![](https://i.gyazo.com/aeb9208e79fc13f0005c3155f5160e33.png)

So they ended up with the idea that the only way they could crash the system is to shutdown MySQL server, which is just a fine approach.

![](https://i.gyazo.com/d9ea11940883ca3e6c9bccfc8d7efbfd.png)

**_The only issue we've posted_**

Group E's Hackernews application has incredibly handled system crash and implemented error handling within their program, but it didn't escape the fact that it has been so slow in inserting new data.

![](https://i.gyazo.com/7cc38e7f0331735a10ad667b7f7d0d14.png)

It has been so consistently slow in data insertion, which
makes them stay at the bottom of the latest graph. See
here: ​http://46.101.225.71/chart.svg

**_Group E's Findings:_**

![](https://i.gyazo.com/f017741c579ec4c0773a1d2cee699843.png)

All in all, group E have been so helpful and approachable when it comes to their project. They
even attended the meeting that we've asked for making the agreement, and kept us posted
when dealing with the system crash for logging. The Grafana dashboard has been so useful as
well, not just for us, being the operators, but also for us being the developers — as we have
seen most of the problems in our system more than we have seen in the group we are
operating.

## 3. Discussion

### 3.1. Technical Discussion

On the technical part of the project, we think we were given some great tools to maintain and
expand our project over the duration of the semester. All tools were useful and made sense to
implement, but were sometimes presented in a very specific way, with the assumption that
every group had deployed and/or developed their project in a specific way.

The actual operation was by far the hardest part about this project. Everytime a new service like
Grafana, Prometheus, etc. was attached, new issues appeared. First of all, before deploying all
the new services, our application was already dockerized and had a self contained CI/CD chain.
This meant, that we could quickly bring broken services up again. After a while we ended up
deploying all of our services as a Docker Service, to make sure to meet the uptime SLA. When
deployed as a docker service, the container is automatically started up again if it shuts down
unexpectedly.

We let Grafana monitor the services and one of our first incidents were an out of memory error
that we got every time we tried to start up Grafana. The container was simple killed by the 
kernel, and therefore, we got no errors in the container itself. We had to trace the error back
through the kernel log, to find out Grafana was killed after a brief delay, because we ran out of
memory. Increasing the memory on the server resolved the issue.

The most difficult error to track down, that gave us a lot of downtime, was a follow up on the
above mentioned issue. Everytime we started up Grafana, our front-end application loaded
infinitely. After a while we got a reply that the request timed out. No errors logged, and the
application still running. After several hours of debugging we finally noticed a duplicate port
binding on port 3000. Grafana started up on 3000 as well as our frontend. After changing the port
binding for Grafana to 3001 the issue was resolved.

Third, we have an ongoing issue with RabbitMQ not being able to allocate memory. This is
actually an Erlang error, that isn’t quite resolved yet<sup>5</sup>. There are various suggestions to limit the
maximum memory usage of the RabbitMQ container, to prevent this error from appearing. We
are yet to confirm that this is a fix though.

We haven’t received any feedback from the OPS group whatsoever. Actually, it was either
ourselves or Helge that found out we had a service outage.

In the end, our system has not been that reliable considering the effort we put into our
architecture. Not that many of us were that experienced in Python and how to prevent crashes
in a nice and meaningful way, so we ended up with a lot of debugging and huge tracelogs.
We’ve had quite a bit of downtime, but have also been very good to react on it, as soon as we
discovered it.

The usual case for us, when presented with a new tool, like Grafana, Prometheus etc. was to
backtrack everything, dissect the entire session and begin from scratch reading up on
documentation. Our choice of architecture and technologies left us with some challenges for
these changes, mostly on the deployment and maintenance side. The idea of monitoring
someone else's system was fine, but the execution was poor and lackluster. While we
continuously had assignments in four topics, plus debugging our own systems and helping
someone else, was almost impossible to juggle. Every group used different software for
orchestration and deployment, so we besides that, we had to learn even more frameworks and
tools in the short time period we had.


### 3.2. Group work reflection & Lessons learned

Our group work has been quite diverse. Some things worked really well, and others didn’t. In the
beginning we had a lot of issues communicating. The architecture of the software was not
clearly communicated in the start, which resulted in a lot of unusable code and projects we had
to restructure. After a while, we picked up on the communication part, and the development
started to flow, tasks on our Trello board got closed pretty fast, and we quickly had a minimum
viable Hacker News clone up and running.


What worked really well in our group was the diversion of our skills. Some were really good in
developing the Python code, others really good at devops and again some really good in
making diagrams and writing requirements.
We used various roles for our project: scrum master, product owner, devops, project manager
and developers. This did not work well for us, since everything had to be rather fast. The
overhead of managing those roles in a project with such short span was almost impossible for
us, and actually halted our speed. Because of these roles, our meetings were often too long,
and thus, we had a lot of wasted time.

This course and project has provided us with strategies, tools and great experience on solving
problems in complex system design. We investigated the characteristics of a good software
system development, and considered what a development process would need to include to
build such software. It also provided us with experience on continuous development and
deployment, which is a great tool to have in our toolbox once entering the real world. We
definitely extended our knowledge on maintenance and having a role of monitoring others
systems. To conclude, there must be a disciplined approach to software development,
especially in the case of large projects as such.


***
##### References:
<sup>1</sup> https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow

<sup>2</sup> https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow

<sup>3</sup> https://www.cloudamqp.com/

<sup>4</sup> ​https://en.wikipedia.org/wiki/Kubernetes

<sup>5</sup> ​https://github.com/rabbitmq/rabbitmq-server/issues/

