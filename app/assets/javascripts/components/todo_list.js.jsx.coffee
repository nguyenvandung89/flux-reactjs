# @cjsx React.DOM
{button,i, div, ul, li, input, form} = React.DOM

@TodoList = React.createClass
  getInitialState: ->
    console.log("vandung")
    articles: @props.articles
    search: ''

  render: ->
    console.log(@state)
    articles = @state.articles
    search_string = @state.search.trim().toLowerCase()

    if search_string.length > 0
      articles = articles.filter (article) ->
        article.title.trim().toLowerCase().match(search_string)

    div {},
      div {className: "ui top attached segment"},
        div {className: "ui icon fluid input"},
          input {
            onChange: @handle_search
            value: @state.search
            id: 'search'
            placeholder: 'Search...' }
          i {className: 'search icon'}
      console.log(articles)
      if articles.length > 0
        for article in articles
          Article
            article: article
            key: article.id
            handle_delete: @handle_delete
      else
        div {className: 'ui attached segment'},
          "Nothing..."
      div {className: "ui botoom attached segment"},
        form { onSubmit: @handle_submit},
          div {className: "ui action fluid input"},
            input {
              type: 'text'
              title: 'article[title]'
              placeholder: 'Task...'
              id: 'article_title' }
            div {
              className: 'ui teal left labeled button',
              onClick: @handle_submit},
              'Add'

  handle_submit: (e) ->
    e.preventDefault()
    title = $('#article_title').val()
    if title.length > 0
      $.ajax(
         url: "/articles.json"
         data: {article: {title: title, checked: false}}
         type: "POST"
      ).done (article) =>
        $('#article_title').val('')
        @setState articles: (@state.articles.concat [article])

  handle_search: (e) ->
    @setState search: e.target.value

  handle_delete: ->
    $.ajax(
       url: "/articles.json"
       type: "GET"
    ).done (articles) =>
      @setState articles: articles
