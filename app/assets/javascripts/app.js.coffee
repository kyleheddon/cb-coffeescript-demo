$ ->
  $('button').on 'click', (event) ->
    event.preventDefault()
    find_jobs()


find_jobs = ->
  keywords = $('[name="keywords"]').val()
  location = $('[name="location"]').val()
  $('#info').text "searching for #{keywords} jobs #{if location then 'in' else ''} #{location}"

  run_search keywords, location, (results) ->
    display_results(results)

run_search = (keywords, location, callback) ->
  api = new CB.JobSearchApi()
  api.search keywords: keywords, location: location, (results) ->
    callback(results)

display_results = (results) ->
  results.append_jobs_to $('#jobs').html('')
  results.append_info_to $('#info').html('')
