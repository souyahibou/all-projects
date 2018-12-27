class ProjectsController < ApplicationController
    protect_from_forgery except: [:federdo_calculatrice, :googleMapsAPI_THP_P43, :html_forms]
    @@counter = false;     def self.counter()  @@counter  end

      def initialize
          @var
      end

      def home
          @@counter = !@@counter if request.post? && params[:basic_layout].nil?    #used by [un]color button
          layout_type = params[:basic_layout].nil?? 'application' : 'application_base'
          render action: 'home',:layout => layout_type, formats: [:html]
      end

      def scraping_facebook
          @var = ScrapFbPros.new.perform
          render :json => @var
      end

      def scraping_google_calendar
          @var = ScrapGoogleCal.new.perform
          render :json => @var
      end
      def scraping_sites_pro
          @var = ScrapUrlsPros.new.perform
          render :json => @var
      end

      def projectsparsing_stage_CAJ_pdf
          @var = SpecialProjects::ScrapCajStage.new(stage_file: params[:project], result_file: params[:result_path], table_name: params[:table]).perform
          render :json => @var
      end

      def scrap1
        @var = SpecialProjects::ScrapCdiscount.new.perform
        render :json => @var
      end

      def reformat
        @var = SpecialProjects::FormatKeysEnv.new.perform
        render :json => @var
      end

      def reformat2
        @var = SpecialProjects::FormatContact.new.perform
        render :json => @var
      end

      def federdo_calculatrice
        @var = (1..5).to_a
        # render :json => @var
        render layout: false
      end

      def testo
        # @var = (1..5).to_a
        # render :json => @var
        render action: 'testo', :layout => 'application', formats: [:html]
      end
      def testo9
        # @var = (1..5).to_a
        # render :json => @var
        render action: 'testo9', :layout => 'application', formats: [:pdf]
        render template: projects_home_path
      end

      def scraping_annuaire_cabinets
        @var = SpecialProjects::ScrapCadremploi.new.perform
        render :json => @var
      end

      def googleMapsAPI_THP_P43
        render layout: false
      end

      def cv
        render action: 'cv', :layout => 'application'#, formats: [:pdf]
      end

      def main
        # redirect_to action: :home
          render action: 'home',:layout => 'application', formats: [:html]
      end

      def displaying_color_names
          @var = SpecialProjects::ColorNames.new.res
          @var2 = SpecialProjects::ColorNames.new.res2
      end

      def scraping_image_tag_to_download
          SpecialProjects::ScrapImageHtmlTag.new.perform
          @var = Dir.glob(["images/*.jpg", "images/*.png", "images/*"])
          render :json => @var
      end

      def scraping_membres_THP_by_slack
          @var = SpecialProjects::ScrapSlackMbr.new.perform
          render :json => @var
      end

      def scraping_annuaire_cabinets2
        @var = SpecialProjects::ScrapCarrierInfo.new.perform
        render :json => @var
      end

      def scraping_annuaire_startups
        @var = SpecialProjects::ScrapUsineDigital.new.perform
        render :json => @var
      end

      def html_forms
      end

      def wiki
        render :inline => "<%= markdown(File.read(Rails.root.join('README.md'))) %>"
      end

      def displaying_status_codes
          @var = SpecialProjects::ListStatusCodes.new.res
      end

end
