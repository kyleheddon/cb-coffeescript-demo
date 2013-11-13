class CB.JobView
  constructor: (@job) ->
    @element = $('<div/>')
    description = $('<div/>').html(@job.description).text()
    @element.append "<p>#{description}</p>"

  append_description_to: (container) ->
    @element.hide()
    container.append @element
    container.data 'job_view', @
    @element.slideDown()
