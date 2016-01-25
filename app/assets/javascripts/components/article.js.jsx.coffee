# @cjsx React.DOM

{a, i, label, div, ul, li, input} = React.DOM

@Article = React.createClass
  getInitialState: ->
    article: @props.article

  render: ->
    div {className: 'ui attached segment'},
      div {className: "ui ten columns grid" },
        div {className: "left floated nine wide column" },
          div {className: 'ui big checkbox input'},
            input {
              onChange: @handle_change,
              type: 'checkbox',
              id: @state.article.id,
              title: @state.article.title,
              checked: (@state.article.checked ? 'checked' : '') }
            label {htmlFor: @state.article.id},
              @state.article.title
        div {className: "right floated column" },
          i {
            className: 'red remove circle large link icon',
            onClick: @delete_article }

  clean_object: (o) ->
    for key in ['id', 'created_at', 'updated_at']
      delete o[key]
    return o

  handle_change: (e) ->
    article = @state.article
    article.checked = e.target.checked
    $.ajax(
       url: "/articles/#{@state.article.id}.json"
       data: {article: @clean_object(article)}
       type: "PUT"
    ).done (article) =>
      @setState article: article

  delete_article: ->
    $.ajax(
       url: "/articles/#{@state.article.id}.json"
       type: "DELETE"
    ).done (article) =>
      @props.handle_delete()
