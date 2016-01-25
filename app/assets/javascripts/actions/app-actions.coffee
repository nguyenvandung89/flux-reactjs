define [
  "actions/constants"
  "dispatcher/app-dispatcher"
], (Constants, AppDispatcher)->
  "use strict"

  AppActions =
    removeArticle: (index)->
      AppDispatcher.handleViewAction(actionType: Constants.REMOVE_ARTICLE, index: index)

  AppActions
