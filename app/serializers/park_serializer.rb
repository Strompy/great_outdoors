class ParkSerializer
  include FastJsonapi::ObjectSerializer
  set_type :park
  attributes :name, :description, :directions
end
