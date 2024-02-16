require "open-uri"
require Rails.root.join('app/models/service')
require Rails.root.join('app/models/ong')

puts 'Eliminando datos anteriores...'

Booking.destroy_all
Bed.destroy_all
Service.destroy_all
Shelter.destroy_all
Volunteering.destroy_all
Ong.destroy_all
User.destroy_all

puts 'Creando ONG'

ong_user1  = User.create!(email: "ong1@infoappmex.org", password: 123456, role: "ONG")

file = URI.open("https://pbs.twimg.com/profile_images/984958576614694913/LRu6zJV8_400x400.jpg")
ong_acnur = Ong.create!(name: "ACNUR", description: "El ACNUR apoya los esfuerzos del Gobierno de México de salvaguardar los derechos y el bienestar de las personas que se han visto obligadas a huir de sus países. Trabaja en asegurar que las personas que huyen de la violencia y persecución tengan derecho a recibir protección y solicitar asilo. Asimismo, ofrece soluciones duraderas que fomentan la integración en el país a partir de alianzas con socios y comunidades de acogida.", url:"https://www.acnur.org/mx/" , address: "Calz. General Mariano Escobedo 526, Chapultepec Morales, Anzures, 11590 Miguel Hidalgo, Ciudad de México, CDMX" , user: ong_user1)
ong_acnur.photo.attach(io: file, filename: "acnur.jpg", content_type: "image/jpg")
ong_acnur.save!

file = URI.open("https://i.ibb.co/jHj5Sh6/SFIAP.png")
ong_sf = Ong.create!(name: "Sin Fronteras", description: "Somos una organización civil fundada por activistas sociales y académicos en 1995 ante una urgente necesidad de abordar el fenómeno migratorio internacional desde una visión integral que garantizara el respeto a los derechos humanos y promoviera el mejoramiento de las condiciones de vida de los migrantes, refugiados y sus familias, especialmente para aquellos que viajan de manera irregular.", url:"https://sinfronteras.org.mx/" , address: "Carlos Dolci No.96, Col. Alfonso XIII, Alcaldía Álvaro Obregón, C.P. 01460 México, D.F." , user: ong_user1)
ong_sf.photo.attach(io: file, filename: "sf.png", content_type: "image/png")
ong_sf.save!

User.create!(email: "contacto@infoappmex.org", password: 123456, role: "ONG")

puts 'Creando Servicios'

Service.create!(
  name: 'Círculo de Apoyo Familiar',
  description: 'Este programa consiste en brindar espacios seguros y de apoyo emocional para familias migrantes que han llegado a una nueva comunidad. A través de sesiones grupales, se proporciona orientación, asesoramiento y recursos para facilitar su integración y bienestar en el nuevo entorno.',
  date_from: Date.today,
  date_to: Date.today + 7.days,
  ong: ong_acnur
).save!

Service.create!(
  name: 'Jornadas Médicas Móviles',
  description: 'A través de este programa, se organizan jornadas médicas móviles en áreas con alta población migrante. Se ofrecen servicios de atención primaria, revisiones de salud preventivas, vacunación y acceso a información sobre servicios de salud locales, con el fin de garantizar que los migrantes reciban la atención médica adecuada y oportuna.',
  date_from: Date.today + 10.days,
  date_to: Date.today + 20.days,
  ong: ong_acnur
).save!

Service.create!(
  name: 'Talleres de Empoderamiento y Derechos Humanos',
  description: ' Estos talleres tienen como objetivo informar a los migrantes sobre sus derechos humanos, laborales y legales en el país de acogida. Se abordan temas como el acceso a la justicia, la prevención de la explotación laboral y el empoderamiento personal, brindando herramientas para defender sus derechos y combatir la discriminación.',
  date_from: Date.today + 10.days,
  date_to: Date.today + 20.days,
  ong: ong_sf
).save!

Service.create!(
  name: 'Programa de Apoyo Psicológico Individual',
  description: 'Este programa ofrece sesiones de apoyo psicológico individualizado para migrantes que han experimentado traumas, estrés o dificultades emocionales durante su proceso migratorio. Se brinda atención profesional y confidencial para ayudarles a superar sus desafíos emocionales y mejorar su bienestar mental.',
  date_from: Date.today,
  date_to: Date.today + 30.days,
  ong: ong_sf
).save!

Service.create!(
  name: 'Clases de Educación Financiera y Ahorro',
  description: 'A través de este programa, se imparten clases de educación financiera y ahorro diseñadas específicamente para migrantes. Los participantes aprenden habilidades de administración financiera, cómo establecer un presupuesto, cómo manejar el dinero de manera efectiva y la importancia del ahorro a largo plazo para alcanzar sus metas financieras.',
  date_from: Date.today + 15.days,
  date_to: Date.today + 45.days,
  ong: ong_sf
).save!

Service.create!(
  name: 'Feria de Empleo para Migrantes',
  description: 'Esta feria de empleo está dirigida exclusivamente a migrantes en búsqueda de oportunidades laborales. Se invita a empresas locales dispuestas a contratar migrantes y se proporciona asesoramiento sobre cómo acceder al mercado laboral, preparación de currículums y consejos para entrevistas de trabajo.',
  date_from: Date.today + 20.days,
  date_to: Date.today + 25.days,
  ong: ong_acnur
).save!

puts 'Creando Shelters'

shelter = Shelter.create!(name: "Casa Refugio", address: "Milan 45, Cuauhtémoc, CDMX", ong: ong_acnur, max_capacity: 10)

puts(shelter.max_capacity)
shelter.max_capacity.times do
  Bed.create(shelter: shelter)
end

shelter = Shelter.create!(name: "Casa de la Esperanza", address: "Río Becerra 83, Álvaro Obregón, CDMX", ong: ong_sf, max_capacity: 16)

shelter.max_capacity.times do
  Bed.create(shelter: shelter)
end

shelter = Shelter.create!(name: "Refugio de Esperanza", address: "Guanabana 197, CDMX", ong: ong_acnur, max_capacity: 10)

shelter.max_capacity.times do
  Bed.create(shelter: shelter)
end

shelter = Shelter.create!(name: "Casa del Sol", address: "Blvd. Miguel de Cervantes Saavedra 386, Miguel Hidalgo, CDMX", ong: ong_sf, max_capacity: 16)

shelter.max_capacity.times do
  Bed.create(shelter: shelter)
end

shelter = Shelter.create!(name: "Hogar Renacer", address: "Calle de Motolinia 20, CDMX", ong: ong_acnur, max_capacity: 10)

shelter.max_capacity.times do
  Bed.create(shelter: shelter)
end

shelter = Shelter.create!(name: "Refugio del Conocimiento", address: "Av. Universidad 86, Benito Juárez, CDMX", ong: ong_sf, max_capacity: 16)

shelter.max_capacity.times do
  Bed.create(shelter: shelter)
end

shelter = Shelter.create!(name: "Albergue de la Esperanza", address: "Av. Patriotismo 229, CDMX", ong: ong_acnur, max_capacity: 10)

shelter.max_capacity.times do
  Bed.create(shelter: shelter)
end

shelter = Shelter.create!(name: "Casa de la Solidaridad", address: "Av. Universidad 644, CDMX", ong: ong_sf, max_capacity: 16)

shelter.max_capacity.times do
  Bed.create(shelter: shelter)
end
