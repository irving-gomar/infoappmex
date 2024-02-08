require "open-uri"
require Rails.root.join('app/models/service')
require Rails.root.join('app/models/ong')

ong_user1  = User.create!(email: "ong1@infoappmex.org", password: 123456, role: "ONG")

file = URI.open("https://pbs.twimg.com/profile_images/984958576614694913/LRu6zJV8_400x400.jpg")
ong_acnur = Ong.create!(name: "ACNUR", description: "El ACNUR apoya los esfuerzos del Gobierno de México de salvaguardar los derechos y el bienestar de las personas que se han visto obligadas a huir de sus países. Trabaja en asegurar que las personas que huyen de la violencia y persecución tengan derecho a recibir protección y solicitar asilo. Asimismo, ofrece soluciones duraderas que fomentan la integración en el país a partir de alianzas con socios y comunidades de acogida.", url:"https://www.acnur.org/mx/" , address: "Calz. General Mariano Escobedo 526, Chapultepec Morales, Anzures, 11590 Miguel Hidalgo, Ciudad de México, CDMX" , user: ong_user1)
ong_acnur.photo.attach(io: file, filename: "acnur.jpg", content_type: "image/png")
ong_acnur.save!

User.create(email: "contacto@infoappmex.org", password: 123456, role: "ONG")

Service.create(
  name: 'Asistencia para 1',
  description: 'Asistencia para...',
  date_from: Date.today,
  date_to: Date.today + 7.days,
  ong: ong_acnur
).save!

Service.create(
  name: 'Asistencia de 2',
  description: 'Asistencia de...',
  date_from: Date.today + 10.days,
  date_to: Date.today + 20.days,
  ong: ong_acnur
).save!

Service.create(
  name: 'Asistencia de 3',
  description: 'Asistencia de...',
  date_from: Date.today + 10.days,
  date_to: Date.today + 20.days,
  ong: ong_acnur
).save!
