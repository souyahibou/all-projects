require 'net/http'
require 'nokogiri'

END {   puts "Terminating du Programme de Scrap d'images"}
BEGIN {   puts "Initialition du programme de Scrap d'images"}

class ScrapImageHtmlTag                 #add

    #IO
    def initialize(xpath = nil,filtre = nil,dossier = nil,url_com = nil,url = nil)                    #add
        @XPATH = xpath            || "//img[@data-normal]"
        @FILTRE = filtre          || 'data-normal'
        @DOSSIER = dossier        ||"images"
        @SITE_URL_COMMUM = url_com|| "https://image.slidesharecdn.com/slideshowpwp2018revealvf-180601125402/95/paris-workplace-ifopsfl-2018-reveal-1-638.jpg"
        @URL = url                ||'https://www.slideshare.net/slideshow/embed_code/key/adtv03zfqkcwmj'
        # peut etre redefinir la fonction donwloder | ∀ image, le host soit charger.
    end

    # This script parse and download image files from html documents
    def get_html(url)
      uri = URI(url)
      response = Net::HTTP.start(uri.host, uri.port,
                                  :use_ssl => uri.scheme == 'https') do |http|
        resp = http.get(uri.path)
        case resp
        when Net::HTTPSuccess then
          resp.body
        when Net::HTTPRedirection then
          warn "redirect to #{location}"
          resp.body
        else
          resp.value
        end
      end
    end

    def parse_html(html)
      html_doc = Nokogiri::HTML(html)
      nodes = html_doc.xpath(@XPATH)                       #modified
      raise "No <img .../> tags!" if nodes.empty?
      nodes.inject([]) do |uris, node|
        uris << node.attr(@FILTRE).strip                   #modified
      end.uniq
    end

    def downloader(url, paths)
      host_uri = URI(@SITE_URL_COMMUM)                          #modified ex URI(url)
      Dir.mkdir(@DOSSIER) unless Dir.exist?(@DOSSIER)          #modified
      Net::HTTP.start(host_uri.host, host_uri.port,
                        :use_ssl => host_uri.scheme == 'https') { |http|
        paths.each do |path|
          puts "Downloading: " + path
          begin
            resp = http.get(path)
            open(File.join(@DOSSIER, path.split('/')[-1]), "wb") do |file|
              file.write(resp.body)
            end
          rescue
            test_response(resp)
          end
          puts "--100%--"
        end
      }
    end

    def test_response(resp)
      case resp
      when Net::HTTPServerError
        puts 'HTTPServerError'
      when Net::HTTPClientError
        puts 'HTTPClientError'
      when Net::HTTPRedirection
        puts 'HTTPRedirection'
      when Net::HTTPSuccess
        puts 'OK'
      else
        puts 'UNKNOWN'
      end
    end

    def perform                     #add
    ## process start here
        html = get_html(@URL)
        paths = parse_html(html)
        # download all imgs
        downloader(@URL, paths)
    end
end

#ScrapImageHtmlTag.new.perform        #add
