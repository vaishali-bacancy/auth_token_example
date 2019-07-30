class AddressSerializer < ActiveModel::Serializer
  attributes :id, :state, :place


  def state
    {state_id: self.object.state.id, 
     state_name: self.object.state.state_name}
  end

  def place
    {place_id: self.object.place.id, 
     place_name: self.object.place.place_name}
  end 
end
