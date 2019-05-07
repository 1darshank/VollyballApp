angular.module('AmrutcupVolleyball.controllers', []).
  controller('courtController', function($scope, scoreAPIservice) {
	 // $scope.data = null;
    $scope.courtsList = [];

    //scoreAPIservice.getCourts().success(function (response) {
    scoreAPIservice.getCourts().then(function (response) {
        //Dig into the responde to get the relevant data
        $scope.courtsList = response;
    });
  });

