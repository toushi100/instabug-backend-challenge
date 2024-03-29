<div align="center">
  <a href="#">
  	<img src="https://dka575ofm4ao0.cloudfront.net/pages-transactional_logos/retina/295039/instabug-logo_%281%29.png" alt="Logo project" height="160" />
  </a>
  <br>
  <br>
  <p>
    <b>instabug</b>
  </p>
  <p>
     <i>This project is amazing, you should write some lines about it.</i>
  </p>
  <p>

  </p>
</div>

---

**Content**

- [Features](##features)
- [Prerequisites](##prerequisites)
- [Install](##install)
- [Technologies](##technologies)
- [Documentation](##documentation)
- [Database Schema](##database)
- [Maintainers](##maintainers)

## Features ✨

- Create chats
- Send messages
- Search through past messages

## Prerequisites

Please make sure the followings are installed

- Docker
- Docker compose

## Install 🐙

- Clone the repo
  `git clone https://github.com/toushi100/instabug-backend-challenge.git`
- cd into the repo
  `cd instabug-backend-challenge`
- run the project by
  `docker-compose up`

## Technologies 💻

- Ruby on Rails
- Sidekiq
- MySQL
- Redis
- Elasticsearch

## Documentation 📄

- Here is the list of the RESTful APIs
- Default base URL
  `http://localhost:3000`
- <a href="https://documenter.getpostman.com/view/26241747/2sA35G32BF">
   Postman Documentation Link
  </a>

* Application:

  - Index
    `GET /v1/applications`
  - Create
    `POST /v1/applications`
  - Update
    `PUT /v1/applications/:token`
  - Show
    `GET /v1/applications/:token`

* Chats:

  - Index
    ` GET /v1/applications/:token/chats`
  - Create
    ` POST /v1/applications/:token/chats`
  - Show
    `GET /v1/applications/:token/chats/:number`

* Messages:

  - Index
    `GET /v1/applications/:token/chats/:number/messages`
  - Create
    `POST /v1/applications/:token/chats/:number/messages`
  - Destroy
    `DELETE /v1/applications/:token/chats/:number/messages/:message_number`
  - Search
    `GET /v1/applications/:token/chats/:number/messages/search?q={batata}`

## Database Schema 💾

- The database consists of there tables
  - Applications
  - Chats
  - Messages
    <div align="center">
  <a href="#">
  	<img src="https://imgur.com/a/QgzNC17" alt="Logo project" height="160" />
  </a>
  </div>

## Maintainers 👷

<table>
  <tr>
    <td align="center"><a href="https://github.com/toushi100"><img src="https://avatars.githubusercontent.com/u/31364671?s=400&u=ac285821e5ee8225a651ec80177b8dacca4c2763&v=4" width="100px;" alt="Tostee Lucas"/><br /><sub><b>Ahmed Salah</b></sub></a><br /><a href="#" title="Code">💻</a></td>
  </tr>
</table>
