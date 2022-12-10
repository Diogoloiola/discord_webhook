require_relative 'types'

class BaseModel < Dry::Struct
  transform_keys(&:to_sym)
end
