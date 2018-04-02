class ProjectsController < ApplicationController
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

      def testo
        @var = (1..5).to_a
        render :json => @var
      end
end
