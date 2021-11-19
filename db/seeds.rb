# Department ========================================================================================
department = { name: 'Secretaria Municipal de Saúde de Niterói', description: 'www.saude.niteroi.rj.gov.br - Rua Visconde de Sepetiba, 987, 8° andar - Niterói - Tel: (21) 2716-5800 - Designer: C. S. Rodrigues' }
current_department = Department.find_or_create_by(department)

# Regions ============================================================================================
[
  { name: '1A', department: current_department },
  { name: '1B', department: current_department },
  { name: '2A', department: current_department },
  { name: '2B', department: current_department },
  { name: '3A', department: current_department }
].each do |region|
  Region.find_or_create_by(region)
end

# PropertyTypes ======================================================================================
[
  { name: 'Residência', description: 'Moradia fixa em determinado lugar; casa, apartamento.' },
  { name: 'Terreno Baldio', description: 'Terreno abandonado ou sem dono.' },
  { name: 'Comércio', description: 'Estabelecimento comercial seja ele para a venda de produtos físicos ou serviços.' },
  { name: 'Ponto Estratégico', description: '' },
  { name: 'Outros', description: '' }
].each do |property_type|
  PropertyType.find_or_create_by(property_type)
end

# ShedTypes ==========================================================================================
[
  { name: "CX D'água", description: 'Tanque destinado a armazenar água para consumo humano, agrícola ou qualquer outra função que requeira o uso da mesma.' },
  { name: 'Depósito Fixo', description: '' },
  { name: 'Depósito Natural', description: '' },
  { name: 'Dep. Pequeno', description: '' },
  { name: 'Lixo (depositos)', description: '' },
  { name: 'Nível Solo', description: '' },
  { name: 'Pneus', description: '' }
].each do |shed_type|
  ShedType.find_or_create_by(shed_type)
end

# LarvaSpecies =======================================================================================
[
  { name: 'Aedes Aegypti', description: '' },
  { name: 'Aedes albopictus', description: '' },
  { name: 'Outras', description: '' }
].each do |larva_specy|
  LarvaSpecy.find_or_create_by(larva_specy)
end

# Institutionals =====================================================================================
Institutional.find_or_create_by(phone_numbers: '(21) XXXXX-XXXX', description: 'Tornar o processo de Levantamento de Índice Rápido para Aedes aegypti (LIRAa) mais eficiente e preciso em seu mapeamento de regiões afetadas, qualidade dos dados coletados, redução das perdas de informação durante as coletas e facilitar o acesso e divulgação posterior dos resultados.')

if Rails.env.development?
  User.find_or_create_by(name: 'Diogo', cpf: '12637932740', status: 1, role: 0, email: 'diogo@olhaedes.com') { |user| user.password = '369311' }
  User.find_or_create_by(name: 'Supervisor', cpf: '61057263095', status: 1, role: 1, email: 'supervisor@olhaedes.com') { |user| user.password = '123456' }
  User.find_or_create_by(name: 'Laboratório', cpf: '41200975014', status: 1, role: 2, email: 'lab@olhaedes.com') { |user| user.password = '123456' }
  User.find_or_create_by(name: 'Agente', cpf: '05450674058', status: 1, role: 3, email: 'field@olhaedes.com') { |user| user.password = '123456' }
end
