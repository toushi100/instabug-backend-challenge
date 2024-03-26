class V1::ErrorSerializer < Blueprinter::Base
  fields :details, :type, :title, :errors, :status_code
end
