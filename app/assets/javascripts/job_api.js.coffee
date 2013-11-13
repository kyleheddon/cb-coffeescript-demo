class CB.JobApi
  find_job_by_did: (did, callback) ->
    $.get "/jobs/#{did}", (job_data) ->
      callback job_data
