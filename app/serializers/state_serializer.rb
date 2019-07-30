class StateSerializer < ActiveModel::Serializer
  attributes :id, :state_name, :name

  def name
  	return 'vaishali'
  end 
end
