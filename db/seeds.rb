@user = Admin::User.new
@user.first_name      =  'dev'
@user.last_name       =  'desk'
@user.email           = 'dev@dev.com'
@user.password_digest = 'd123456789'
@user.password_confirmation = 'd123456789'
@user.situation       = 0
@user.permission      = 0

@user.save!
=begin
State.create(acronym: "AC", name: "Acre")
State.create(acronym: 'AL', name: 'Alagoas');
State.create(acronym: 'AM', name: 'Amazonas');
State.create(acronym: 'AP', name: 'Amapá');
State.create(acronym: 'BA', name: 'Bahia');
State.create(acronym: 'CE', name: 'Ceará');
State.create(acronym: 'DF', name: 'Distrito Federal');
State.create(acronym: 'ES', name: 'Espírito Santo');
State.create(acronym: 'GO', name: 'Goiás');
State.create(acronym: 'MA', name: 'Maranhão');
State.create(acronym: 'MG', name: 'Minas Gerais');
State.create(acronym: 'MS', name: 'Mato Grosso do Sul');
State.create(acronym: 'MT', name: 'Mato Grosso');
State.create(acronym: 'PA', name: 'Pará');
State.create(acronym: 'PB', name: 'Paraíba');
State.create(acronym: 'PE', name: 'Pernambuco');
State.create(acronym: 'PI', name: 'Piauí');
State.create(acronym: 'PR', name: 'Paraná');
State.create(acronym: 'RJ', name: 'Rio de Janeiro');
State.create(acronym: 'RN', name: 'Rio Grande do Norte');
State.create(acronym: 'RR', name: 'Roraima');
State.create(acronym: 'RO', name: 'Rondônia');
State.create(acronym: 'RS', name: 'Rio Grande do Sul');
State.create(acronym: 'SC', name: 'Santa Catarina');
State.create(acronym: 'SE', name: 'Sergipe');
State.create(acronym: 'SP', name: 'São Paulo');
State.create(acronym: 'TO', name: 'Tocantins');
=end