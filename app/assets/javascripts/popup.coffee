angular.module('popup', ['ngAnimate'])
  .controller 'popupCtrl', ($scope, $http)->

    $http.get('/tweets/latest.json')
      .success (data)->
        $scope.tweets = data
        fayeClient.subscribe '/tweets', (payload)->
          $scope.tweets.unshift(payload)
          $scope.$apply()
