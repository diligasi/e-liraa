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
