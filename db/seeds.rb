
tmp_dir = Rails.root.join('tmp')

# products

ph_dir = "#{tmp_dir}/seed_files"

p1_name = 'nebulizador'
p1_photo = "#{p1_name}.jpeg"
p1 = Product.create(name: p1_name)
p1.photo.attach(io: File.open("#{ph_dir}/#{p1_photo}"), filename: p1_photo)

p2_name = 'fones-de-ouvido'
p2_photo = "#{p2_name}.png"
p2 = Product.create(name: p2_name)
p2.photo.attach(io: File.open("#{ph_dir}/#{p2_photo}"), filename: p2_photo)

p3_name = 'dispenser'
p3_photo = "#{p3_name}.jpg"
p3 = Product.create(name: p3_name)
p3.photo.attach(io: File.open("#{ph_dir}/#{p3_photo}"), filename: p3_photo)

p4_name = 'passadeira-portatil'
p4_photo = "#{p4_name}.png"
p4 = Product.create(name: p4_name)
p4.photo.attach(io: File.open("#{ph_dir}/#{p4_photo}"), filename: p4_photo)
