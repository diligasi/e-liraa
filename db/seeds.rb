# Users
Users.find_or_create_by(name: 'Diogo de Lima', cpf: '126.379.327-40', status: true, role: 'admin', email: 'diogo@e-liraa.com', password: '123456')

# PropertyTypes
PropertyType.find_or_create_by(name: 'Apartamento', description: '')
PropertyType.find_or_create_by(name: 'Casa', description: '')
PropertyType.find_or_create_by(name: 'Prédio', description: '')

# ShedTypes
ShedType.find_or_create_by(name: "CX D'água", description: '')
ShedType.find_or_create_by(name: 'Nível Solo', description: '')
ShedType.find_or_create_by(name: 'Dep. Pequeno', description: '')

# larva_species
LarvaSpecy.find_or_create_by(name: 'Aedes Aegypti', description: '')
LarvaSpecy.find_or_create_by(name: 'Aedes albopictus', description: '')

# institutionals
Institutional.find_or_create_by(phone_numbers: '(21) XXXXX-XXXX', description: 'Tornar o processo de Levantamento de Índice Rápido para Aedes aegypti (LIRAa) mais eficiente e preciso em seu mapeamento de regiões afetadas, qualidade dos dados coletados, redução das perdas de informação durante as coletas e facilitar o acesso e divulgação posterior dos resultados.')
