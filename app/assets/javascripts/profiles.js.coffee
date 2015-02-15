angular.module('profile', ['ngAnimate'])

  .controller 'HomeCtrl', ($scope, $http)->
    $scope.currentPartial = 'default'

    $scope.displayPartial = (name)->
      $scope.currentPartial == name

    $scope.updateProfile = (newProfile)->
      $http.put("/profiles/0.json", {profile: newProfile})
        .success (data)->
          $scope.currentProfile = data
        .error (err)->
          console.log(err)
