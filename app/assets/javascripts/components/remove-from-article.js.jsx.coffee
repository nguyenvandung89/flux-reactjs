###* @jsx React.DOM ###
define [
  "react-with-addons"
  "actions/app-actions"
], (React, AppActions) ->
  "use strict"

  removeFromArticle = React.createClass(
    handleClick: (e) ->
      AppActions.removeArticle @props.index

    render: ->
      `<button onClick={this.handleClick}>-</button>`
  )

  removeFromArticle
