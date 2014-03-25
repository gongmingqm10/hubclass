class ApiController < ActionController::Base
  skip_before_action :verify_authenticity_token

  before_filter :escape_html
  respond_to :json

  protected

  def found?(*args)
    if (args.all? { |arg| arg != nil })
      yield if block_given?
      return true
    else
      render status: :not_found, json: {}
      return false
    end
  end

  def valid?(target)
    errors = target.respond_to?(:errors) ? target.errors : target
    if errors.empty?
      yield if block_given?
      return true
    else
      render status: :bad_request, json: errors
      return false
    end
  end

  def current_user
    session[:user_id]
  end

  def escape_html
    escape_value_in_hash(params || {})
    escape_nested_value_in_hash(params[:content] || {})
  end

  def escape_value_in_hash(content)
    content.each_pair do |key, value|
      case value
        when String
          content[key] = CGI::escapeHTML(value)
      end
    end
  end

  def escape_nested_value_in_hash(content)
    content.each_pair do |key, value|
      case value
        when String
          content[key] = CGI::escapeHTML(value)
        when Hash
          escape_value_in_hash(value)
      end
    end
  end

end