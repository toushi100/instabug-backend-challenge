class ApplicationSerializer < Blueprinter::Base
  # identifier :id
  field :object_type do |object|
    object.class.name
  end
  field :created_at, if: ->(_field_name, obj, options) { obj.respond_to? :created_at }
  field :updated_at, if: ->(_field_name, obj, options) { obj.respond_to? :updated_at }
end
