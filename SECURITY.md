# Security

> _Task:_

> _1. Define our assets_

> _2. Risk matrix of our HackerNews project_

> _3. As operators:_

>    _* Find vulnerability of the project we monitor_

>    _* Run OWTF_

>    _* Find the attack in logs_

-------------

### Assets

Even thou our system is not safety critical, failure can lead to data
loss, which is security critical. Assets are any data that supports
information. In our system the most valuable asset is login information
which is confidential and should be protected from alteration or theft.
For a user to be able to post or comment in our system, he or she needs
to register first. When creating an account, the username and password
is stored in database and encrypted to assure CIA (confidentiality,
integrity and availability).

### Risk Matrix

Risk matrix is part of risk assessment process and it increases risk
visibility.

|   |Insignificant   |Minor   |Moderate   |Major   |Severe   |
|---|---|---|---|---|---|
|Almost certain   |   |   |   |   |   |
|Likely   |   |   |   |   |   |
|Possible   |   |   |   |   |   |
|Unlikely   |   |   |   |   |   |
|Rare   |   |   |   |   |   |


### As operators
