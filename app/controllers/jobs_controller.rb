class JobsController < ApplicationController
  def index
    results = find_jobs
    render json: { jobs: results, info: info(results) }
  end

  def show
    job = find_job params[:id]
    render json: job
  end

  private

  def find_jobs
    keywords = params[:keywords]
    location = params[:location]
    Rails.cache.fetch "JobSearch #{keywords} #{location}" do
      Cb.job_search_criteria.keywords(keywords).location(location).search
    end
  end

  def find_job(did)
    Rails.cache.fetch "JobDetails #{did}" do
      Cb.job.find_by_did did
    end
  end

  def info(results)
    {
      total_count: results.cb_response.total_count,
      city: results.cb_response.city,
      state_code: results.cb_response.state_code,
      postal_code: results.cb_response.postal_code
    }
  end
end