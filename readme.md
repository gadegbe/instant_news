# Wireframe & Specifications

## News page

News page is the home page of the page and will allow user to

- Search a specific terme in the news
- Sort the results if there are some by
    - relevancy
    - popularity
    - publishedAt
- Have a list of some news
    - If no query term was taped, the app load the top-headlines of the API
    - If the user scroll and reach the end of the table, the app launch an autoscroll mechanism to load more data

<img src="./images/news_page_wireframe.png" width="200"/>

When user click on a specific article the app open the article details

## Article details page

<img src="./images/article_details_wireframe.png" width="200"/>

# Project architecture & structure

<img src="./images/structure.png" width="200"/>

## Justification of some technical choice

- ### Don't use SwiftUI with MVVM

I would like to use SwiftUI because is modern of offer a more intuitive approach by introducing declarative programming,
but as a constraint of the specifications was to use MVVM, we can't use it.
Use SwiftUI with a view model is over-engineering as the data binding was already declared in the views and SwiftUI
takes the responsability to update the UI when a event is triggered, use of a view model or a controller is very useless
and don't bring any benefict.
Here is a thread on apple developper forum that discuss deeply about the
subject: [Stop using MVVM for SwiftUI](https://developer.apple.com/forums/thread/699003)

- ### Use of programmatically UI build without storyboard

Even if we loose the storyboard and the visual rendering of the ui code the UI programmatically help to have more
control on the responsiveness of the app.
It help too to reduce the merge conflict management when working with a team.
Here is the good article
of İrem
Karaoğlu: [Storyboard vs. programmatically for iOS app UI design](https://blog.logrocket.com/storyboard-vs-programmatically-ios-ui-design/)

# Screenshots

### Hot headline when the app opened and idle

<img src="./images/hot_headlines.png" width="200"/>

### Search for a specific term

<img src="./images/specific_article_search.png" width="200"/>

### Use the sort by modal

<img src="./images/sortby_modal.png" width="200"/>

### Search for a specific term and empty result

<img src="./images/empty_result.png" width="200"/>

### Open article details

<img src="./images/article_details.png" width="200"/>

### Share the opened article

<img src="./images/share_the_article.png" width="200"/>
