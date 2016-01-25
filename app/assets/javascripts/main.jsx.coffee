###* @jsx React.DOM ###
require [
  "jquery"
  "react-with-addons"
  "components/main-component"
  "director"
  "superagent"
  "lodash"
  "bootstrap"
], ($, React, MainComponent) ->
  "use strict"
  window.React = React

  $(document).ready ->
    articleElement = document.getElementById("list-articles")

    routes =
      "/": ->
        React.renderComponent `<MainComponent />`, articleElement
        return

    routerHandler = new Router(routes)
    routerHandler.init "/"
    return

  return
