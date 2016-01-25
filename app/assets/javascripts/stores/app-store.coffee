define [
  "jquery"
  "lodash"
  "dispatcher/app-dispatcher"
  "actions/constants"
  "eventemitter2"
], ($, _, AppDispatcher, Constants, EventEmitter)->
  "use strict"

  CHANGE_EVENT = "change"

  _articles = []

  _removeArticle = (index)->
    _articles.splice(index, 1)

  AppStore = $.extend(new EventEmitter(), {
    emitChange: -> @emit(CHANGE_EVENT)
    addChangeListener: (callback)-> @on(CHANGE_EVENT, callback)
    removeChangeListener: (callback)-> @removeListener(CHANGE_EVENT, callback)
    getArticle: -> _articles
    dispatcherIndex: AppDispatcher.register((payload)->
      action = payload.action

      switch action.actionType
        when Constants.REMOVE_ARTICLE then _removeArticle(action.index)

      AppStore.emitChange()
    )
  })
