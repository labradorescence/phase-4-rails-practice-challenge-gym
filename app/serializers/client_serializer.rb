class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total

  #has_many :memberships

  def total
    #byebug
    #self.object.memberships.map {|each| each.charge}.sum
    self.object.memberships.sum(:charge)
  end
end