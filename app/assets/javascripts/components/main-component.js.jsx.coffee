###* @jsx React.DOM ###
define [
  "react-with-addons"
  "components/app-article"
], (React, AppArticle) ->
  "use strict"

  MainComponent = React.createClass(
    render: ->
      `<div className="container-fluid">
        <div className="row">
          <div className="col-xs-12">
            <AppArticle />
          </div>
        </div>
      </div>`
  )

  MainComponent

