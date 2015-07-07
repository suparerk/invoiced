Application.services_manifest = ->
  $('body.customers.index').trigger 'application:services:notification'
  # fill in your manifest here
  # example:
  # if you want to trigger a service on your entire app
  # $('body').trigger 'application:services:service_name'
  # 
  # If you want a more fine grained control for 
  # different pages you can add a class to your body 
  # in your views/layouts/application.html.erb
  # on your body tag you can do something like this
  #
  # <body class="[controller_name] [action_name]">
  #
  # You now have a more fine grained control in 
  # your manifest file
  # $('body.posts.show').trigger 'application:services:service_name'
  #
  # if you need to trigger the same services on multiple pages
  # $('body.posts.show,
  #    body.dashboard.show,
  #    body.photos.index').trigger 'application:services:service_name'
  # 

Application.run_ready = ->
  Application.services_manifest()

  window.add_fields = (link, association, content) ->
    new_id = (new Date).getTime()
    regexp = new RegExp('new_' + association, 'g')
    $(link).parents('table').find('tbody').append content.replace(regexp, new_id)
    return

$(document).ready (e) ->
  $('.search-panel .dropdown-menu').find('a').click (e) ->
    e.preventDefault()
    param = $(this).attr('href').replace('#', '')
    filter = $(this).text()
    $('.search-panel span#search_filter').text filter
    $('.input-group #search_method').val param
    return
  return

$(document).ready Application.run_ready
$(document).on 'page:load', Application.run_ready