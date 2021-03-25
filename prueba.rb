require "uri"

require "net/https"

require "json"

def request(address, api_key="R81S5qlaZAWZAFj7zZtSUgq4bw0dGK125dz4b5rk") 
    url = URI("#{address}&api_key=#{api_key}")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    response.read_body
    JSON.parse response.read_body  

end


def build_web_page(request)

    fotos_satelite = request.map{ |filter| filter['img_src'] } 

    pagina = "<html>\n<head>\n</head>\n\t<body>\n\t\t<ul>" 

    fotos_satelite.each do |img|

    pagina += "\n\t\t\t<li><img src='#{img}'></li>\n" 

    end

    pagina += "\t\t</ul>\n\t</body>\n</html>" 

    return pagina

end

photos = build_web_page(request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000')["photos"])

File.write('imagenes_satelite.html', photos.to_s)




