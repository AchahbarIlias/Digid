# Back-End API for DigId mobile app

## Local Setup

### Prerequisites:
- Node.js (v10+) installed on the host machine
- npm package manager installed and enabled

### Running the application
1. Clone git repository
2. Install dependencies using `npm install`
3. In the root directory create a file `.env` and set values to the following variables:
```shell
API_PATH_ROOT=/api
PORT=8080
CONNECTION_STRING=<your mongo db connection string>
JWT_SECRET=<your jwt secret key>
```
4. Launch the service with `npm start`

## seed
To create an initial user information seed run command `npm run seed`.

This will create several users:
### Citizens
 - Username: user1, Password: password1
 - Username: user2, Password: password2
 - Username: user3, Password: password3
### Officials
 - Username: official1, Password: officialpw1
 - Username: official2, Password: officialpw2

## Prettier
Before committing consider running prettier to format edited files: `npm run format`

## Bonus
- Run a MongoDb instance on docker: `docker run --name digid-mongo -p 27017:27017 -d mongo:4.4`
- Use the following software for tunneling:
  - http://localtunnel.me/
  - https://ngrok.com/
  - http://localhost.run/
- Additional documentation for libraries used in the project:
  - [routing-controllers](https://github.com/typestack/routing-controllers)
  - [mongoose](https://mongoosejs.com/docs/)
  - [class-validator](https://github.com/typestack/class-validator)