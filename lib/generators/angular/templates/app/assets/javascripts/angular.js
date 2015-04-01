angular.module('<%= resource_class.to_s.pluralize %>', [])
  .service('<%= resource_class.to_s %>Service', function($http) {
    var service = {
      get: function(n, callback) {
        var callback = callback || function() {}
        var url = '/api/v1/<%= resource_name.pluralize %>/show/' + n;
        $http.get(url).success(callback);
      },
      list: function(callback) {
        var callback = callback || function() {}
        var url = '/api/v1/<%= resource_name.pluralize %>/';
        $http.get(url).success(callback);
      },
      put: function(params, callback) {
        var callback = callback || function() {}
        var url = "/api/v1/<%= resource_name.pluralize %>/set/";
        $http.post(url, params).success(callback);
      }
    };
    return service;
  })
  .directive('<%= resource_class.to_s.camelize(:lower) %>Form', function() {
    return {
      templateUrl: '/<%= resource_name.pluralize %>/form'
    }
  })
  .directive('<%= resource_class.to_s.camelize(:lower) %>List', function() {
    return {
      templateUrl: '/<%= resource_name.pluralize %>/list'
    }
  })
  .controller('<%= resource_class.to_s %>FormController', function($scope, <%= resource_class.to_s %>Service) {

  })
  .controller('<%= resource_class.to_s %>IndexController', function($scope, <%= resource_class.to_s %>Service) {
    <%= resource_class.to_s %>Service.list(function(data) {
      $scope.<%= resource_name.pluralize %> = data;
    });
  })
  .controller('<%= resource_class.to_s %>ShowController', function($scope, <%= resource_class.to_s %>Service) {

  });

higgidyApp.requires.push('<%= resource_class.to_s.pluralize %>');
