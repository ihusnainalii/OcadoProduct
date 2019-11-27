
# Ocado-challenge


This is the project to the Ocado Technology challenge described below.

[![Build Status](https://travis-ci.org/lucascorrea/OcadoProduct.svg?branch=master)](https://travis-ci.org/lucascorrea/OcadoProduct.svg?branch=master)
	[![codecov](https://codecov.io/gh/lucascorrea/OcadoProduct/branch/master/graph/badge.svg)](https://codecov.io/gh/lucascorrea/OcadoProduct)
<a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-5-orange.svg?style=flat"></a>

## Demo
![Ocado Demo](http://www.lucascorrea.com/images/ocado.gif)

## Running:

`CMD + u` will run all test cases

## Build:

- Xcode version  11.2.1
- Design pattern MVVM
- iOS Deployment target iOS 11.0 - 13.2
- Swift 5

## Ocado Technology - iOS Code Challenge

##### Ocado Technology Challenge

We want to have an application that has 2 screens.

The first screen consists of a list of products. The list should display a header with the cluster name as well as the products it contains. We expect to display at least the title, image, and price of each product.

Once you click on a given product of the list you will be redirected to another screen with more specific information.

The second screen will display more detailed information about a given product. We expect at least to show title, image, description and allergy information of the product.

Find below the information regarding our endpoints:

-   *Base Endpoint:*
	- "https://raw.githubusercontent.com/ocadotechnology/mobile-challenge/master"

-   *Product list:*
	-   GET “/product/all.json”
  ```
  {
  "clusters": [
    {
      "tag": "Fresh > Fruit > Bananas",
      "items": [
        {
          "id": 309396011,
          "price": "1.45",
          "title": "Ocado Organic Fairtrade Bananas",
          "size": "6 per pack",
          "imageUrl": "https://mobile.ocado.com/webservices/catalogue/items/item/309396011/images/image/0/240x240.jpg"
        },
        {
          "id": 227255011,
          "price": "4.45",
          "title": "Ocado Fairtrade Ripen at Home Bananas",
          "size": "5 per pack",
          "imageUrl": "https://mobile.ocado.com/webservices/catalogue/items/item/227255011/images/image/0/240x240.jpg"
        }
      ]
    },
    {
      "tag": "Fresh > Salads & Herbs > Cucumber",
      "items": [
        {
          "id": 240875011,
          "price": "0.64",
          "title": "Ocado Cucumber",
          "size": "1 per pack",
          "imageUrl": "https://mobile.ocado.com/webservices/catalogue/items/item/240875011/images/image/0/240x240.jpg"
        }
      ]
    }
  ]
}
```

-   Product detail:
	-   GET “/product/{product_id}.json”
```
{
  "id": 240875011,
  "price": "0.64",
  "title": "Ocado cucumber",
  "imageUrl": "https://mobile.ocado.com/webservices/catalogue/items/item/240875011/images/image/0/360x360.jpg",
  "description": "Clean crisp and juicy in a salad or sandwich, even better with a dip or just on its own as a great tasting snack.",
  "allergyInformation": "No allergies"
}
```
# Things we value:

1.  Code organisation and architecture.
2.  UI is not our main interest but feel free to impress us with your skills!
3.  The use of third-party libraries is encouraged if you consider them useful.
4.  Tests are highly valued.


### Extra features that I did

- Integration with Travis CI
- Unit tests
- I added Ocado logo and colors in the design
- Integration with SonarQube
