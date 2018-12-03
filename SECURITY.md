# Security

### 1. Assets

Even thou our system is not safety critical, failure can lead to data
loss, which is security critical. Assets are any data that supports
information. In our system the most valuable asset is login information
which is confidential and should be protected from alteration or theft.
For a user to be able to post or comment in our system, he or she needs
to register first. When creating an account, the username and password
is stored in database and encrypted to assure CIA (confidentiality,
integrity and availability).

### 2. Risk Matrix

Risk matrix is part of risk assessment process and it increases risk
visibility.

_Scenario:_ alteration of login information

|   |Insignificant   |Minor   |Moderate   |Major   |Severe   |
|---|---|---|---|---|---|
|Almost certain   |   |   |   |   |   |
|Likely   |   |   |   |   |   |
|Possible   |   |   |   |   |   |
|Unlikely   |   |   |   |   |   |
|Rare   |   |   |   |X   |   |

> Risk is low

_Scenario:_ theft of login information

|   |Insignificant   |Minor   |Moderate   |Major   |Severe   |
|---|---|---|---|---|---|
|Almost certain   |   |   |   |   |   |
|Likely   |   |   |   |X   |   |
|Possible   |   |   |   |   |   |
|Unlikely   |   |   |   |   |   |
|Rare   |   |   |   |   |   |

> Risk is high

_Scenario:_ loss of assets

|   |Insignificant   |Minor   |Moderate   |Major   |Severe   |
|---|---|---|---|---|---|
|Almost certain   |   |   |   |   |   |
|Likely   |   |   |   |   |   |
|Possible   |   |   |   |   |   |
|Unlikely   |   |   |   |X   |   |
|Rare   |   |   |   |   |   |

> Risk is medium

### 3. As operators

*We are having issue with installation of OWTF*
>    _3.1 Find vulnerability of the project we monitor_

>    _3.2 Run OWTF_

>    _3.3 Find the attack in logs_
