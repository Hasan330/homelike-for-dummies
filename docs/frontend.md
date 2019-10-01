# Here's what you need to run Frontend

## Getting started

1. Install yarn and lerna globally if you don't have them yet

```
brew install yarn

yarn global add lerna
```

2. Clone the repo locally and then change into it

```
git clone https://github.com/homelike/frontend.git
cd frontend
```

3. Start by bootstraping the application. This will install all dependencies and then symlink all the monorepo ones.

```
lerna bootstrap
```

## Structure

To begin with the Monorepo is split into two parts `/packages` and then `/services`.

### `packages`

`packages` are shared utilities or libraries, that have to be 100% tested. They can include React Components, Schemas for Backend Data, Utility Functions, Shared Configurations etc.

Here is a list of all `packages`, both in and outside the monorepo:

| Name                       | Status          | Purpose                                                                                                               |
| -------------------------- | --------------- | --------------------------------------------------------------------------------------------------------------------- |
| `@homelike/shared`         | Included        | Utilities, `UpstreamCheck`, Configurations for Environments                                                           |
| `@homelike/configurations` | Included        | default `@babel`, `eslint`, `jest`, `prettier` config. Also default setup for `jest` unit-testing and mocks for data. |
| `@homelike/ui-kit`         | Included        | UI-Components and styling                                                                                             |
| `@homelike/forms`          | Not in Monorepo | `redux-form` Fields, as we are moving slowly away from redux-form, this will be eventually deprecated                 |

### `services`

`services` are separate parts of the applciation, that are deployed separately and have their on internal logic. They are distinguished by having their own `circle-ci` folders.

Here is a list of all `services`, both in and outside the monorepo:

| Name                        | Status   | Purpose                                                                                                                                  |
| --------------------------- | -------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `@homelike/dashboard`       | Included | Dashboard Application, Login, Apartment Creation, Apartment not found page, formerly [`client`](https://github.com/homelike/client) Repo |
| `@homelike/request-process` | Included | Request Process, Instant Booking, Soft Booking                                                                                           |
| `@homelike/search-page`     | Included | Initial Search Page, Apartment View Page                                                                                                 |
| `@homelike/galadriel`       | Included | Internal Administration Application for Homelike                                                                                         |

## Testing

To run all tests in the mono-repo, just execute:

```
lerna exec yarn test
```

or just change into one of the packages/services and execute the commands in the package json.

```
yarn test

or

yarn test:watch
```

## Running Dashboard

To run the dashboard this is what you need:

```
cd services/dashboard && yarn dev

This will run on localhost:3000
```

Now you need to clone some backend repos :

```
api
payments
emails
```

After cloning them, in each of their roots run:

```
yarn && yarn watch
```

## Running Galadriel

To run the Galadriel this is what you need:

```
cd services/galadriel && yarn dev

This will run on localhost:1234
```

Now you need to clone some backend repos :

```
api
galadriel-api
```

After cloning them, in each of their roots run:

```
yarn && yarn watch
```

## Running Search Page

To run the Search Page this is what you need:

```
cd services/search-page && yarn dev

This will run on localhost:3002
```
