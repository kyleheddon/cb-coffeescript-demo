class CB.JobSearchApi
  search: (options = {keywords: '', location: ''}, callback) ->
    $.get '/jobs', options, (response) ->
      response.info.keywords = options.keywords if options.keywords
      callback new CB.JobSearchResults(response.jobs, response.info)