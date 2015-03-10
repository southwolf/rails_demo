angular.module('profile', ['ngAnimate'])

  .controller 'HomeCtrl', ($scope, $http, $timeout)->
    $scope.currentPartial = 'default'

    # since currentProfile is init after HomeCtrl, so use $timeout to setup faye_client

    $timeout ->
      console.log $scope.currentUser
      fayeClient.subscribe $scope.currentUser.channel, (payload)->
        console.log payload
        $scope.tweets.unshift(payload)
        $scope.$apply()

    $scope.displayPartial = (name)->
      $scope.currentPartial == name
    $scope.newtweet = {}

    $scope.updateProfile = (newProfile)->
      $http.put("/profiles/0.json", {profile: newProfile})
        .success (data)->
          $scope.currentUser = data
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

  .controller 'OtherUserHomeCtrl', ($scope, $http)->
    pid = angular.element('.profile').attr('data-pid')
    $http.get("/profiles/#{pid}.json")
      .success (data)->
        $scope.otherUserProfile = data

    $scope.follow = ->
      $http.post("/follow_users.json", {follow_user: {following_id: $scope.otherUserProfile.user_id}})
        .success (data)->
          $scope.otherUserProfile.if_current_user_follow = !$scope.otherUserProfile.if_current_user_follow
        .error (err)->
          console.log err

    $scope.unfollow = ->
      params = {follow_user: {following_id: $scope.otherUserProfile.user_id}}
      $http.delete("/follow_users/0.json", {data: params, headers: {'Content-Type': 'application/json'}})
        .success (data)->
          $scope.otherUserProfile.if_current_user_follow = !$scope.otherUserProfile.if_current_user_follow
        .error (err)->
          console.log err
