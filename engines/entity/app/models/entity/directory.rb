module Entity
  class Directory < ActiveRecord::Base
    belongs_to :state, class_name: "State"
    belongs_to :born_state, class_name: "State"
    belongs_to :cadastre
    
    scope :by_cpf, -> (value) { where(cpf: value)}
    scope :by_name, -> (value) { where("name ILIKE '%#{value}%'")}
    scope :by_job, -> (value) { where(job: value)}

    enum job: ['presidente', 'diretor', 'assessor']
    
    validates :name, :rg, :born, :state, :city, presence: true
    validates :email, email: true, presence: true
    validates :cpf, cpf: true, presence: true
    validates_uniqueness_of :cpf, scope: :cadastre
    validates :address, :cep, presence: true
    validates :job, presence: true

    validate :unique_president

    private

    def unique_president
      if Entity::Directory.where(cadastre_id: self.cadastre_id, job: 0).present?
        errors.add(:job, 'Já existe um presidente cadastrado')
      end
    end
  end
end
