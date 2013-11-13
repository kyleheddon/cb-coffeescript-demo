class CB.JobSearchResults
  constructor: (@jobs, @info) ->

  append_jobs_to: (container) ->
    for job in @jobs
      job_view = new CB.JobResultView(job)
      job_view.append_to container

  append_info_to: (container) ->
    keywords = if @info.keywords then @info.keywords else ''
    info_text = "#{@info.total_count} #{keywords} jobs found"
    info_text += " in #{@info.city}" if @info.city
    info_text += " #{@info.state_code}" if @info.state_code

    container.append info_text
