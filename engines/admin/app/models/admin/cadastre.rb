module Admin
  class Cadastre < Entity::Cadastre
    
    scope :by_acronym,  -> (acron) {where("acronym ILIKE '%#{acron}%'")}
    scope :by_cnpj,     -> (cnpj)  {where(cnpj: cnpj)}

  end
end
