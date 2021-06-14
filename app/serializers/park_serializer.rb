class ParkSerializer
  include FastJsonapi::ObjectSerializer
  set_type :forecast
  attributes :name, :description, :directions
end
