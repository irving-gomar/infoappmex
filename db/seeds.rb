require "open-uri"

ong_user1  = User.create!(email: "ong1@infoappmex.org", password: 123456, role: "ONG")

file = URI.open("https://pbs.twimg.com/profile_images/984958576614694913/LRu6zJV8_400x400.jpg")
ong_acnur = Ong.create!(name: "ACNUR", description: "El ACNUR apoya los esfuerzos del Gobierno de México de salvaguardar los derechos y el bienestar de las personas que se han visto obligadas a huir de sus países. Trabaja en asegurar que las personas que huyen de la violencia y persecución tengan derecho a recibir protección y solicitar asilo. Asimismo, ofrece soluciones duraderas que fomentan la integración en el país a partir de alianzas con socios y comunidades de acogida.", url:"https://www.acnur.org/mx/" , address: "Calz. General Mariano Escobedo 526, Chapultepec Morales, Anzures, 11590 Miguel Hidalgo, Ciudad de México, CDMX" , user: ong_user1)
ong_acnur.photo.attach(io: file, filename: "acnur.jpg", content_type: "image/png")
ong_acnur.save!