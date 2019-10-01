# This is the backend overview

## Api

Homelike general purpose api

### About

This project uses [Feathers](http://feathersjs.com). An open source web framework for building modern real-time applications.

### Getting Started

Getting up and running is as easy as 1, 2, 3.

1. Make sure you have [NodeJS](https://nodejs.org/) and [npm](https://www.npmjs.com/) installed.

#### Note: Recommended Node version is `8.X`, as running with newer versions of Node could cause issues with `bcrypt` library. You can use [nvm](https://github.com/creationix/nvm/#installation) for switching Node verions

2. Install your dependencies

   ```
   cd path/to/api; npm install
   ```

3. Start your app

   ```
   npm start
   ```

   Alternatively to start in watch mode:

   ```
   npm run watch
   ```

### Testing

Simply run `npm test` and all your tests in the `test/` directory will be run.

## Payments

```
Documentation missing
```

## Galatriel Api

> Galadriel api

### About

This project uses [Feathers](http://feathersjs.com). An open source web framework for building modern real-time applications.

### Getting Started

Getting up and running is as easy as 1, 2, 3.

1. Make sure you have [NodeJS](https://nodejs.org/) and [npm](https://www.npmjs.com/) installed.
2. Install your dependencies

   ```
   cd path/to/galadriel; npm install
   ```

3. Start your app

   ```
   npm start
   ```

### Testing

Simply run `npm test` and all your tests in the `test/` directory will be run.

### Scaffolding

Feathers has a powerful command line interface. Here are a few things it can do:

```
$ npm install -g @feathersjs/cli          # Install Feathers CLI

$ feathers generate service               # Generate a new Service
$ feathers generate hook                  # Generate a new Hook
$ feathers help                           # Show all commands
```

### Clients Service

We have created a clients service for feathers and it will be responsible to call all the endpoints via client services e.g emails, api & payments. This service contains two files 1. clients.service.js, 2. clients.class.js example

```
const params = buildClientsParams('api/example/example',context.feathers);
return await context.app.service('clients').get(args._id,params);

const params = buildClientsParams('api/example/example',context.feathers);
return await context.app.service('clients').find({query:formatQuery(args), ...params });

```

This class will be strictly mapped with Feathers CRUD methods so if you are going to implement patch method, then should implement patch method inside clients.class.js since it is generic/abstract level class so keep it generic which can be easily extended to every new micro-service endpoints.

Note: There are some places where we are calling direct client apis I would prefer try to use this service so that Feathers eco-system should know every action inside our application so that we can more benefit from framework.

### Galadriel Role Model

How it works please read it here [Role Model](https://github.com/homelike/galadriel-api/wiki/Role-Model)

#### Release Candidate

1. User invitation
2. Activate user
3. Reset password
4. Create Role
5. Assign feature to specific role
6. Create/Update feature
7. Access permission layers based on GraphQL resolvers + service endpoints
8. Log data during user login (cache) — but at the moment disable it so I am retrieving data from cache but once it will finalised I will enable cache data.
9. Emails integration has been done - Only tested with local by looking at DB records
10. Access hooks implement with Feathersjs client
11. Also client feather service has been implemented in order to call any API - but at the moment I have disable it and I am using it via feather client app.
12. Detach user search for Galadriel from its codebase and implemented into API codebase, now it will be internal user find call to API from Galadriel
13. FeatherJS core authentication implemented by extended Verifier class
14. JWT custom strategy implemented by overriding passport/feather verifier for JWT
15. Auth JWT Strategy/Restrict Access Strategy implemented with before hook for the services
16. Google login strategy implemented with custom Google login Verifier
17. Get all the features which are assigned to users

#### Known issues

1. Few things are known such I have used directly mongoose model in order to get advantage of ‘\$addToSet’ property since at the moment feather 3.x.x version doesn’t supports it
2. There is a ‘/graladriel/users/xx’ has been used need to be restrict only 2 level only to avoid complexities

### Help

For more information on all the things you can do with Feathers visit [docs.feathersjs.com](http://docs.feathersjs.com).

## Emails

```
Documentation missing
```

## MongoDB

### 1. Install Locally

> (As of today we are using version 3.6.11 on produciton)

```shell
  $ brew update && brew install mongodb
```

### 2. Get the latest Database dump from production

> We do regular backups for our production databases, so you can get the latest on from there

```
shell
#### this command will show all the backups

$ aws s3 ls s3://homelike-backup/mongo/


#output
..
...
...
...
2019-08-23 14:17:15 3497964933 homelike-2019.08.23-12:03:11.tgz
2019-08-23 20:19:50 3498604811 homelike-2019.08.23-18:05:52.tgz
2019-08-24 02:17:54 3495308273 homelike-2019.08.24-00:03:49.tgz
2019-08-24 08:18:06 3499942457 homelike-2019.08.24-06:04:00.tgz
2019-08-24 14:17:16 3505874323 homelike-2019.08.24-12:03:08.tgz
2019-08-24 20:17:23 3512573546 homelike-2019.08.24-18:03:19.tgz
2019-08-25 02:18:04 3501805969 homelike-2019.08.25-00:03:51.tgz
2019-08-25 08:17:27 3501680834 homelike-2019.08.25-06:03:22.tgz
2019-08-25 14:16:56 3497671139 homelike-2019.08.25-12:03:12.tgz
2019-08-25 20:17:24 3493212639 homelike-2019.08.25-18:03:25.tgz
2019-08-26 02:17:54 3505933474 homelike-2019.08.26-00:03:49.tgz
2019-08-26 08:20:41 3506132471 homelike-2019.08.26-06:06:44.tgz
2019-08-26 14:17:54 3511000527 homelike-2019.08.26-12:03:50.tgz
2019-08-26 20:18:12 3511163634 homelike-2019.08.26-18:03:51.tgz
2019-08-27 02:17:28 3517759943 homelike-2019.08.27-00:03:19.tgz
2019-08-27 08:17:34 3504283769 homelike-2019.08.27-06:03:28.tgz
2019-08-27 14:17:28 3513068741 homelike-2019.08.27-12:03:23.tgz
```

> this will download the tar file

```
shell
  $ aws s3 cp s3://homelike-backup/mongo/homelike-2019.08.27-12:03:23.tgz .
> Unpack the tar
```

shell
\$ tar xf homelike-2019.08.27-12:03:23.tgz

> You have `homelike/dump` folder created with all the database dump of `homelike`, `payments`, `emails` and other databases from production
> Restore all of them using `mongorestore` command

```

shell
$ mongorestore --drop --db homelike dump/homelike
 $ mongorestore --drop --db payments dump/payments
\$ mongorestore --drop --db galadriel dump/galadriel

```

### 3. Connect to Remote MongoDB instance

> We use [MongoDB Compass](https://www.mongodb.com/download-center/compass), a GUI tool to connect to remote Database. Download and Install it.

> Provide your Public SSH key to System Admin and they will allow you the connection to connect through `SSH Authentication` or you can have `username/password` authentication

#### Produciton

> use SSH Tunnel with following configurations

```

shell
host: ec2-54-93-232-39.eu-central-1.compute.amazonaws.com
port: 22
username: ubuntu
SSH IDENTITY FILE: <PATH TO YOUR PRIVATE KEY FILE></PATH>

```

#### Staging

> You can get username/password from Sys Admin

## Pricing

This repository contains the pricing construction method for homelike requests. It accepts the major inputs of a request and produces a days array and months array, as well as totals for the important fields.

#### Usage

```javascript
const Pricing = require("@homelike/pricing");
const request = new Pricing();

// Set up a basic request
request
  .start(new Date("2016-01-01"))
  .end(new Date("2017-01-01"))
  .base(1000)
  .seasonal([1000, 1000, 5000, 1000])
  .landlordFee(0.9);

// Get months array
const months = request.months();

// Get totals
const amount = request.total("amount");
const landlordFee = request.total("landlordFee");
```

## Search Page

Search Service queries apartments in a certain city (based on lat and lng values)

### Compulsory params for a Search Query:

Minimum params for a query to work --> `lat`, `lng`

Example:

```
{
  search(lat: 50.937531, lng: 6.960278600000038) {
    total
    items {
      apartments {
        _id
        address {
          localityEn
          postalCode
          countryShort
        }
      }
      totalApartments
    }
  }
}
```

### Mechanism:

Search creates a geo-polygon and returns apartments within that area, usually this is done using the `north`, `east`, `south`, `west` values sent to us by the FE. However, if they are not sent we fallback and create our own bounds using `lat` and `lng` values.

### Alternative Apartments:

If less than 6 apartments are found, we do an alternative apartments query which:

1. Increase map bounds
2. Searches for one day before startDate and one day after endDate
3. Searching for more lenient price filters +-50

### Schema:

You can find out more about Search schema using `graphiql`

## Search Page error handling

We currently use an error handler to mask errors in a format that can be easily parsed by the FE

### Usage:

1.  Define error tranlation inside `error-codes.json`
2.  import the error handler from utils
3.  throw new error following the error format

```
throw new errors.BadRequest({
      name: 'DRAFT_REQUEST_EXISTS',
      message: DRAFT_REQUEST_EXISTS,
      info: {
        existingRequest: get(data[0], '_id'),
        type: kebabCase(get(data[0], 'bookingType')),
      },
    });
```

### Format:

error-handler expects an object with three fields:

1.  name: Name of the error
2.  message: Error key from error-codes.json
3.  info: Any aditional info for that error, should always be an Object (optional)
