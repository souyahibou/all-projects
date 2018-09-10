class ProjectsController < ApplicationController
    protect_from_forgery except: [:federdo_calculatrice, :googleMapsAPI_THP_P43]
      def initialize
          @var
      end

      def home
          render action: 'home',:layout => 'application', formats: [:html]
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
          @var = ScrapCajStage.new(stage_file: params[:project], result_file: params[:result_path], table_name: params[:table]).perform
          render :json => @var
      end

      def scrap1
        @var = ScrapCdiscount.new.perform
        render :json => @var
      end

      def reformat
        @var = FormatKeysEnv.new.perform
        render :json => @var
      end

      def reformat2
        @var = FormatContact.new.perform
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
      def testo1
        # @var = (1..5).to_a
        # render :json => @var
        render action: 'testo1', :layout => 'application', formats: [:pdf]
      end
      def testo2
        # @var = (1..5).to_a
        # render :json => @var
        render action: 'testo2', :layout => 'application', formats: [:pdf]
      end
      def testo3
        # @var = (1..5).to_a
        # render :json => @var
        render action: 'testo3', :layout => 'application', formats: [:pdf]
      end
      def testo4
        # @var = (1..5).to_a
        # render :json => @var
        render action: 'testo4', :layout => 'application', formats: [:pdf]
      end
      def testo5
        # @var = (1..5).to_a
        # render :json => @var
        render action: 'testo5', :layout => 'application', formats: [:pdf]
      end
      def testo6
        # @var = (1..5).to_a
        # render :json => @var
        render action: 'testo6', :layout => 'application', formats: [:pdf]
      end
      def testo7
        # @var = (1..5).to_a
        # render :json => @var
        render action: 'testo7', :layout => 'application', formats: [:pdf]
      end
      def testo8
        # @var = (1..5).to_a
        # render :json => @var
        render action: 'testo8', :layout => 'application', formats: [:pdf]
      end
      def testo9
        # @var = (1..5).to_a
        # render :json => @var
        render action: 'testo9', :layout => 'application', formats: [:pdf]
      end
      def testo0
        # @var = (1..5).to_a
        # render :json => @var
        render action: 'testo0', :layout => 'application', formats: [:pdf]
      end

      def scraping_annuaire_cabinets
        @var = ScrapCadremploi.new.perform
        render :json => @var
      end

      def googleMapsAPI_THP_P43
        render layout: false
      end

      def cv
        render action: 'cv', :layout => 'application'#, formats: [:pdf]
      end

      def main
        render :home
      end

      def displaying_color_names
          @var = ColorNames.new.res
          @var2 = ColorNames.new.res2
      end

      def scraping_image_tag_to_download
          ScrapImageHtmlTag.new.perform
          @var = Dir.glob(["images/*.jpg", "images/*.png", "images/*"])
          render :json => @var
      end

      def scraping_membres_THP_by_slack
          @var = ScrapSlackMbr.new.perform
          render :json => @var
      end

      def scraping_annuaire_cabinets2
        @var = ScrapCarrierInfo.new.perform
        render :json => @var
      end

      def scraping_annuaire_startups
        @var = ScrapUsineDigital.new.perform
        render :json => @var
      end

end
