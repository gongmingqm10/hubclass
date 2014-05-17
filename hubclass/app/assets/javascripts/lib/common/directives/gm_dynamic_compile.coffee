angular.module('Hust:common').directive 'gmDynamicCompile', ['$compile', ($compile)->
  restrict: 'A'
  replace: 'true'
  link: (scope, element, attrs) ->
    scope.$watch attrs.gmDynamicCompile, (html) ->
      element.html(html)
      $compile(element.contents())(scope)
]