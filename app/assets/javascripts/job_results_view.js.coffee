class CB.JobResultView
  constructor: (@job) ->
    @element = $('<li/>')
    @element.append "<b>#{@job.title}</b> "
    @element.append @job.location
    @element.data 'view', @
    @element.on 'click', show_description

  append_to: (container) ->
    @element.hide()
    container.append @element
    @element.show 200

  show_description =  ->
    self = get_self(@)
    self.element.off 'click'
    find_job self.job.did, (job_view) ->
      job_view.append_description_to self.element
      self.element.on 'click', toggle_description

  find_job = (did, callback) ->
    job_api = new CB.JobApi()
    job_api.find_job_by_did did, (job_data) ->
      job_view = new CB.JobView(job_data)
      callback job_view

  get_self = (element) ->
    $(element).data 'view'

  toggle_description = ->
    self = get_self(@)
    job_view = self.element.data 'job_view'
    job_view.element.toggle 200