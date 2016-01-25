###* @jsx React.DOM ###
define [
  "react-with-addons"
  "stores/app-store"
  "components/remove-from-article"
], (React, AppStore, RemoveFromArticle) ->
  "use strict"

  AppArticle = React.createClass(
    getInitialState: ->
      articles: AppStore.getArticle()

    _onChange: ->
      @setState(articles: AppStore.getArticle())

    componentWillMount: ->
      AppStore.addChangeListener(@_onChange)

    render: ->
      articles = _(@state.articles).map((article, index)->
        return (
          `<tr key={article.id}>
            <td><RemoveFromArticle index={index} /></td>
            <td>{article.title}</td>
            <td>{article.content}</td>
          </tr>`
        )
      )

      `<table className="table table-stripped">
        <thead>
          <tr>
            <th></th>
            <th>Title</th>
            <th>Content</th>
          </tr>
        </thead>
        <tbody>
          {articles}
        </tbody>
      </table>`
  )

  AppArticle

