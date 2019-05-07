angular.module('AmrutcupVolleyball.services', []).
  factory('scoreAPIservice', function($http) {

    var scoreAPI = {};

    scoreAPI.getCourts = function() {
      return $http({
        method: 'GET', 
        url: 'http://test-api.amrutcup.org/spglobal-reference-api-template-1.0.0/volleyball-app/games?_s=(courtNo==4,courtNo==5);status==A'
      }).then(function(response){
	        return response.data;
      },function (error){
    	    console.log(error, 'can not get data.');
    	});
    }
    return scoreAPI;
  });

/*myApp.service('dataService', function($http) {
	   this.getData = function() {
	      return $http({
	          method: 'GET',
	          url: 'https://www.example.com/api/v1/page',
	          params: 'limit=10, sort_by=created:desc',
	          headers: {'Authorization': 'Token token=xxxxYYYYZzzz'}
	      }).success(function(data){
	        return data;
	      }).error(function(){
	         alert("error");
	         return null ;
	      });
	   }
	 }); */