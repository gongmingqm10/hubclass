angular.module('Hust:common').directive 'gmActivateElement', ['$location', ($location)->
  restrict: 'A'
  link: (scope, element, attrs) ->
    element.addClass('active')  if $location.absUrl().indexOf(attrs.gmActivateElement) != -1
]