---
---

((window, document, $) ->
  $menu = $('#navigation-menu')
  $menuToggle = $('#js-mobile-menu')
  $signUp = $('.sign-up')
  $searchAndSubmit = $('.search-and-submit')
  $searchResults = $('.search-results')
  __ =
    lunrIndex: null
    lunrData: {}
    loadPostData: loadPostData = ->
      $.ajax
        url: '/posts.json'
        dataType: 'json'
        success: (posts) ->
          __.createIndex()
          __.addToLunrIndex posts
          return

        failure: ->
          $('.search-bar').hide()
          return

      return

    addToLunrIndex: addToLunrIndex = (data) ->
      dataLength = data.length
      i = 0

      while i < dataLength
        item = data[i]
        __.lunrIndex.add item
        __.lunrData[item.id] = item
        i++
      return

    createIndex: createIndex = ->
      __.lunrIndex = lunr(->
        @field 'title',
          boost: 10

        @ref 'id'
        return
      )
      return

    displaySearchResults: displaySearchResults = (results) ->
      resultsLength = results.length
      i = 0
      html = document.createElement 'ul'

      while i < resultsLength
        result = results[i]
        item = __.lunrData[result.ref]
        node = document.createElement 'li'
        link = document.createElement 'a'

        link.href = item.url
        link.title = item.title
        link.appendChild document.createTextNode(item.title)

        node.appendChild link
        html.appendChild node

        i++

      if resultsLength is 0
        $searchResults.hide()
      else
        $searchResults.html html
        $searchResults.show()

      return

  $(document).ready ->
    $($menuToggle).click (e) ->
      e.preventDefault()
      $menu.slideToggle ->
        $menu.removeAttr 'style'  if $menu.is(':hidden')
        return

      return

    
    # underline under the active nav item
    $('.nav .nav-link').click ->
      $('.nav .nav-link').each ->
        $(this).removeClass 'active-nav-item'
        return

      $(this).addClass 'active-nav-item'
      $('.nav .more').removeClass 'active-nav-item'
      return

    $('input', $searchAndSubmit).keydown ->
      $this = $('input', $searchAndSubmit)
      __.displaySearchResults __.lunrIndex.search($this.val())
      return

    __.loadPostData()
    return

  return
) window, document, jQuery