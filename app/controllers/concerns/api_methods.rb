module ApiMethods

  extend ActiveSupport::Concern

  # JSONP Filter
  included do
    after_filter do |controller|
      if controller.params[:callback]
        controller.response['Content-Type'] = 'application/javascript'
        controller.response.body = "%s(%s)" % [controller.params[:callback], controller.response.body]
      end
    end
  end

  def success args={}
    @message = args[:message]
    @resource = args[:resource]
    @status = 'success'
    render 'api/v1/status/status', status: 200
  end

  def error args={}
    @message = args[:message]
    @errors = args[:errors]
    @status = 'error'
    render 'api/v1/status/status', status: 400
  end

  def unprocessable args={}
    @message = args[:message]
    @errors = args[:errors]
    @status = 'error'
    render 'api/v1/status/status', status: 400
  end

  def not_allowed args={}
    @message = args[:message]
    @status = 'forbidden'
    render 'api/v1/status/status', status: 401
  end

end
