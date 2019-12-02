def image_generation

  ship_url = {
    1 => 'horizon',
    2 => 'vista',
    3 => 'breeze',
    4 => 'magic',
    5 => 'dream',
    6 => 'freedomoftheseas',
    7 => 'libertyoftheseas',
    8 => 'symphonyoftheseas',
    9 => 'harmonyoftheseas',
    10 => 'oasisoftheseas',
    11 => 'allureoftheseas',
    12 => 'disneymagic',
    13 => 'disneywonder',
    14 => 'disneydream',
    15 => 'disneyfantasy'
  }

  base = 'http://chunis.org/images/ships/'
  file_type = '.jpg'


  ship_url.each do |id , name|
    (1..8).each do |pic_num|
      url = base + name + pic_num.to_s + file_type
      ShipImage.create(url: url, ship_id: id)
    end
  end
end
