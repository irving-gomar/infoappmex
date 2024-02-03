require "open-uri"

contacto = User.create!(email: "contacto@infoappmex.org", password: 123456, role: "ONG")

ong1_user = User.create!(email: "ong1@infoappmex.org", password: 123456, role: "ONG")


file = URI.open("https://pbs.twimg.com/profile_images/984958576614694913/LRu6zJV8_400x400.jpg")
ong_acnur = Ong.create!(name: "ACNUR", description: "Nuestro objetivo principal en ACNUR es salvaguardar los derechos y el bienestar de las personas que se han visto obligadas a huir.
  Junto con socios y comunidades, trabajamos para garantizar que todas las personas tengan derecho a solicitar asilo y encontrar un refugio seguro en otro país. También nos esforzamos por asegurar soluciones duraderas.", address: "Calz. General Mariano Escobedo 526
  Chapultepec Morales, Anzures
  11590 Miguel Hidalgo, Ciudad de México, CDMX", user: ong1_user)
ong_acnur.photo.attach(io: file, filename: "acnur.png", content_type: "image/png")
ong_acnur.save
