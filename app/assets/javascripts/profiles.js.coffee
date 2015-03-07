angular.module('profile', ['ngAnimate'])

  .controller 'HomeCtrl', ($scope, $http)->
    $scope.currentPartial = 'default'

    $scope.displayPartial = (name)->
      $scope.currentPartial == name
    $scope.newtweet = {}

    $scope.updateProfile = (newProfile)->
      $http.put("/profiles/0.json", {profile: newProfile})
        .success (data)->
          $scope.currentProfile = data
        .error (err)->
          console.log(err)

    $scope.getMyTweets = ->
      $http.get('/tweets.json')
        .success (data)->
          $scope.tweets = data

    $scope.getMyTweets();

    $scope.addTweet = ->
      $http.post("/tweets.json", {tweet: $scope.newtweet})
        .success((data)->
          $scope.tweets.unshift(data);
          $scope.newtweet = {}
        )
         .error((err)->
          console.log(err);
        )
