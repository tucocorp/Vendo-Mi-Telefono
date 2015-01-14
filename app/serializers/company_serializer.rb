class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :contact_phone
end
