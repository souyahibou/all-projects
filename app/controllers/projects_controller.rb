class ProjectsController < ApplicationController
    protect_from_forgery except: :federdo_calculatrice
      def init
          @var
      end

      def home
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

      def parsing_stage_CAJ_pdf
          @var = PDFParseStageCAJProject.new.perform
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
        @var = (1..5).to_a
        render :json => @var
      end

end
