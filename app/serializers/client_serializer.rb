class ClientSerializer < ActiveModel::Serializer
  attributes :name, :age, :total

  #has_many :memberships

  def total
    object.memberships.sum(:charge)
  end
end
