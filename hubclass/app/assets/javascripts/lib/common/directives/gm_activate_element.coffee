angular.module('Hust:common').directive 'gmActivateElement', ['$location', ($location)->
  restrict: 'A'
  link: (scope, element, attr) ->
    element.addClass('active') if $location.absUrl().indexOf(attr.gmActivateElement) != -1
]