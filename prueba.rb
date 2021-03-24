require "uri"
require "net/http"
require "json"
def request (adress,api_key="R81S5qlaZAWZAFj7zZtSUgq4bw0dGK125dz4b5rk")


    url= URI ("#{adress}&api_key=#{api_key}") 
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    response.read_body
    JSON.parse response.read_body 
end

def build_web_page(request)

    imagenes= request.map {|x| x["img_src"]}

    estructura= "<html>\n<head>\n</head>\n\t<body>\n\t\t<ul>"
    imagenes.each do |z|
        html+="\n\t\t\t<li><img src='#{img}'></li>\n"

    end

    html+="\t\t</ul>\n\t</body>\n</html>"
    return html
end

fotos=build_web_page(request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000")["fotos"])
File.write("fotos_satelite.html",fotos.to_s)

