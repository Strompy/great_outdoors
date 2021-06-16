
# The Great Outdoors 🏔

The Great Outdoors is an API built to help you plan your next trip to one of America's national parks. Search for the park nearest to your town or destination city and get back the closest park with some handy information about the park, directions, and an image to give you a preview of what you will experience!

This API was built as a tech challenge. It consumes the [National Park Service](https://www.nps.gov/subjects/developer/api-documentation.htm#/) and [Pixabay](https://pixabay.com/api/docs/) APIs to return JSON API 1.0 compliant data. You can test endpoints locally by following the instructions [here](#getting-started) or visiting the deployed Heroku app [here](https://limitless-bayou-95524.herokuapp.com/api/v1/parks).

## Table of Contents

* [About](#about)
  * [Tech Stack](#tech-stack)
* [Getting Started](#getting-started)
  * [Installation](#installation)
  * [Testing](#testing)
* [Great Outdoors End Points](#great-outdoors-endpoints)

## About

Built to consume multiple APIs to return combined data. Consumes the following APIs:
- [National Park Service](https://www.nps.gov/subjects/developer/api-documentation.htm#/)
<!-- - [OpenWeather One Call](https://openweathermap.org/api/one-call-api) -->
- [Pixabay](https://pixabay.com/api/docs/)


### Tech Stack:

- Ruby: 2.5.3
- Rails: 5.2.6
- PostgreSQL: 12

***Testing framework***
- RSpec
- Simplecov
- Shoulda-matchers

## Getting Started

To run locally, use the following steps:

### Installation

1. Clone and open the repo
```
$ git clone git@github.com:Strompy/great_outdoors.git
$ cd great_outdoors
```
2. Install the Gems
```
$ bundle install
```
3. Setup your environment
```
$ rails db:create
$ rails db:migrate
```
4. Install Figaro
```
$ bundle exec figaro install
```
5. Grab your own key for each of the following APIs:
- [National Park Service](https://www.nps.gov/subjects/developer/api-documentation.htm#/)
<!-- - [OpenWeather One Call](https://openweathermap.org/api/one-call-api) -->
- [Pixabay](https://pixabay.com/api/docs/)

Store your keys in the `application.yml` created by figaro, found inside the `app/config` directory.

```
PARK_API_KEY: <YOUR NPS API KEY>
PIXABAY_API_KEY: <YOUR PIXABAY API KEY>
```

All the variables stored in this file can be accessed like so:

```
ENV['<VARIABLE_NAME>']
```

### Testing

To run the test suite from the root directory simply run rspec:

```
$ bundle exec rspec
```

Or run individual tests by including the file path at the end of the above command.

## Great Outdoors Endpoints

<!-- * [Search for a park](#get-a-park-for-a-specific-location) -->
<!-- * [Get all parks](#get-all-parks) -->



#### Get a park for a specific location:

```
GET /api/v1/parks?location=<location>
```

Example request:

```
GET /api/v1/parks?location=denver,co
```

Example response:

```
{
  "data": {
    "id": "1",
    "type": "park",
    "attributes": {
      "name": "Rocky Mountain National Park",
      "description": "Rocky Mountain National Park’s 415 square miles encompass and protect spectacular mountain environments. Enjoy Trail Ridge Road – which crests at over 12,000 feet including many overlooks to experience the subalpine and alpine worlds – along with over 300 miles of hiking trails, wildflowers, wildlife, starry nights, and fun times. In a world of superlatives, Rocky is on top!",
      "directions": "Driving from the east: from I-25, take US Hwy 34 or 36. Driving from the west: from I-70, take US Hwy 40 to Granby to US Hwy 34 to Grand Lake. From mid-October until late May, Trail Ridge Road between Estes Park and Grand Lake is closed to vehicles, so driving between the two takes ~4 hours. The closest airport is Denver International (DIA). There is no public transportation between nearby cities and the park.",
      "image_url": "https://pixabay.com/get/g6f48903e89e1856691ff6a6eaadee0467b7dc72f889a5afc47c1858088ff5be3e3c63326d52708db810c18e35cb95d473011dd389a6f8cd3414060b9722772f0_1280.jpg"
    }
  }
}
```


