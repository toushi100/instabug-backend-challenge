class ApiError
  attr_accessor :status, :title, :type, :details, :errors

  def initialize(errors, options = {})
    if errors.is_a? ActiveModel::Errors
      @errors = errors.details.keys.map.with_index { |k, idx| [k , errors.full_messages[idx]] }.to_h
    else
      @errors = Array.wrap(errors)
    end
    @status = options[:status] || :bad_request
    @title = options[:title] || @status.to_s
    @type = options[:type] || ""
    @details = options[:details] || "Validation Error"
  end

  def status_code
    Rack::Utils::SYMBOL_TO_STATUS_CODE[@status]
  end

  private
end
