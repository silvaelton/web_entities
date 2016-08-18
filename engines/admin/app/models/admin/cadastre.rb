module Admin
  class Cadastre < Entity::Cadastre
      
    has_many :directories

    scope :by_acronym,  -> (acron) {where("acronym ILIKE '%#{acron}%'")}
    scope :by_cnpj,     -> (cnpj)  {where(cnpj: cnpj)}

    def self.to_csv(options = {})
 
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |product|
          csv << product.attributes.values_at(*column_names)
        end
      end
    end


    def president
      self.directories.find_by_job(0) rescue nil
    end
  end
end
